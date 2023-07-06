module Main where

import Prelude

import Control.Monad.Except (ExceptT(..), except, runExceptT, withExceptT)
import DOM as DOM
import DOM.Indexed as Indexed
import DOM.Spec (IDL, InterfaceSpec, KeywordSpec, Mixin(..), Tag, TagSpec, mergeIDL)
import Data.Argonaut.Decode (class DecodeJson, JsonDecodeError, decodeJson, parseJson, printJsonDecodeError)
import Data.Array as Array
import Data.Either (Either(..), blush)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff, Error, attempt, error, launchAff_, message)
import Effect.Aff.Class (liftAff)
import Effect.Class.Console as Console
import Fetch (fetch)
import Foreign.Object as Foreign
import Node.Encoding (Encoding(..))
import Node.FS.Aff (mkdir, readTextFile, stat, writeTextFile)
import Node.Path as Path
import Parser as Parser

main :: Effect Unit
main = launchAff_ do
    r <- runExceptT generate
    for_ ( blush r ) \e -> do
        Console.log $ message e

htmlTagReference :: String
htmlTagReference = 
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/html.json"

htmlInterfaceReference :: String
htmlInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/html.json"

keywordReference :: String
keywordReference = 
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html.json"

domInterfaceReference :: String
domInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/dom.json"

svgTagReference :: String
svgTagReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/SVG2.json"

svgInterfaceReference :: String
svgInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/SVG2.json"

ariaInterfaceReference :: String
ariaInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/wai-aria-1.2.json"

cachedFetch :: forall t . DecodeJson t => String -> String -> ExceptT Error Aff t
cachedFetch cacheName url = do
    file <- liftAff $ attempt $ readTextFile UTF8 cacheName
    text <- case file of
        Left _ -> do
            tagFetch <- ExceptT $ attempt $ fetch url {}
            txt <- liftAff tagFetch.text
            void $ liftAff $ attempt $ writeTextFile UTF8 cacheName txt
            pure txt   

        Right txt ->
            pure txt

    json <- withExceptT fromJsonError $ except $ parseJson text
    withExceptT fromJsonError $ except $ decodeJson json :: _ t

    where
    
    fromJsonError :: JsonDecodeError -> Error
    fromJsonError = 
        printJsonDecodeError >>> error

prepareDir :: Array String -> ExceptT Error Aff Unit
prepareDir dirs = do
    let 
        paths :: Array String
        paths = Array.scanl (\l r -> Path.concat [ l, r ] ) "." dirs

    for_ paths \dir -> do
        exists <- liftAff $ attempt $ stat dir
        case exists of
            Left _ ->
                liftAff $ mkdir dir

            _ ->
                pure unit

generate :: ExceptT Error Aff Unit
generate = do
    prepareDir [ "codegen", "cache", "html" ]
    prepareDir [ "codegen", "cache", "svg" ]
    prepareDir [ "codegen", "cache", "aria" ]

    keywordSpec <- cachedFetch "./codegen/cache/html/keyword.json" keywordReference :: _ KeywordSpec

    htmlTagSpec <- cachedFetch "./codegen/cache/html/tags.json" htmlTagReference :: _ TagSpec
    htmlInterfaceSpec <- cachedFetch "./codegen/cache/html/interface.json" htmlInterfaceReference :: _ InterfaceSpec

    ariaInterfaceSpec <- cachedFetch "./codegen/cache/dom/interface.json" ariaInterfaceReference :: _ InterfaceSpec

    svgTagSpec <- cachedFetch "./codegen/cache/svg/tags.json" svgTagReference :: _ TagSpec
    svgInterfaceSpec <- cachedFetch "./codegen/cache/svg/interface.json" svgInterfaceReference :: _ InterfaceSpec

    let
        -- | We could parse and union the actual spec but it contains mostly empty garbage and the only thing we are 
        -- | interested in is the link to ARIA.
        domSpec :: IDL
        domSpec = 
            { idlNames : Foreign.singleton "Element"
                { type : "interface"
                , name : "Element"
                , inheritance : Nothing
                , members : Nothing
                , fragment : ""
                }
            , idlExtendedNames : Foreign.singleton "Element"
                [ Includes
                    { fragment : ""
                    , includes : "ARIAMixin"
                    }
                ]
            }

        tagSpec :: Array Tag
        tagSpec = Array.concat
            [ htmlTagSpec.elements
            , svgTagSpec.elements
            ]

        interfaceSpec :: IDL
        interfaceSpec =
            mergeIDL domSpec
                $ mergeIDL htmlInterfaceSpec.idlparsed
                $ mergeIDL svgInterfaceSpec.idlparsed ariaInterfaceSpec.idlparsed


    Indexed.generate keywordSpec.dfns tagSpec interfaceSpec
    DOM.generate keywordSpec.dfns tagSpec interfaceSpec

    Parser.generate

    pure unit
