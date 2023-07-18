module DOM.Indexed where

import Prelude

import Control.Monad.Except (ExceptT(..))
import DOM.Common (correctionInterfaces, correctionKeyword, resolveInterface, unSnake, validTag, webElements)
import DOM.Indexed.Common (Keyword, requires)
import DOM.Indexed.Elements as Elements
import DOM.Indexed.Interfaces as Interfaces
import DOM.Indexed.Props as Props
import DOM.Indexed.Self as Self
import DOM.Indexed.Values as Values
import DOM.Spec (Definition, IDL, Interface, Tag)
import Data.Array as Array
import Data.Maybe (Maybe(..), maybe)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Effect.Aff (Aff, Error, attempt)
import FS as FS
import Foreign.Object as Foreign
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Partial.Unsafe (unsafePartial)
import Tidy.Codegen (module_, printModule)

generate :: Array Definition -> Array Tag -> IDL -> ExceptT Error Aff Unit
generate keywordSpec tagSpec ifSpec = do
    let
        tags ::Foreign.Object String
        tags =
            Foreign.fromFoldable
                $ Array.mapMaybe validTag tagSpec

        interfaces :: Foreign.Object ( Interface /\ Array String ) 
        interfaces = do
            let initial = Set.mapMaybe correctionInterfaces ( Set.fromFoldable $ Foreign.values tags )
            Foreign.fromFoldable
                $ flip Array.mapMaybe ( crawlInterfaces ifSpec initial initial ) \intfName ->
                    Tuple intfName <$> resolveInterface ifSpec intfName

        keywords :: Array Keyword
        keywords =
            Array.mapMaybe
                (\( v /\ attribute ) -> (\( name /\ value ) -> { name, value, attribute : unSnake attribute } ) <$> correctionKeyword v )
                do
                    dfn <- keywordSpec
                    text <- dfn.linkingText
                    for <- Array.nub $ Array.mapMaybe forAttribute dfn.for
                    pure $ text /\ for

            where

            forAttribute :: String -> Maybe String
            forAttribute f =
                case String.split ( String.Pattern "/" ) f of
                    [ _, attr ] ->
                        Just attr
                    
                    _ ->
                        Nothing
        
        uniqueKeywords :: Array Values.Keyword
        uniqueKeywords =
            ( Array.nub $ map (\{ name, value } -> { name, value } ) keywords )

        attributes :: Foreign.Object ( Array Props.AttributeType )
        attributes =
            Props.coalesceAttributes keywords interfaces

    FS.dump "dump.json" $ crawlInterfaces ifSpec ( Set.singleton "GlobalEventHandlers" ) ( Set.singleton "GlobalEventHandlers" )

    FS.createDir "lib/deku-dom-indexed/Deku/DOM/Indexed"

    ExceptT $ attempt
        $ writeTextFile UTF8 "./lib/deku-dom-indexed/Deku/DOM/Indexed.purs"
        $ printModule
        $ unsafePartial
        $ module_ "Deku.DOM.Indexed" []
            requires
            ( Array.concat 
                [ Interfaces.generate interfaces
                , Elements.generate tags
                , Props.generate attributes
                , Values.generate uniqueKeywords
                ]
            )

    ExceptT $ attempt
        $ writeTextFile UTF8 "./lib/deku-dom-indexed/Deku/DOM/Indexed/Self.purs"
        $ printModule
        $ unsafePartial
        $ module_ "Deku.DOM.Indexed.Self" []
            ( Self.imports webElements )
            ( Self.generates webElements )

-- | Crawls through the given set finding all inherited interfaces of a given set of interfaces.
crawlInterfaces :: IDL -> Set String -> Set String -> Array String
crawlInterfaces _ seen next | Set.isEmpty next = Set.toUnfoldable seen
crawlInterfaces spec seen next = do
    let found :: Set String
        found = Set.fromFoldable $ Array.foldMap ( maybe [] snd <<< resolveInterface spec ) $ Set.toUnfoldable next
    
    crawlInterfaces spec ( Set.union seen found ) ( Set.difference found seen )