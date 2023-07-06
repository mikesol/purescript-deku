module DOM.Indexed where

import Prelude

import Control.Monad.Except (ExceptT(..))
import DOM.Common (correctionInterfaces, correctionKeyword, crawlInterfaces, resolveInterface, unSnake)
import DOM.Indexed.Common (AttributeType, Keyword, requires)
import DOM.Indexed.Elements as Elements
import DOM.Indexed.Interfaces as Interfaces
import DOM.Indexed.Props as Props
import DOM.Indexed.Values as Values
import DOM.Spec (Definition, IDL, Interface, Tag)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.String as String
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Effect.Aff (Aff, Error, attempt)
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
            Foreign.fromFoldable $ map (\{ name, interface } -> name /\ interface ) tagSpec

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

        attributes :: Foreign.Object ( Array AttributeType )
        attributes =
            Props.coalesceAttributes keywords interfaces

    ExceptT $ attempt
        $ writeTextFile UTF8 "./lib/deku-dom-indexed/Deku/DOM/Indexed.purs"
        $ printModule
        $ unsafePartial
        $ module_ "Deku.DOM.Indexed" 
            ( Array.concat
                [ Elements.exports tags
                , Interfaces.exports interfaces
                , Values.exports uniqueKeywords
                , Props.exports attributes
                ]
            )
            requires
            ( Array.concat 
                [ Elements.generate tags
                , Interfaces.generate interfaces
                , Values.generate uniqueKeywords
                , Props.generate attributes
                ]
            )