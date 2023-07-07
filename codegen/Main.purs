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

svgFilterTagReference :: String
svgFilterTagReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/filter-effects-1.json"

svgFilterInterfaceReference :: String
svgFilterInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/filter-effects-1.json"

ariaInterfaceReference :: String
ariaInterfaceReference =
    "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/wai-aria-1.2.json"

generate :: ExceptT Error Aff Unit
generate = do
    FS.createDir "codegen/cache/html"
    FS.createDir "codegen/cache/svg"
    FS.createDir "codegen/cache/aria"

    keyword <- FS.cachedFetch "./codegen/cache/html/keyword.json" keywordReference :: _ KeywordSpec

    htmlTag <- FS.cachedFetch "./codegen/cache/html/tags.json" htmlTagReference :: _ TagSpec
    htmlInterface <- FS.cachedFetch "./codegen/cache/html/interface.json" htmlInterfaceReference :: _ InterfaceSpec

    ariaInterface <- FS.cachedFetch "./codegen/cache/dom/interface.json" ariaInterfaceReference :: _ InterfaceSpec

    svgTag <- FS.cachedFetch "./codegen/cache/svg/tags.json" svgTagReference :: _ TagSpec
    svgInterface <- FS.cachedFetch "./codegen/cache/svg/interface.json" svgInterfaceReference :: _ InterfaceSpec

    svgFilterTag <- FS.cachedFetch "./codegen/cache/svg/filter-tags.json" svgFilterTagReference :: _ TagSpec
    svgFilterInterface <- FS.cachedFetch "./codegen/cache/svg/filter-interface.json" svgFilterInterfaceReference :: _ InterfaceSpec


    let
        -- | We could parse and union the actual spec but it contains mostly empty garbage and the only thing we are 
        -- | interested in is the link to ARIA.
        dom :: IDL
        dom = 
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

        tag :: Array Tag
        tag = Array.concat
            [ htmlTag.elements
            , svgTag.elements
            , svgFilterTag.elements
            ]

        interface :: IDL
        interface =
            mergeIDL dom
                $ mergeIDL htmlInterface.idlparsed
                $ mergeIDL svgFilterInterface.idlparsed
                $ mergeIDL svgInterface.idlparsed ariaInterface.idlparsed


    Indexed.generate keyword.dfns tag interface
    DOM.generate keyword.dfns tag interface

    Parser.generate

    pure unit
