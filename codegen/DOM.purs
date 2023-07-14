module DOM where

import Prelude

import Control.Monad.Except (ExceptT(..))
import Control.Monad.ST (foreach)
import DOM.Attr as Attr
import DOM.Common (TypeStub, attributeMember, camelCaseOn, capitalize, capitalize, escape, mapType, resolveInterface, validTag)
import DOM.Elt as Elt
import DOM.Spec (Definition, IDL, Tag)
import Data.Array as Array
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Set (Set)
import Data.Set as Set
import Data.Traversable (foldl, for)
import Data.Tuple (snd)
import Data.Tuple.Nested (type (/\), (/\))
import Debug as Debug
import Effect.Aff (Aff, Error, attempt)
import FS as FS
import Foreign.Object as Foreign
import Foreign.Object.ST as Foreign.ST
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Partial.Unsafe (unsafePartial)
import Tidy.Codegen (module_, printModule)

-- | Crawls through the spec finding all attributes for given interface and all inheriting interfaces
crawlInterfaces :: IDL -> Set String /\ Set ( String /\ TypeStub ) -> String -> Set String /\ Set ( String /\ TypeStub )
crawlInterfaces idl acc@( seen /\ members ) intf = case resolveInterface idl intf of
    Just ( interface /\ inherits ) -> do
        let 
            direct :: Set ( String /\ TypeStub )
            direct = Set.fromFoldable do
                member <- fromMaybe [] interface.members
                attributeName /\ attributeType <- attributeMember member
                mapped <- mapType attributeType
                pure $ attributeName /\ mapped

            found :: Set String
            found = 
                Set.fromFoldable inherits

        foldl
            ( crawlInterfaces idl )
            ( Set.union seen found /\ Set.union members direct )
            ( Set.difference found seen )

    Nothing ->
        acc

generate :: Array Definition -> Array Tag -> IDL -> ExceptT Error Aff Unit
generate _ tags idl = do
    FS.createDir "lib/deku-dom/Deku/DOM/Elt"

    elts <- for ( Array.mapMaybe validTag tags ) \( tag /\ interface ) -> do
        let name = escape tag
            cap = capitalize name  
            typeName = cap <> "_"
            elt = { name, type: typeName, tag : name, module : "Deku.DOM.Elt." <> cap, interface }

        ExceptT $ attempt
            $ writeTextFile UTF8 ( "./lib/deku-dom/Deku/DOM/Elt/" <> cap <> ".purs" )
            $ printModule
            $ unsafePartial
            $ module_ ( elt.module ) [] Elt.imports
            $ Elt.generate elt
        
        pure elt
    
    let
        transposed :: Foreign.Object ( Set ( TypeStub /\ Elt.Elt ) )
        transposed = Foreign.runST do
            attrs <- Foreign.ST.new
            foreach elts \elt -> do
                foreach ( Array.fromFoldable $ snd $ crawlInterfaces idl mempty elt.interface ) \( attrName /\ attrType ) -> do
                    found <- Foreign.ST.peek attrName attrs
                    let existing = fromMaybe Set.empty found
                    void $ Foreign.ST.poke attrName ( Set.insert ( attrType /\ elt ) existing ) attrs

            pure attrs
    
    FS.createDir "lib/deku-dom/Deku/DOM/Attr"

    attrs <- for ( Foreign.toUnfoldable transposed :: Array _ ) \( attrName /\ typeAndElts ) -> do
        let name = camelCaseOn $ escape attrName
            cap = capitalize name
            attr = { name, srcName: attrName, type : cap, module : "Deku.DOM.Attr." <> cap }

        ExceptT $ attempt
            $ writeTextFile UTF8 ( "./lib/deku-dom/Deku/DOM/Attr/" <> cap <> ".purs" )
            $ printModule
            $ unsafePartial
            $ module_ ( attr.module ) [] 
                ( Attr.imports typeAndElts )
                ( Attr.generate attr typeAndElts )

        pure attr

    pure unit