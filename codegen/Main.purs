module Main where

import Prelude

import Control.Monad.Except (ExceptT, runExceptT)
import DOM as DOM
import DOM.Indexed as Indexed
import DOM.Spec (IDL, InterfaceSpec, KeywordSpec, Mixin(..), Tag, TagSpec, mergeIDL)
import Data.Array as Array
import Data.Either (blush)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff, Error, launchAff_, message)
import Effect.Class.Console as Console
import FS as FS
import Foreign.Object as Foreign
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

generate :: ExceptT Error Aff Unit
generate = do
    FS.createDir "codegen/cache/html"
    FS.createDir "codegen/cache/svg"
    FS.createDir "codegen/cache/aria"

    keywordSpec <- FS.cachedFetch "./codegen/cache/html/keyword.json" keywordReference :: _ KeywordSpec

    htmlTagSpec <- FS.cachedFetch "./codegen/cache/html/tags.json" htmlTagReference :: _ TagSpec
    htmlInterfaceSpec <- FS.cachedFetch "./codegen/cache/html/interface.json" htmlInterfaceReference :: _ InterfaceSpec

    ariaInterfaceSpec <- FS.cachedFetch "./codegen/cache/dom/interface.json" ariaInterfaceReference :: _ InterfaceSpec

    svgTagSpec <- FS.cachedFetch "./codegen/cache/svg/tags.json" svgTagReference :: _ TagSpec
    svgInterfaceSpec <- FS.cachedFetch "./codegen/cache/svg/interface.json" svgInterfaceReference :: _ InterfaceSpec

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
