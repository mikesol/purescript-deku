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

domInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/dom.json" :: String

ariaInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/wai-aria-1.2.json" :: String
keywordReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html.json" :: String

htmlTagReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/html.json" :: String
htmlInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/html.json" :: String
htmlPointerInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/pointerevents3.json" :: String

svgTagReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/SVG2.json" :: String
svgInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/SVG2.json" :: String
svgFilterTagReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/filter-effects-1.json" :: String
svgFilterInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/filter-effects-1.json" :: String
svgAnimationTagReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/svg-animations.json" :: String
svgAnimationInterfaceReference = "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/svg-animations.json" :: String

generate :: ExceptT Error Aff Unit
generate = do
    FS.createDir "codegen/cache/html"
    FS.createDir "codegen/cache/svg"
    FS.createDir "codegen/cache/aria"

    keyword <- FS.cachedFetch "./codegen/cache/html/keyword.json" keywordReference :: _ KeywordSpec
    ariaInterface <- FS.cachedFetch "./codegen/cache/dom/interface.json" ariaInterfaceReference :: _ InterfaceSpec

    domInterface <- FS.cachedFetch "./codegen/cache/html/dom-interface.json" domInterfaceReference :: _ InterfaceSpec
    htmlTag <- FS.cachedFetch "./codegen/cache/html/tags.json" htmlTagReference :: _ TagSpec
    htmlInterface <- FS.cachedFetch "./codegen/cache/html/interface.json" htmlInterfaceReference :: _ InterfaceSpec
    htmlPointerEventInterface <- FS.cachedFetch "./codegen/cache/html/pointer-interface.json" htmlPointerInterfaceReference :: _ InterfaceSpec

    svgTag <- FS.cachedFetch "./codegen/cache/svg/tags.json" svgTagReference :: _ TagSpec
    svgInterface <- FS.cachedFetch "./codegen/cache/svg/interface.json" svgInterfaceReference :: _ InterfaceSpec

    svgFilterTag <- FS.cachedFetch "./codegen/cache/svg/filter-tags.json" svgFilterTagReference :: _ TagSpec
    svgFilterInterface <- FS.cachedFetch "./codegen/cache/svg/filter-interface.json" svgFilterInterfaceReference :: _ InterfaceSpec

    svgAnimationTag <- FS.cachedFetch "./codegen/cache/svg/animation-tags.json" svgAnimationTagReference :: _ TagSpec
    svgAnimationInterface <- FS.cachedFetch "./codegen/cache/svg/animation-interface.json" svgAnimationInterfaceReference :: _ InterfaceSpec

    let
        tag :: Array Tag
        tag = Array.concat
            [ svgTag.elements
            , svgFilterTag.elements
            , svgAnimationTag.elements
            , htmlTag.elements
            ]

        interface :: IDL
        interface =
            mergeIDL htmlInterface.idlparsed
                $ mergeIDL htmlPointerEventInterface.idlparsed
                $ mergeIDL svgInterface.idlparsed
                $ mergeIDL svgFilterInterface.idlparsed
                $ mergeIDL svgAnimationInterface.idlparsed
                $ mergeIDL domInterface.idlparsed ariaInterface.idlparsed


    Indexed.generate keyword.dfns tag interface
    DOM.generate keyword.dfns tag interface

    Parser.generate

    pure unit
