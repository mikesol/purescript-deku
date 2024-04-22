module Main where

import Prelude

import Control.Monad.Except (ExceptT, runExceptT)
import DOM.Common (Ctor(..), Interface, TagNS(..))
import DOM.Indexed as Indexed
import DOM.Parse as Parse
import DOM.TypeStub (TypeStub(..))
import Data.Argonaut.Decode (class DecodeJson)
import Data.Array as Array
import Data.Either (blush)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Traversable (sequence)
import Data.Tuple.Nested ((/\))
import Data.Variant (Variant, inj)
import Effect (Effect)
import Effect.Aff (Aff, Error, launchAff_, message)
import Effect.Class.Console as Console
import FS as FS
import Node.Path as Path
import Parser as Parser
import Prim.Row (class Cons)
import Type.Proxy (Proxy(..))

main :: Effect Unit
main = launchAff_ do
    r <- runExceptT generate
    for_ ( blush r ) \e -> do
        Console.log $ message e


cachePath = "codegen/cache" :: String

fetch :: forall @label @spec r1 r2
     . IsSymbol label
    => Cons label spec r1 r2
    => DecodeJson spec
    => String -> ExceptT Error Aff ( Variant r2 )
fetch url = inj ( Proxy @label ) <$> do
    let urlFilename = Path.basename url
        cacheName = reflectSymbol ( Proxy @label )
        localFilename = Path.concat [ cachePath, cacheName, urlFilename ]
    FS.cachedFetch @spec localFilename url

generate :: ExceptT Error Aff Unit
generate = do

    FS.createDir $ cachePath <> "/dfn"
    FS.createDir $ cachePath <> "/events"
    FS.createDir $ cachePath <> "/idlparsed"
    FS.createDir $ cachePath <> "/elements"

    html <- Parse.parse HTML <$> sequence
        [ fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/html-media-capture.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/pointerlock-2.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/selection-api.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/css-transitions-1.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/css-transitions-2.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/wai-aria-1.3.json"

        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/html.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/touch-events.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/uievents.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/pointerevents3.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/css-animations-1.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/css-transitions-1.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/mediacapture-handle-actions.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/mediacapture-streams.json"
        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/mediastream-recording.json"

        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/dom.json"
        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/html.json"
        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/wai-aria-1.3.json"

        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/html.json"
        ]
    
    svg <- fixSVG <<< Parse.parse SVG <$> sequence
        [ fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/SVG2.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-integration.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-strokes.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/fill-stroke-3.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/filter-effects-1.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/svg-animations.json"

        , fetch @"events" "https://raw.githubusercontent.com/w3c/webref/curated/ed/events/svg-animations.json"

        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/SVG2.json"
        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/svg-animations.json"
        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/filter-effects-1.json"
        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/css-masking-1.json"

        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/SVG2.json"
        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/svg-animations.json"
        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/filter-effects-1.json"
        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/css-masking-1.json"
        ]

    mathml <- Parse.parse MathML <$> sequence
        [ fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/mathml-core.json"
        , fetch @"dfn" "https://raw.githubusercontent.com/w3c/webref/curated/ed/dfns/mathml4.json"

        , fetch @"idlparsed" "https://raw.githubusercontent.com/w3c/webref/curated/ed/idlparsed/mathml-core.json"

        , fetch @"elements" "https://raw.githubusercontent.com/w3c/webref/curated/ed/elements/mathml-core.json"
        ]

    Indexed.generate html svg mathml
    
    Parser.generate


-- SVG spec is barely useful
fixSVG :: Parse.Specification -> Parse.Specification 
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
        animate { members = animate.members <> [ Ctor "by" /\ TypeString ] }

    svg@{ name : "SVGSVGElement" } ->
        svg
            { members = svg.members <>
                [ Ctor "height" /\ TypeString
                , Ctor "width" /\ TypeString
                ]
            , bases = svg.bases <> [ svgPresentation.ctor ]
            }

    animate@{ name } | Just _ <- String.stripPrefix ( String.Pattern "SVGAnimate" ) name ->
        animate { bases = animate.bases <> [ svgPresentation.ctor, Ctor "SVGAnimateElement" ] }

    clippath@{ name : "SVGClipPathElement" } ->
        clippath
            { members = clippath.members <>
                [ Ctor "clipPathUnits" /\ TypeString ] 
            }

    id ->
        id { bases = id.bases <> [ svgPresentation.ctor ] }

svgText :: Interface
svgText =
    { ctor : Ctor "SvgText"
    , name : "SvgText"
    , bases : []
    , members :
        map ( ( _ /\ TypeString ) <<< Ctor )
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
        map ( ( _ /\ TypeString ) <<< Ctor )
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