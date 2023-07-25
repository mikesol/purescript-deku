module DOM where

import Prelude

import Comment (commentModule)
import Control.Monad.Except (ExceptT(..))
import DOM.Attr as Attr
import DOM.Common (Attribute, Ctor(..), Element, Interface, Specification, TagNS, attrModule, attrType, baseInterfaces, capitalize, eltModule, namespaceBases, webElements)
import DOM.Elt as Elt
import DOM.Reexport as Reexport
import Data.Array as Array
import Data.Function (on)
import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Newtype (un)
import Data.Set (Set)
import Data.Set as Set
import Data.Traversable (for_)
import Data.Tuple.Nested (type (/\), (/\))
import Effect.Aff (Aff, Error, attempt)
import FS as FS
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Partial.Unsafe (unsafePartial)
import Safe.Coerce (coerce)
import Tidy.Codegen (module_, printModule)

-- | Crawls through the spec finding all attributes for given interface and all inheriting interfaces. Uses the fact
-- | currently all interfaces only have a inheritance depth of 1.
crawlInterfaces :: TagNS -> Map Ctor Interface -> Ctor -> Array Attribute
crawlInterfaces ns interfaces intf@( Ctor name ) =
    if name `Array.elem` namespaceBases ns then
        []
    else case Map.lookup intf interfaces of
        Just { members, bases : [] } ->
            members
        
        Just { members, bases } -> members <> bind bases ( crawlInterfaces ns interfaces ) 
        
        Nothing ->
            []

generate :: Specification -> Specification -> ExceptT Error Aff Unit
generate html svg = do
    FS.createDir "deku-dom/src/Deku/DOM/Elt"

    let
        -- TODO: title is actually specified in both HTML and SVG
        elements :: Array Element
        elements =
            Array.nubBy ( compare `on` _.tag ) $ html.elements <> svg.elements

        interfaces :: Map Ctor Interface
        interfaces = Map.fromFoldable $ map (\attr@{ ctor } -> ctor /\ attr )  $ html.interfaces <> svg.interfaces
        
    for_ elements \element -> do
        ExceptT $ attempt
            $ writeTextFile UTF8 ( "./deku-dom/src/Deku/DOM/Elt/" <> capitalize ( un Ctor element.ctor ) <> ".purs" )
            $ printModule
            $ unsafePartial
            $ module_ ( eltModule element.ctor ) [] Elt.imports
            $ Elt.generate element

    let
        elementAttributes :: Map Ctor ( Set ( Attribute /\ Element ) )
        elementAttributes =
            Map.fromFoldableWith Set.union do
                elt <- elements
                attr <- crawlInterfaces elt.ns interfaces elt.interface

                pure $ attr.index /\ Set.singleton ( attr /\ elt )

    FS.createDir "deku-dom/src/Deku/DOM/Attr"

    for_ ( Map.toUnfoldable elementAttributes :: Array _ ) \( index /\ attrAndElts ) -> do
        ExceptT $ attempt
            $ writeTextFile UTF8 ( "./deku-dom/src/Deku/DOM/Attr/" <> attrType index <> ".purs" )
            $ printModule
            $ unsafePartial
            $ module_ ( attrModule index ) [] 
                ( Attr.imports attrAndElts )
                ( Attr.generate attrAndElts )

    let
        globalAttributes :: Array Attribute
        globalAttributes = do
            Array.concatMap _.members
                $ Array.fromFoldable
                $ Map.values
                $ Map.filterKeys ( ( _ `Array.elem` baseInterfaces ) <<< coerce ) interfaces

    for_ globalAttributes \attr -> do
        ExceptT $ attempt
            $ writeTextFile UTF8 ( "./deku-dom/src/Deku/DOM/Attr/" <> attrType attr.index <> ".purs" )
            $ printModule
            $ unsafePartial
            $ module_ ( attrModule attr.index ) [] 
                ( Attr.importsEverything attr.type )
                ( Attr.generateEverything attr )

    let
        attributes :: Array Ctor
        attributes =
            Array.nub $ Array.fromFoldable ( Map.keys elementAttributes ) <> ( _.index <$> globalAttributes )

    ExceptT $ attempt
        $ writeTextFile UTF8 ( "./deku-dom/src/Deku/DOM.purs" )
        $ printModule
        $ unsafePartial
        $ commentModule
            [ "This large, unwieldy module contains reexports of all the DOM elements plus a few extra functions"
            , "for working with the DOM. It just documents the esoteric bits, namely `Self`, `SelfT`, and `unsafeCustomElement`."
            ]
        $ module_ "Deku.DOM"
            ( Reexport.exports elements attributes )
            ( Reexport.imports elements attributes webElements )
            ( Reexport.generate elements webElements )
            