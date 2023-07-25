module Main where

import Prelude

import Control.Monad.Except (ExceptT, runExceptT)
import DOM as DOM
import DOM.Common (Ctor(..), Interface, Specification, TagNS(..), TypeStub(..), mkAttribute, preprocess)
import DOM.Indexed as Indexed
import DOM.Spec (Definition, KeywordSpec)
import Data.Array as Array
import Data.Either (blush)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.String as String
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Aff (Aff, Error, launchAff_, message)
import Effect.Class.Console as Console
import FS as FS
import Node.Path as Path
import Parser as Parser

main :: Effect Unit
main = launchAff_ do
    r <- runExceptT generate
    for_ ( blush r ) \e -> do
        Console.log $ message e

generate :: ExceptT Error Aff Unit
generate = do
    let cachePath = "codegen/cache"
        
        keywordFetch url = do
            let urlFilename = Path.basename url
                localFilename = Path.concat [ cachePath, urlFilename ]
            FS.cachedFetch localFilename url :: _ KeywordSpec

        mergeSpec :: Array KeywordSpec -> Array Definition
        mergeSpec =
            flip bind _.dfns 

    FS.createDir cachePath

    html <- preprocess HTML <<< mergeSpec <$> traverse keywordFetch
        [ "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html-media-capture.json"

        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/pointerevents3.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/pointerlock-2.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/touch-events.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/selection-api.json"

        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/css-transitions-1.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/css-transitions-2.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/css-animations-1.json"

        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/wai-aria-1.2.json" 
        ]
    
    svg <- fixSVG <<< preprocess SVG <<< mergeSpec <$> traverse keywordFetch
        [ "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/SVG2.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-integration.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-strokes.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/fill-stroke-3.json"
        
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/filter-effects-1.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-animations.json"
        ]

    mathml <- preprocess MathML <<< mergeSpec <$> traverse keywordFetch
        [ "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/mathml-core.json"
        , "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/mathml-aam.json"
        ]

    Indexed.generate html svg mathml
    DOM.generate html svg

    Parser.generate


-- SVG spec is barely useful
fixSVG :: Specification -> Specification 
fixSVG svgBase =
    svgBase
        { interfaces =
            map ( missingPresentationProperties ) svgBase.interfaces
                <> [ svgText, svgPresentation ]
        }

missingPresentationProperties :: Interface -> Interface
missingPresentationProperties = case _ of
    txt@{ name } | name `Array.elem` [ "SVGTextElement", "SVGTextPathElement", "SVGTspanElement" ] ->
        txt { bases = txt.bases <> [ svgText.ctor, svgPresentation.ctor ] }

    fe@{ name } | Just _ <- String.stripPrefix ( String.Pattern "SVGFe" ) name ->
        fe { bases = fe.bases <> [ svgPresentation.ctor, Ctor "SVGFilterPrimitiveElement" ] }

    animate@{ name : "SVGAnimateElement" } ->
        animate { members = animate.members <> [ { index : Ctor "by", name : "by", type : TypeString } ] }

    animate@{ name } | Just _ <- String.stripPrefix ( String.Pattern "SVGAnimate" ) name ->
        animate { bases = animate.bases <> [ svgPresentation.ctor, Ctor "SVGAnimateElement" ] }

    clippath@{ name : "SVGClipPathElement" } ->
        clippath { members = clippath.members <> [ { index : Ctor "clipPathUnits", name : "clipPathUnits", type : TypeString } ]  }

    id ->
        id { bases = id.bases <> [ svgPresentation.ctor ] }

svgText :: Interface
svgText =
    { ctor : Ctor "SvgText"
    , name : "SvgText"
    , bases : []
    , members :
        Array.mapMaybe mkAttribute
            [ "alignment-baseline"
            , "baseline-shift"
            , "dominant-baseline"
            , "font-family"
            , "font-size"
            , "font-size-adjust"
            , "font-stretch"
            , "font-style"
            , "font-variant"
            , "font-weight"
            , "letter-spacing"
            , "text-decoration"
            , "word-spacing"
            , "writing-mode"
            , "unicode-bidi" 
            ]
    }

svgPresentation :: Interface
svgPresentation =
    { ctor : Ctor "SvgPresentation"
    , name : "SvgPresentation"
    , bases : []
    , members :
        Array.mapMaybe mkAttribute
            [ "pathLength"
            , "mask"
            , "opacity"
            , "overflow"
            , "clip-path"
            , "clip-rule"
            , "cursor"
            , "display"
            , "transform"
            , "transform-origin"
            , "visibility"
            ]
    }