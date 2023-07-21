module Deku.DOM.Indexed.SVG where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import Deku.Attribute (Attribute, AttributeValue, unsafeAttribute)
import Deku.Control (elementify2)
import Deku.Core (Nut)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Deku.DOM.Indexed.Index (Indexed, Keyword(..))
import Deku.DOM.Indexed (HtmlsvgGlobal, Global, GlobalEventHandlers, ARIAMixin)
import Data.Newtype as Data.Newtype
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types

type SVGSvgElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGSvgElement"
  , preserveAspectRatio :: String
  , viewBox :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGGElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGGElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGDefsElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGDefsElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGSymbolElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGSymbolElement"
  , refY :: String
  , refX :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGUseElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGUseElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  , href :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGSwitchElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGSwitchElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGTitleElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGTitleElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGDescElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGDescElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGMetadataElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGMetadataElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGStyleElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGStyleElement"
  , title :: String
  , media :: String
  , type :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGLinkElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGLinkElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGPathElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGPathElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGRectElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGRectElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGCircleElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGCircleElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGEllipseElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGEllipseElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGLineElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGLineElement"
  , y2 :: String
  , x2 :: String
  , y1 :: String
  , x1 :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGPolylineElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGPolylineElement"
  , points :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGPolygonElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGPolygonElement"
  , points :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGTextElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGTextElement"
  , lengthAdjust :: String
  , textLength :: String
  , rotate :: String
  , dy :: String
  , dx :: String
  , y :: String
  , x :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation
      (SvgText (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGTspanElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGTspanElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation
      (SvgText (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGTextPathElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGTextPathElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , path :: String
  , side :: String
  , spacing :: String
  , method :: String
  , startOffset :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation
      (SvgText (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGImageElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGImageElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , crossorigin :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGForeignObjectElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGForeignObjectElement"
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGMarkerElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGMarkerElement"
  , orient :: String
  , refY :: String
  , refX :: String
  , markerHeight :: String
  , markerWidth :: String
  , markerUnits :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGLinearGradientElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGLinearGradientElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , spreadMethod :: String
  , y2 :: String
  , x2 :: String
  , y1 :: String
  , x1 :: String
  , gradientTransform :: String
  , gradientUnits :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGRadialGradientElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGRadialGradientElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , spreadMethod :: String
  , fr :: String
  , fy :: String
  , fx :: String
  , r :: String
  , cy :: String
  , cx :: String
  , gradientTransform :: String
  , gradientUnits :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGStopElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGStopElement"
  , stopOpacity :: String
  , stopColor :: String
  , offset :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGPatternElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGPatternElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , height :: String
  , width :: String
  , y :: String
  , x :: String
  , patternTransform :: String
  , patternContentUnits :: String
  , patternUnits :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGScriptElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGScriptElement"
  , xlinkTitle :: String
  , xlinkHref :: String
  , href :: String
  , type :: String
  , crossorigin :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGAElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGAElement"
  , referrerpolicy :: String
  , type :: String
  , hreflang :: String
  , rel :: String
  , ping :: String
  , download :: String
  , target :: String
  , href :: String
  , xlinkTitle :: String
  , xlinkHref :: String
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGViewElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGViewElement"
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGFilterPrimitiveElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFilterPrimitiveElement"
  , in :: String
  , result :: String
  , height :: String
  , width :: String
  , y :: String
  , x :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGFilterElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFilterElement"
  , filterRes :: String
  , height :: String
  , width :: String
  , y :: String
  , x :: String
  , primitiveUnits :: String
  , filterUnits :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGFeBlendElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeBlendElement"
  , in2 :: String
  , noComposite :: String
  , mode :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeColorMatrixElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeColorMatrixElement"
  , values :: String
  , type :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeComponentTransferElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeComponentTransferElement"
  , offset :: String
  , exponent :: String
  , amplitude :: String
  , intercept :: String
  , slope :: String
  , tableValues :: String
  , type :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeFuncRElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeFuncRElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeFuncGElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeFuncGElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeFuncBElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeFuncBElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeFuncAElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeFuncAElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeCompositeElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeCompositeElement"
  , in2 :: String
  , k4 :: String
  , k3 :: String
  , k2 :: String
  , k1 :: String
  , operator :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeConvolveMatrixElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeConvolveMatrixElement"
  , preserveAlpha :: String
  , kernelUnitLength :: String
  , edgeMode :: String
  , targetY :: String
  , targetX :: String
  , bias :: String
  , divisor :: String
  , kernelMatrix :: String
  , order :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeDiffuseLightingElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeDiffuseLightingElement"
  , kernelUnitLength :: String
  , diffuseConstant :: String
  , surfaceScale :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeDisplacementMapElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeDisplacementMapElement"
  , in2 :: String
  , yChannelSelector :: String
  , xChannelSelector :: String
  , scale :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeDropShadowElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeDropShadowElement"
  , stdDeviation :: String
  , dy :: String
  , dx :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeFloodElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeFloodElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeGaussianBlurElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeGaussianBlurElement"
  , edgeMode :: String
  , stdDeviation :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeImageElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeImageElement"
  , crossorigin :: String
  , preserveAspectRatio :: String
  , href :: String
  , xlinkHref :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeMergeElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeMergeElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeMergeNodeElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeMergeNodeElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeMorphologyElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeMorphologyElement"
  , radius :: String
  , operator :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeOffsetElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeOffsetElement"
  , dy :: String
  , dx :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeSpecularLightingElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeSpecularLightingElement"
  , kernelUnitLength :: String
  , specularExponent :: String
  , specularConstant :: String
  , surfaceScale :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeTileElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeTileElement"
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeTurbulenceElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeTurbulenceElement"
  , type :: String
  , stitchTiles :: String
  , seed :: String
  , numOctaves :: String
  , baseFrequency :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeDistantLightElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeDistantLightElement"
  , elevation :: String
  , azimuth :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFePointLightElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFePointLightElement"
  , z :: String
  , y :: String
  , x :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGFeSpotLightElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFeSpotLightElement"
  , limitingConeAngle :: String
  , specularExponent :: String
  , pointsAtZ :: String
  , pointsAtY :: String
  , pointsAtX :: String
  , z :: String
  , y :: String
  , x :: String
  | SVGFilterPrimitiveElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGAnimateElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGAnimateElement"
  , origin :: String
  , rotate :: String
  , keyPoints :: String
  , accumulate :: String
  , additive :: String
  , from :: String
  , keySplines :: String
  , keyTimes :: String
  , values :: String
  , fill :: String
  , repeatDur :: String
  , repeatCount :: String
  , restart :: String
  , max :: String
  , min :: String
  , end :: String
  , dur :: String
  , begin :: String
  , attributeName :: String
  , href :: String
  , onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , systemLanguage :: String
  , requiredExtensions :: String
  , by :: String
  | ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))
  )

type SVGSetElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGSetElement"
  , to :: String
  , onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGDiscardElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGDiscardElement"
  , onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , systemLanguage :: String
  , requiredExtensions :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGAnimateMotionElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGAnimateMotionElement"
  , path :: String
  , calcMode :: String
  , onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , systemLanguage :: String
  , requiredExtensions :: String
  | SVGAnimateElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SVGMpathElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGMpathElement"
  , href :: String
  | SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r)))))
  )

type SVGAnimateTransformElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGAnimateTransformElement"
  , type :: String
  , onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , systemLanguage :: String
  , requiredExtensions :: String
  | SVGAnimateElement
      (SvgPresentation (ARIAMixin (GlobalEventHandlers (Global (SvgGlobal (HtmlsvgGlobal r))))))
  )

type SvgGlobal (r :: Row Type) =
  ( __nominal :: Proxy "SvgGlobal"
  , lightingColor :: String
  , colorInterpolationFilters :: String
  , floodOpacity :: String
  , floodColor :: String
  , filter :: String
  , strokeOpacity :: String
  , stroke :: String
  , strokeRepeat :: String
  , strokeSize :: String
  , strokePosition :: String
  , strokeOrigin :: String
  , strokeImage :: String
  , strokeColor :: String
  , strokeDashJustify :: String
  , strokeDashCorner :: String
  , strokeDashoffset :: String
  , strokeDasharray :: String
  , strokeBreak :: String
  , strokeMiterlimit :: String
  , strokeLinejoin :: String
  , strokeLinecap :: String
  , strokeAlign :: String
  , strokeWidth :: String
  , fillOpacity :: String
  , fill :: String
  , fillRepeat :: String
  , fillSize :: String
  , fillPosition :: String
  , fillOrigin :: String
  , fillImage :: String
  , fillColor :: String
  , fillBreak :: String
  , fillRule :: String
  , pointerEvents :: String
  , imageRendering :: String
  , textRendering :: String
  , shapeRendering :: String
  , colorInterpolation :: String
  , paintOrder :: String
  , marker :: String
  , markerEnd :: String
  , markerMid :: String
  , markerStart :: String
  , textAnchor :: String
  , shapeMargin :: String
  , shapeSubtract :: String
  , shapeInside :: String
  , inlineSize :: String
  , d :: String
  , vectorEffect :: String
  , y :: String
  , x :: String
  , ry :: String
  , rx :: String
  , r :: String
  , cy :: String
  , cx :: String
  | SvgPresentation r
  )

type SvgText (r :: Row Type) =
  ( __nominal :: Proxy "SvgText"
  , alignmentBaseline :: String
  , baselineShift :: String
  , dominantBaseline :: String
  , fontFamily :: String
  , fontSize :: String
  , fontSizeAdjust :: String
  , fontStretch :: String
  , fontStyle :: String
  , fontVariant :: String
  , fontWeight :: String
  , letterSpacing :: String
  , textDecoration :: String
  , wordSpacing :: String
  , writingMode :: String
  , unicodeBidi :: String
  | r
  )

type SvgPresentation (r :: Row Type) =
  ( __nominal :: Proxy "SvgPresentation"
  , pathLength :: String
  , mask :: String
  , opacity :: String
  , overflow :: String
  , clipPath :: String
  , cursor :: String
  , display :: String
  , transform :: String
  , transformOrigin :: String
  , visibility :: String
  | r
  )

svg :: Array (Event (Attribute (Indexed (SVGSvgElement ())))) -> Array Nut -> Nut
svg = elementify2 {- http://www.w3.org/2000/svg -} "svg"

svg_ :: Array Nut -> Nut
svg_ = elementify2 {- http://www.w3.org/2000/svg -} "svg" []

g :: Array (Event (Attribute (Indexed (SVGGElement ())))) -> Array Nut -> Nut
g = elementify2 {- http://www.w3.org/2000/svg -} "g"

g_ :: Array Nut -> Nut
g_ = elementify2 {- http://www.w3.org/2000/svg -} "g" []

defs :: Array (Event (Attribute (Indexed (SVGDefsElement ())))) -> Array Nut -> Nut
defs = elementify2 {- http://www.w3.org/2000/svg -} "defs"

defs_ :: Array Nut -> Nut
defs_ = elementify2 {- http://www.w3.org/2000/svg -} "defs" []

symbol :: Array (Event (Attribute (Indexed (SVGSymbolElement ())))) -> Array Nut -> Nut
symbol = elementify2 {- http://www.w3.org/2000/svg -} "symbol"

symbol_ :: Array Nut -> Nut
symbol_ = elementify2 {- http://www.w3.org/2000/svg -} "symbol" []

use :: Array (Event (Attribute (Indexed (SVGUseElement ())))) -> Array Nut -> Nut
use = elementify2 {- http://www.w3.org/2000/svg -} "use"

use_ :: Array Nut -> Nut
use_ = elementify2 {- http://www.w3.org/2000/svg -} "use" []

switch :: Array (Event (Attribute (Indexed (SVGSwitchElement ())))) -> Array Nut -> Nut
switch = elementify2 {- http://www.w3.org/2000/svg -} "switch"

switch_ :: Array Nut -> Nut
switch_ = elementify2 {- http://www.w3.org/2000/svg -} "switch" []

title :: Array (Event (Attribute (Indexed (SVGTitleElement ())))) -> Array Nut -> Nut
title = elementify2 {- http://www.w3.org/2000/svg -} "title"

title_ :: Array Nut -> Nut
title_ = elementify2 {- http://www.w3.org/2000/svg -} "title" []

desc :: Array (Event (Attribute (Indexed (SVGDescElement ())))) -> Array Nut -> Nut
desc = elementify2 {- http://www.w3.org/2000/svg -} "desc"

desc_ :: Array Nut -> Nut
desc_ = elementify2 {- http://www.w3.org/2000/svg -} "desc" []

metadata :: Array (Event (Attribute (Indexed (SVGMetadataElement ())))) -> Array Nut -> Nut
metadata = elementify2 {- http://www.w3.org/2000/svg -} "metadata"

metadata_ :: Array Nut -> Nut
metadata_ = elementify2 {- http://www.w3.org/2000/svg -} "metadata" []

style :: Array (Event (Attribute (Indexed (SVGStyleElement ())))) -> Array Nut -> Nut
style = elementify2 {- http://www.w3.org/2000/svg -} "style"

style_ :: Array Nut -> Nut
style_ = elementify2 {- http://www.w3.org/2000/svg -} "style" []

link :: Array (Event (Attribute (Indexed (SVGLinkElement ())))) -> Array Nut -> Nut
link = elementify2 {- http://www.w3.org/2000/svg -} "link"

link_ :: Array Nut -> Nut
link_ = elementify2 {- http://www.w3.org/2000/svg -} "link" []

path :: Array (Event (Attribute (Indexed (SVGPathElement ())))) -> Array Nut -> Nut
path = elementify2 {- http://www.w3.org/2000/svg -} "path"

path_ :: Array Nut -> Nut
path_ = elementify2 {- http://www.w3.org/2000/svg -} "path" []

rect :: Array (Event (Attribute (Indexed (SVGRectElement ())))) -> Array Nut -> Nut
rect = elementify2 {- http://www.w3.org/2000/svg -} "rect"

rect_ :: Array Nut -> Nut
rect_ = elementify2 {- http://www.w3.org/2000/svg -} "rect" []

circle :: Array (Event (Attribute (Indexed (SVGCircleElement ())))) -> Array Nut -> Nut
circle = elementify2 {- http://www.w3.org/2000/svg -} "circle"

circle_ :: Array Nut -> Nut
circle_ = elementify2 {- http://www.w3.org/2000/svg -} "circle" []

ellipse :: Array (Event (Attribute (Indexed (SVGEllipseElement ())))) -> Array Nut -> Nut
ellipse = elementify2 {- http://www.w3.org/2000/svg -} "ellipse"

ellipse_ :: Array Nut -> Nut
ellipse_ = elementify2 {- http://www.w3.org/2000/svg -} "ellipse" []

line :: Array (Event (Attribute (Indexed (SVGLineElement ())))) -> Array Nut -> Nut
line = elementify2 {- http://www.w3.org/2000/svg -} "line"

line_ :: Array Nut -> Nut
line_ = elementify2 {- http://www.w3.org/2000/svg -} "line" []

polyline :: Array (Event (Attribute (Indexed (SVGPolylineElement ())))) -> Array Nut -> Nut
polyline = elementify2 {- http://www.w3.org/2000/svg -} "polyline"

polyline_ :: Array Nut -> Nut
polyline_ = elementify2 {- http://www.w3.org/2000/svg -} "polyline" []

polygon :: Array (Event (Attribute (Indexed (SVGPolygonElement ())))) -> Array Nut -> Nut
polygon = elementify2 {- http://www.w3.org/2000/svg -} "polygon"

polygon_ :: Array Nut -> Nut
polygon_ = elementify2 {- http://www.w3.org/2000/svg -} "polygon" []

text :: Array (Event (Attribute (Indexed (SVGTextElement ())))) -> Array Nut -> Nut
text = elementify2 {- http://www.w3.org/2000/svg -} "text"

text_ :: Array Nut -> Nut
text_ = elementify2 {- http://www.w3.org/2000/svg -} "text" []

tspan :: Array (Event (Attribute (Indexed (SVGTspanElement ())))) -> Array Nut -> Nut
tspan = elementify2 {- http://www.w3.org/2000/svg -} "tspan"

tspan_ :: Array Nut -> Nut
tspan_ = elementify2 {- http://www.w3.org/2000/svg -} "tspan" []

textPath :: Array (Event (Attribute (Indexed (SVGTextPathElement ())))) -> Array Nut -> Nut
textPath = elementify2 {- http://www.w3.org/2000/svg -} "textPath"

textPath_ :: Array Nut -> Nut
textPath_ = elementify2 {- http://www.w3.org/2000/svg -} "textPath" []

image :: Array (Event (Attribute (Indexed (SVGImageElement ())))) -> Array Nut -> Nut
image = elementify2 {- http://www.w3.org/2000/svg -} "image"

image_ :: Array Nut -> Nut
image_ = elementify2 {- http://www.w3.org/2000/svg -} "image" []

foreignObject
  :: Array (Event (Attribute (Indexed (SVGForeignObjectElement ())))) -> Array Nut -> Nut
foreignObject = elementify2 {- http://www.w3.org/2000/svg -} "foreignObject"

foreignObject_ :: Array Nut -> Nut
foreignObject_ = elementify2 {- http://www.w3.org/2000/svg -} "foreignObject" []

marker :: Array (Event (Attribute (Indexed (SVGMarkerElement ())))) -> Array Nut -> Nut
marker = elementify2 {- http://www.w3.org/2000/svg -} "marker"

marker_ :: Array Nut -> Nut
marker_ = elementify2 {- http://www.w3.org/2000/svg -} "marker" []

linearGradient
  :: Array (Event (Attribute (Indexed (SVGLinearGradientElement ())))) -> Array Nut -> Nut
linearGradient = elementify2 {- http://www.w3.org/2000/svg -} "linearGradient"

linearGradient_ :: Array Nut -> Nut
linearGradient_ = elementify2 {- http://www.w3.org/2000/svg -} "linearGradient" []

radialGradient
  :: Array (Event (Attribute (Indexed (SVGRadialGradientElement ())))) -> Array Nut -> Nut
radialGradient = elementify2 {- http://www.w3.org/2000/svg -} "radialGradient"

radialGradient_ :: Array Nut -> Nut
radialGradient_ = elementify2 {- http://www.w3.org/2000/svg -} "radialGradient" []

stop :: Array (Event (Attribute (Indexed (SVGStopElement ())))) -> Array Nut -> Nut
stop = elementify2 {- http://www.w3.org/2000/svg -} "stop"

stop_ :: Array Nut -> Nut
stop_ = elementify2 {- http://www.w3.org/2000/svg -} "stop" []

pattern :: Array (Event (Attribute (Indexed (SVGPatternElement ())))) -> Array Nut -> Nut
pattern = elementify2 {- http://www.w3.org/2000/svg -} "pattern"

pattern_ :: Array Nut -> Nut
pattern_ = elementify2 {- http://www.w3.org/2000/svg -} "pattern" []

script :: Array (Event (Attribute (Indexed (SVGScriptElement ())))) -> Array Nut -> Nut
script = elementify2 {- http://www.w3.org/2000/svg -} "script"

script_ :: Array Nut -> Nut
script_ = elementify2 {- http://www.w3.org/2000/svg -} "script" []

a :: Array (Event (Attribute (Indexed (SVGAElement ())))) -> Array Nut -> Nut
a = elementify2 {- http://www.w3.org/2000/svg -} "a"

a_ :: Array Nut -> Nut
a_ = elementify2 {- http://www.w3.org/2000/svg -} "a" []

view :: Array (Event (Attribute (Indexed (SVGViewElement ())))) -> Array Nut -> Nut
view = elementify2 {- http://www.w3.org/2000/svg -} "view"

view_ :: Array Nut -> Nut
view_ = elementify2 {- http://www.w3.org/2000/svg -} "view" []

filterPrimitive
  :: Array (Event (Attribute (Indexed (SVGFilterPrimitiveElement ())))) -> Array Nut -> Nut
filterPrimitive = elementify2 {- http://www.w3.org/2000/svg -} "filter-primitive"

filterPrimitive_ :: Array Nut -> Nut
filterPrimitive_ = elementify2 {- http://www.w3.org/2000/svg -} "filter-primitive" []

filter :: Array (Event (Attribute (Indexed (SVGFilterElement ())))) -> Array Nut -> Nut
filter = elementify2 {- http://www.w3.org/2000/svg -} "filter"

filter_ :: Array Nut -> Nut
filter_ = elementify2 {- http://www.w3.org/2000/svg -} "filter" []

feBlend :: Array (Event (Attribute (Indexed (SVGFeBlendElement ())))) -> Array Nut -> Nut
feBlend = elementify2 {- http://www.w3.org/2000/svg -} "feBlend"

feBlend_ :: Array Nut -> Nut
feBlend_ = elementify2 {- http://www.w3.org/2000/svg -} "feBlend" []

feColorMatrix
  :: Array (Event (Attribute (Indexed (SVGFeColorMatrixElement ())))) -> Array Nut -> Nut
feColorMatrix = elementify2 {- http://www.w3.org/2000/svg -} "feColorMatrix"

feColorMatrix_ :: Array Nut -> Nut
feColorMatrix_ = elementify2 {- http://www.w3.org/2000/svg -} "feColorMatrix" []

feComponentTransfer
  :: Array (Event (Attribute (Indexed (SVGFeComponentTransferElement ())))) -> Array Nut -> Nut
feComponentTransfer = elementify2 {- http://www.w3.org/2000/svg -} "feComponentTransfer"

feComponentTransfer_ :: Array Nut -> Nut
feComponentTransfer_ = elementify2 {- http://www.w3.org/2000/svg -} "feComponentTransfer" []

feFuncR :: Array (Event (Attribute (Indexed (SVGFeFuncRElement ())))) -> Array Nut -> Nut
feFuncR = elementify2 {- http://www.w3.org/2000/svg -} "feFuncR"

feFuncR_ :: Array Nut -> Nut
feFuncR_ = elementify2 {- http://www.w3.org/2000/svg -} "feFuncR" []

feFuncG :: Array (Event (Attribute (Indexed (SVGFeFuncGElement ())))) -> Array Nut -> Nut
feFuncG = elementify2 {- http://www.w3.org/2000/svg -} "feFuncG"

feFuncG_ :: Array Nut -> Nut
feFuncG_ = elementify2 {- http://www.w3.org/2000/svg -} "feFuncG" []

feFuncB :: Array (Event (Attribute (Indexed (SVGFeFuncBElement ())))) -> Array Nut -> Nut
feFuncB = elementify2 {- http://www.w3.org/2000/svg -} "feFuncB"

feFuncB_ :: Array Nut -> Nut
feFuncB_ = elementify2 {- http://www.w3.org/2000/svg -} "feFuncB" []

feFuncA :: Array (Event (Attribute (Indexed (SVGFeFuncAElement ())))) -> Array Nut -> Nut
feFuncA = elementify2 {- http://www.w3.org/2000/svg -} "feFuncA"

feFuncA_ :: Array Nut -> Nut
feFuncA_ = elementify2 {- http://www.w3.org/2000/svg -} "feFuncA" []

feComposite :: Array (Event (Attribute (Indexed (SVGFeCompositeElement ())))) -> Array Nut -> Nut
feComposite = elementify2 {- http://www.w3.org/2000/svg -} "feComposite"

feComposite_ :: Array Nut -> Nut
feComposite_ = elementify2 {- http://www.w3.org/2000/svg -} "feComposite" []

feConvolveMatrix
  :: Array (Event (Attribute (Indexed (SVGFeConvolveMatrixElement ())))) -> Array Nut -> Nut
feConvolveMatrix = elementify2 {- http://www.w3.org/2000/svg -} "feConvolveMatrix"

feConvolveMatrix_ :: Array Nut -> Nut
feConvolveMatrix_ = elementify2 {- http://www.w3.org/2000/svg -} "feConvolveMatrix" []

feDiffuseLighting
  :: Array (Event (Attribute (Indexed (SVGFeDiffuseLightingElement ())))) -> Array Nut -> Nut
feDiffuseLighting = elementify2 {- http://www.w3.org/2000/svg -} "feDiffuseLighting"

feDiffuseLighting_ :: Array Nut -> Nut
feDiffuseLighting_ = elementify2 {- http://www.w3.org/2000/svg -} "feDiffuseLighting" []

feDisplacementMap
  :: Array (Event (Attribute (Indexed (SVGFeDisplacementMapElement ())))) -> Array Nut -> Nut
feDisplacementMap = elementify2 {- http://www.w3.org/2000/svg -} "feDisplacementMap"

feDisplacementMap_ :: Array Nut -> Nut
feDisplacementMap_ = elementify2 {- http://www.w3.org/2000/svg -} "feDisplacementMap" []

feDropShadow :: Array (Event (Attribute (Indexed (SVGFeDropShadowElement ())))) -> Array Nut -> Nut
feDropShadow = elementify2 {- http://www.w3.org/2000/svg -} "feDropShadow"

feDropShadow_ :: Array Nut -> Nut
feDropShadow_ = elementify2 {- http://www.w3.org/2000/svg -} "feDropShadow" []

feFlood :: Array (Event (Attribute (Indexed (SVGFeFloodElement ())))) -> Array Nut -> Nut
feFlood = elementify2 {- http://www.w3.org/2000/svg -} "feFlood"

feFlood_ :: Array Nut -> Nut
feFlood_ = elementify2 {- http://www.w3.org/2000/svg -} "feFlood" []

feGaussianBlur
  :: Array (Event (Attribute (Indexed (SVGFeGaussianBlurElement ())))) -> Array Nut -> Nut
feGaussianBlur = elementify2 {- http://www.w3.org/2000/svg -} "feGaussianBlur"

feGaussianBlur_ :: Array Nut -> Nut
feGaussianBlur_ = elementify2 {- http://www.w3.org/2000/svg -} "feGaussianBlur" []

feImage :: Array (Event (Attribute (Indexed (SVGFeImageElement ())))) -> Array Nut -> Nut
feImage = elementify2 {- http://www.w3.org/2000/svg -} "feImage"

feImage_ :: Array Nut -> Nut
feImage_ = elementify2 {- http://www.w3.org/2000/svg -} "feImage" []

feMerge :: Array (Event (Attribute (Indexed (SVGFeMergeElement ())))) -> Array Nut -> Nut
feMerge = elementify2 {- http://www.w3.org/2000/svg -} "feMerge"

feMerge_ :: Array Nut -> Nut
feMerge_ = elementify2 {- http://www.w3.org/2000/svg -} "feMerge" []

feMergeNode :: Array (Event (Attribute (Indexed (SVGFeMergeNodeElement ())))) -> Array Nut -> Nut
feMergeNode = elementify2 {- http://www.w3.org/2000/svg -} "feMergeNode"

feMergeNode_ :: Array Nut -> Nut
feMergeNode_ = elementify2 {- http://www.w3.org/2000/svg -} "feMergeNode" []

feMorphology :: Array (Event (Attribute (Indexed (SVGFeMorphologyElement ())))) -> Array Nut -> Nut
feMorphology = elementify2 {- http://www.w3.org/2000/svg -} "feMorphology"

feMorphology_ :: Array Nut -> Nut
feMorphology_ = elementify2 {- http://www.w3.org/2000/svg -} "feMorphology" []

feOffset :: Array (Event (Attribute (Indexed (SVGFeOffsetElement ())))) -> Array Nut -> Nut
feOffset = elementify2 {- http://www.w3.org/2000/svg -} "feOffset"

feOffset_ :: Array Nut -> Nut
feOffset_ = elementify2 {- http://www.w3.org/2000/svg -} "feOffset" []

feSpecularLighting
  :: Array (Event (Attribute (Indexed (SVGFeSpecularLightingElement ())))) -> Array Nut -> Nut
feSpecularLighting = elementify2 {- http://www.w3.org/2000/svg -} "feSpecularLighting"

feSpecularLighting_ :: Array Nut -> Nut
feSpecularLighting_ = elementify2 {- http://www.w3.org/2000/svg -} "feSpecularLighting" []

feTile :: Array (Event (Attribute (Indexed (SVGFeTileElement ())))) -> Array Nut -> Nut
feTile = elementify2 {- http://www.w3.org/2000/svg -} "feTile"

feTile_ :: Array Nut -> Nut
feTile_ = elementify2 {- http://www.w3.org/2000/svg -} "feTile" []

feTurbulence :: Array (Event (Attribute (Indexed (SVGFeTurbulenceElement ())))) -> Array Nut -> Nut
feTurbulence = elementify2 {- http://www.w3.org/2000/svg -} "feTurbulence"

feTurbulence_ :: Array Nut -> Nut
feTurbulence_ = elementify2 {- http://www.w3.org/2000/svg -} "feTurbulence" []

feDistantLight
  :: Array (Event (Attribute (Indexed (SVGFeDistantLightElement ())))) -> Array Nut -> Nut
feDistantLight = elementify2 {- http://www.w3.org/2000/svg -} "feDistantLight"

feDistantLight_ :: Array Nut -> Nut
feDistantLight_ = elementify2 {- http://www.w3.org/2000/svg -} "feDistantLight" []

fePointLight :: Array (Event (Attribute (Indexed (SVGFePointLightElement ())))) -> Array Nut -> Nut
fePointLight = elementify2 {- http://www.w3.org/2000/svg -} "fePointLight"

fePointLight_ :: Array Nut -> Nut
fePointLight_ = elementify2 {- http://www.w3.org/2000/svg -} "fePointLight" []

feSpotLight :: Array (Event (Attribute (Indexed (SVGFeSpotLightElement ())))) -> Array Nut -> Nut
feSpotLight = elementify2 {- http://www.w3.org/2000/svg -} "feSpotLight"

feSpotLight_ :: Array Nut -> Nut
feSpotLight_ = elementify2 {- http://www.w3.org/2000/svg -} "feSpotLight" []

animate :: Array (Event (Attribute (Indexed (SVGAnimateElement ())))) -> Array Nut -> Nut
animate = elementify2 {- http://www.w3.org/2000/svg -} "animate"

animate_ :: Array Nut -> Nut
animate_ = elementify2 {- http://www.w3.org/2000/svg -} "animate" []

set :: Array (Event (Attribute (Indexed (SVGSetElement ())))) -> Array Nut -> Nut
set = elementify2 {- http://www.w3.org/2000/svg -} "set"

set_ :: Array Nut -> Nut
set_ = elementify2 {- http://www.w3.org/2000/svg -} "set" []

discard :: Array (Event (Attribute (Indexed (SVGDiscardElement ())))) -> Array Nut -> Nut
discard = elementify2 {- http://www.w3.org/2000/svg -} "discard"

discard_ :: Array Nut -> Nut
discard_ = elementify2 {- http://www.w3.org/2000/svg -} "discard" []

animateMotion
  :: Array (Event (Attribute (Indexed (SVGAnimateMotionElement ())))) -> Array Nut -> Nut
animateMotion = elementify2 {- http://www.w3.org/2000/svg -} "animateMotion"

animateMotion_ :: Array Nut -> Nut
animateMotion_ = elementify2 {- http://www.w3.org/2000/svg -} "animateMotion" []

mpath :: Array (Event (Attribute (Indexed (SVGMpathElement ())))) -> Array Nut -> Nut
mpath = elementify2 {- http://www.w3.org/2000/svg -} "mpath"

mpath_ :: Array Nut -> Nut
mpath_ = elementify2 {- http://www.w3.org/2000/svg -} "mpath" []

animateTransform
  :: Array (Event (Attribute (Indexed (SVGAnimateTransformElement ())))) -> Array Nut -> Nut
animateTransform = elementify2 {- http://www.w3.org/2000/svg -} "animateTransform"

animateTransform_ :: Array Nut -> Nut
animateTransform_ = elementify2 {- http://www.w3.org/2000/svg -} "animateTransform" []

class Isoperator (v :: Type) (a :: Type) | v -> a where
  isoperator :: v -> AttributeValue

instance Isoperator String String where
  isoperator = Deku.Attribute.prop'

instance Isoperator (Keyword "arithmetic") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "lighter") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "xor") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "atop") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "out") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "in") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isoperator (Keyword "over") String where
  isoperator = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_operator
  :: forall r v a. Isoperator v a => Event v -> Event (Attribute (Indexed (operator :: a | r)))
_operator = Functor.map (unsafeAttribute <<< { key: "operator", value: _ } <<< isoperator)

_operator_ :: forall r v a. Isoperator v a => v -> Event (Attribute (Indexed (operator :: a | r)))
_operator_ = _operator <<< Applicative.pure

class IsedgeMode (v :: Type) (a :: Type) | v -> a where
  isedgeMode :: v -> AttributeValue

instance IsedgeMode String String where
  isedgeMode = Deku.Attribute.prop'

instance IsedgeMode (Keyword "wrap") String where
  isedgeMode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IsedgeMode (Keyword "duplicate") String where
  isedgeMode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_edgeMode
  :: forall r v a. IsedgeMode v a => Event v -> Event (Attribute (Indexed (edgeMode :: a | r)))
_edgeMode = Functor.map (unsafeAttribute <<< { key: "edgeMode", value: _ } <<< isedgeMode)

_edgeMode_ :: forall r v a. IsedgeMode v a => v -> Event (Attribute (Indexed (edgeMode :: a | r)))
_edgeMode_ = _edgeMode <<< Applicative.pure

_preserveAspectRatio
  :: forall r. Event String -> Event (Attribute (Indexed (preserveAspectRatio :: String | r)))
_preserveAspectRatio = Functor.map
  (unsafeAttribute <<< { key: "preserveAspectRatio", value: _ } <<< Deku.Attribute.prop')

_preserveAspectRatio_
  :: forall r. String -> Event (Attribute (Indexed (preserveAspectRatio :: String | r)))
_preserveAspectRatio_ = _preserveAspectRatio <<< Applicative.pure

_viewBox :: forall r. Event String -> Event (Attribute (Indexed (viewBox :: String | r)))
_viewBox = Functor.map (unsafeAttribute <<< { key: "viewBox", value: _ } <<< Deku.Attribute.prop')

_viewBox_ :: forall r. String -> Event (Attribute (Indexed (viewBox :: String | r)))
_viewBox_ = _viewBox <<< Applicative.pure

_systemLanguage
  :: forall r. Event String -> Event (Attribute (Indexed (systemLanguage :: String | r)))
_systemLanguage = Functor.map
  (unsafeAttribute <<< { key: "systemLanguage", value: _ } <<< Deku.Attribute.prop')

_systemLanguage_ :: forall r. String -> Event (Attribute (Indexed (systemLanguage :: String | r)))
_systemLanguage_ = _systemLanguage <<< Applicative.pure

_requiredExtensions
  :: forall r. Event String -> Event (Attribute (Indexed (requiredExtensions :: String | r)))
_requiredExtensions = Functor.map
  (unsafeAttribute <<< { key: "requiredExtensions", value: _ } <<< Deku.Attribute.prop')

_requiredExtensions_
  :: forall r. String -> Event (Attribute (Indexed (requiredExtensions :: String | r)))
_requiredExtensions_ = _requiredExtensions <<< Applicative.pure

_refY :: forall r. Event String -> Event (Attribute (Indexed (refY :: String | r)))
_refY = Functor.map (unsafeAttribute <<< { key: "refY", value: _ } <<< Deku.Attribute.prop')

_refY_ :: forall r. String -> Event (Attribute (Indexed (refY :: String | r)))
_refY_ = _refY <<< Applicative.pure

_refX :: forall r. Event String -> Event (Attribute (Indexed (refX :: String | r)))
_refX = Functor.map (unsafeAttribute <<< { key: "refX", value: _ } <<< Deku.Attribute.prop')

_refX_ :: forall r. String -> Event (Attribute (Indexed (refX :: String | r)))
_refX_ = _refX <<< Applicative.pure

_xlinkTitle :: forall r. Event String -> Event (Attribute (Indexed (xlinkTitle :: String | r)))
_xlinkTitle = Functor.map
  (unsafeAttribute <<< { key: "xlink:title", value: _ } <<< Deku.Attribute.prop')

_xlinkTitle_ :: forall r. String -> Event (Attribute (Indexed (xlinkTitle :: String | r)))
_xlinkTitle_ = _xlinkTitle <<< Applicative.pure

_xlinkHref :: forall r. Event String -> Event (Attribute (Indexed (xlinkHref :: String | r)))
_xlinkHref = Functor.map
  (unsafeAttribute <<< { key: "xlink:href", value: _ } <<< Deku.Attribute.prop')

_xlinkHref_ :: forall r. String -> Event (Attribute (Indexed (xlinkHref :: String | r)))
_xlinkHref_ = _xlinkHref <<< Applicative.pure

_href :: forall r. Event String -> Event (Attribute (Indexed (href :: String | r)))
_href = Functor.map (unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop')

_href_ :: forall r. String -> Event (Attribute (Indexed (href :: String | r)))
_href_ = _href <<< Applicative.pure

_title :: forall r. Event String -> Event (Attribute (Indexed (title :: String | r)))
_title = Functor.map (unsafeAttribute <<< { key: "title", value: _ } <<< Deku.Attribute.prop')

_title_ :: forall r. String -> Event (Attribute (Indexed (title :: String | r)))
_title_ = _title <<< Applicative.pure

_media :: forall r. Event String -> Event (Attribute (Indexed (media :: String | r)))
_media = Functor.map (unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop')

_media_ :: forall r. String -> Event (Attribute (Indexed (media :: String | r)))
_media_ = _media <<< Applicative.pure

_type :: forall r. Event String -> Event (Attribute (Indexed (type :: String | r)))
_type = Functor.map (unsafeAttribute <<< { key: "type", value: _ } <<< Deku.Attribute.prop')

_type_ :: forall r. String -> Event (Attribute (Indexed (type :: String | r)))
_type_ = _type <<< Applicative.pure

_y2 :: forall r. Event String -> Event (Attribute (Indexed (y2 :: String | r)))
_y2 = Functor.map (unsafeAttribute <<< { key: "y2", value: _ } <<< Deku.Attribute.prop')

_y2_ :: forall r. String -> Event (Attribute (Indexed (y2 :: String | r)))
_y2_ = _y2 <<< Applicative.pure

_x2 :: forall r. Event String -> Event (Attribute (Indexed (x2 :: String | r)))
_x2 = Functor.map (unsafeAttribute <<< { key: "x2", value: _ } <<< Deku.Attribute.prop')

_x2_ :: forall r. String -> Event (Attribute (Indexed (x2 :: String | r)))
_x2_ = _x2 <<< Applicative.pure

_y1 :: forall r. Event String -> Event (Attribute (Indexed (y1 :: String | r)))
_y1 = Functor.map (unsafeAttribute <<< { key: "y1", value: _ } <<< Deku.Attribute.prop')

_y1_ :: forall r. String -> Event (Attribute (Indexed (y1 :: String | r)))
_y1_ = _y1 <<< Applicative.pure

_x1 :: forall r. Event String -> Event (Attribute (Indexed (x1 :: String | r)))
_x1 = Functor.map (unsafeAttribute <<< { key: "x1", value: _ } <<< Deku.Attribute.prop')

_x1_ :: forall r. String -> Event (Attribute (Indexed (x1 :: String | r)))
_x1_ = _x1 <<< Applicative.pure

_points :: forall r. Event String -> Event (Attribute (Indexed (points :: String | r)))
_points = Functor.map (unsafeAttribute <<< { key: "points", value: _ } <<< Deku.Attribute.prop')

_points_ :: forall r. String -> Event (Attribute (Indexed (points :: String | r)))
_points_ = _points <<< Applicative.pure

_lengthAdjust :: forall r. Event String -> Event (Attribute (Indexed (lengthAdjust :: String | r)))
_lengthAdjust = Functor.map
  (unsafeAttribute <<< { key: "lengthAdjust", value: _ } <<< Deku.Attribute.prop')

_lengthAdjust_ :: forall r. String -> Event (Attribute (Indexed (lengthAdjust :: String | r)))
_lengthAdjust_ = _lengthAdjust <<< Applicative.pure

_textLength :: forall r. Event String -> Event (Attribute (Indexed (textLength :: String | r)))
_textLength = Functor.map
  (unsafeAttribute <<< { key: "textLength", value: _ } <<< Deku.Attribute.prop')

_textLength_ :: forall r. String -> Event (Attribute (Indexed (textLength :: String | r)))
_textLength_ = _textLength <<< Applicative.pure

_rotate :: forall r. Event String -> Event (Attribute (Indexed (rotate :: String | r)))
_rotate = Functor.map (unsafeAttribute <<< { key: "rotate", value: _ } <<< Deku.Attribute.prop')

_rotate_ :: forall r. String -> Event (Attribute (Indexed (rotate :: String | r)))
_rotate_ = _rotate <<< Applicative.pure

_dy :: forall r. Event String -> Event (Attribute (Indexed (dy :: String | r)))
_dy = Functor.map (unsafeAttribute <<< { key: "dy", value: _ } <<< Deku.Attribute.prop')

_dy_ :: forall r. String -> Event (Attribute (Indexed (dy :: String | r)))
_dy_ = _dy <<< Applicative.pure

_dx :: forall r. Event String -> Event (Attribute (Indexed (dx :: String | r)))
_dx = Functor.map (unsafeAttribute <<< { key: "dx", value: _ } <<< Deku.Attribute.prop')

_dx_ :: forall r. String -> Event (Attribute (Indexed (dx :: String | r)))
_dx_ = _dx <<< Applicative.pure

_y :: forall r. Event String -> Event (Attribute (Indexed (y :: String | r)))
_y = Functor.map (unsafeAttribute <<< { key: "y", value: _ } <<< Deku.Attribute.prop')

_y_ :: forall r. String -> Event (Attribute (Indexed (y :: String | r)))
_y_ = _y <<< Applicative.pure

_x :: forall r. Event String -> Event (Attribute (Indexed (x :: String | r)))
_x = Functor.map (unsafeAttribute <<< { key: "x", value: _ } <<< Deku.Attribute.prop')

_x_ :: forall r. String -> Event (Attribute (Indexed (x :: String | r)))
_x_ = _x <<< Applicative.pure

_path :: forall r. Event String -> Event (Attribute (Indexed (path :: String | r)))
_path = Functor.map (unsafeAttribute <<< { key: "path", value: _ } <<< Deku.Attribute.prop')

_path_ :: forall r. String -> Event (Attribute (Indexed (path :: String | r)))
_path_ = _path <<< Applicative.pure

_side :: forall r. Event String -> Event (Attribute (Indexed (side :: String | r)))
_side = Functor.map (unsafeAttribute <<< { key: "side", value: _ } <<< Deku.Attribute.prop')

_side_ :: forall r. String -> Event (Attribute (Indexed (side :: String | r)))
_side_ = _side <<< Applicative.pure

_spacing :: forall r. Event String -> Event (Attribute (Indexed (spacing :: String | r)))
_spacing = Functor.map (unsafeAttribute <<< { key: "spacing", value: _ } <<< Deku.Attribute.prop')

_spacing_ :: forall r. String -> Event (Attribute (Indexed (spacing :: String | r)))
_spacing_ = _spacing <<< Applicative.pure

_method :: forall r. Event String -> Event (Attribute (Indexed (method :: String | r)))
_method = Functor.map (unsafeAttribute <<< { key: "method", value: _ } <<< Deku.Attribute.prop')

_method_ :: forall r. String -> Event (Attribute (Indexed (method :: String | r)))
_method_ = _method <<< Applicative.pure

_startOffset :: forall r. Event String -> Event (Attribute (Indexed (startOffset :: String | r)))
_startOffset = Functor.map
  (unsafeAttribute <<< { key: "startOffset", value: _ } <<< Deku.Attribute.prop')

_startOffset_ :: forall r. String -> Event (Attribute (Indexed (startOffset :: String | r)))
_startOffset_ = _startOffset <<< Applicative.pure

_crossorigin :: forall r. Event String -> Event (Attribute (Indexed (crossorigin :: String | r)))
_crossorigin = Functor.map
  (unsafeAttribute <<< { key: "crossorigin", value: _ } <<< Deku.Attribute.prop')

_crossorigin_ :: forall r. String -> Event (Attribute (Indexed (crossorigin :: String | r)))
_crossorigin_ = _crossorigin <<< Applicative.pure

_orient :: forall r. Event String -> Event (Attribute (Indexed (orient :: String | r)))
_orient = Functor.map (unsafeAttribute <<< { key: "orient", value: _ } <<< Deku.Attribute.prop')

_orient_ :: forall r. String -> Event (Attribute (Indexed (orient :: String | r)))
_orient_ = _orient <<< Applicative.pure

_markerHeight :: forall r. Event String -> Event (Attribute (Indexed (markerHeight :: String | r)))
_markerHeight = Functor.map
  (unsafeAttribute <<< { key: "markerHeight", value: _ } <<< Deku.Attribute.prop')

_markerHeight_ :: forall r. String -> Event (Attribute (Indexed (markerHeight :: String | r)))
_markerHeight_ = _markerHeight <<< Applicative.pure

_markerWidth :: forall r. Event String -> Event (Attribute (Indexed (markerWidth :: String | r)))
_markerWidth = Functor.map
  (unsafeAttribute <<< { key: "markerWidth", value: _ } <<< Deku.Attribute.prop')

_markerWidth_ :: forall r. String -> Event (Attribute (Indexed (markerWidth :: String | r)))
_markerWidth_ = _markerWidth <<< Applicative.pure

_markerUnits :: forall r. Event String -> Event (Attribute (Indexed (markerUnits :: String | r)))
_markerUnits = Functor.map
  (unsafeAttribute <<< { key: "markerUnits", value: _ } <<< Deku.Attribute.prop')

_markerUnits_ :: forall r. String -> Event (Attribute (Indexed (markerUnits :: String | r)))
_markerUnits_ = _markerUnits <<< Applicative.pure

_spreadMethod :: forall r. Event String -> Event (Attribute (Indexed (spreadMethod :: String | r)))
_spreadMethod = Functor.map
  (unsafeAttribute <<< { key: "spreadMethod", value: _ } <<< Deku.Attribute.prop')

_spreadMethod_ :: forall r. String -> Event (Attribute (Indexed (spreadMethod :: String | r)))
_spreadMethod_ = _spreadMethod <<< Applicative.pure

_gradientTransform
  :: forall r. Event String -> Event (Attribute (Indexed (gradientTransform :: String | r)))
_gradientTransform = Functor.map
  (unsafeAttribute <<< { key: "gradientTransform", value: _ } <<< Deku.Attribute.prop')

_gradientTransform_
  :: forall r. String -> Event (Attribute (Indexed (gradientTransform :: String | r)))
_gradientTransform_ = _gradientTransform <<< Applicative.pure

_gradientUnits
  :: forall r. Event String -> Event (Attribute (Indexed (gradientUnits :: String | r)))
_gradientUnits = Functor.map
  (unsafeAttribute <<< { key: "gradientUnits", value: _ } <<< Deku.Attribute.prop')

_gradientUnits_ :: forall r. String -> Event (Attribute (Indexed (gradientUnits :: String | r)))
_gradientUnits_ = _gradientUnits <<< Applicative.pure

_fr :: forall r. Event String -> Event (Attribute (Indexed (fr :: String | r)))
_fr = Functor.map (unsafeAttribute <<< { key: "fr", value: _ } <<< Deku.Attribute.prop')

_fr_ :: forall r. String -> Event (Attribute (Indexed (fr :: String | r)))
_fr_ = _fr <<< Applicative.pure

_fy :: forall r. Event String -> Event (Attribute (Indexed (fy :: String | r)))
_fy = Functor.map (unsafeAttribute <<< { key: "fy", value: _ } <<< Deku.Attribute.prop')

_fy_ :: forall r. String -> Event (Attribute (Indexed (fy :: String | r)))
_fy_ = _fy <<< Applicative.pure

_fx :: forall r. Event String -> Event (Attribute (Indexed (fx :: String | r)))
_fx = Functor.map (unsafeAttribute <<< { key: "fx", value: _ } <<< Deku.Attribute.prop')

_fx_ :: forall r. String -> Event (Attribute (Indexed (fx :: String | r)))
_fx_ = _fx <<< Applicative.pure

_r :: forall r. Event String -> Event (Attribute (Indexed (r :: String | r)))
_r = Functor.map (unsafeAttribute <<< { key: "r", value: _ } <<< Deku.Attribute.prop')

_r_ :: forall r. String -> Event (Attribute (Indexed (r :: String | r)))
_r_ = _r <<< Applicative.pure

_cy :: forall r. Event String -> Event (Attribute (Indexed (cy :: String | r)))
_cy = Functor.map (unsafeAttribute <<< { key: "cy", value: _ } <<< Deku.Attribute.prop')

_cy_ :: forall r. String -> Event (Attribute (Indexed (cy :: String | r)))
_cy_ = _cy <<< Applicative.pure

_cx :: forall r. Event String -> Event (Attribute (Indexed (cx :: String | r)))
_cx = Functor.map (unsafeAttribute <<< { key: "cx", value: _ } <<< Deku.Attribute.prop')

_cx_ :: forall r. String -> Event (Attribute (Indexed (cx :: String | r)))
_cx_ = _cx <<< Applicative.pure

_stopOpacity :: forall r. Event String -> Event (Attribute (Indexed (stopOpacity :: String | r)))
_stopOpacity = Functor.map
  (unsafeAttribute <<< { key: "stop-opacity", value: _ } <<< Deku.Attribute.prop')

_stopOpacity_ :: forall r. String -> Event (Attribute (Indexed (stopOpacity :: String | r)))
_stopOpacity_ = _stopOpacity <<< Applicative.pure

_stopColor :: forall r. Event String -> Event (Attribute (Indexed (stopColor :: String | r)))
_stopColor = Functor.map
  (unsafeAttribute <<< { key: "stop-color", value: _ } <<< Deku.Attribute.prop')

_stopColor_ :: forall r. String -> Event (Attribute (Indexed (stopColor :: String | r)))
_stopColor_ = _stopColor <<< Applicative.pure

_offset :: forall r. Event String -> Event (Attribute (Indexed (offset :: String | r)))
_offset = Functor.map (unsafeAttribute <<< { key: "offset", value: _ } <<< Deku.Attribute.prop')

_offset_ :: forall r. String -> Event (Attribute (Indexed (offset :: String | r)))
_offset_ = _offset <<< Applicative.pure

_height :: forall r. Event String -> Event (Attribute (Indexed (height :: String | r)))
_height = Functor.map (unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop')

_height_ :: forall r. String -> Event (Attribute (Indexed (height :: String | r)))
_height_ = _height <<< Applicative.pure

_width :: forall r. Event String -> Event (Attribute (Indexed (width :: String | r)))
_width = Functor.map (unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop')

_width_ :: forall r. String -> Event (Attribute (Indexed (width :: String | r)))
_width_ = _width <<< Applicative.pure

_patternTransform
  :: forall r. Event String -> Event (Attribute (Indexed (patternTransform :: String | r)))
_patternTransform = Functor.map
  (unsafeAttribute <<< { key: "patternTransform", value: _ } <<< Deku.Attribute.prop')

_patternTransform_
  :: forall r. String -> Event (Attribute (Indexed (patternTransform :: String | r)))
_patternTransform_ = _patternTransform <<< Applicative.pure

_patternContentUnits
  :: forall r. Event String -> Event (Attribute (Indexed (patternContentUnits :: String | r)))
_patternContentUnits = Functor.map
  (unsafeAttribute <<< { key: "patternContentUnits", value: _ } <<< Deku.Attribute.prop')

_patternContentUnits_
  :: forall r. String -> Event (Attribute (Indexed (patternContentUnits :: String | r)))
_patternContentUnits_ = _patternContentUnits <<< Applicative.pure

_patternUnits :: forall r. Event String -> Event (Attribute (Indexed (patternUnits :: String | r)))
_patternUnits = Functor.map
  (unsafeAttribute <<< { key: "patternUnits", value: _ } <<< Deku.Attribute.prop')

_patternUnits_ :: forall r. String -> Event (Attribute (Indexed (patternUnits :: String | r)))
_patternUnits_ = _patternUnits <<< Applicative.pure

_referrerpolicy
  :: forall r. Event String -> Event (Attribute (Indexed (referrerpolicy :: String | r)))
_referrerpolicy = Functor.map
  (unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<< Deku.Attribute.prop')

_referrerpolicy_ :: forall r. String -> Event (Attribute (Indexed (referrerpolicy :: String | r)))
_referrerpolicy_ = _referrerpolicy <<< Applicative.pure

_hreflang :: forall r. Event String -> Event (Attribute (Indexed (hreflang :: String | r)))
_hreflang = Functor.map
  (unsafeAttribute <<< { key: "hreflang", value: _ } <<< Deku.Attribute.prop')

_hreflang_ :: forall r. String -> Event (Attribute (Indexed (hreflang :: String | r)))
_hreflang_ = _hreflang <<< Applicative.pure

_rel :: forall r. Event String -> Event (Attribute (Indexed (rel :: String | r)))
_rel = Functor.map (unsafeAttribute <<< { key: "rel", value: _ } <<< Deku.Attribute.prop')

_rel_ :: forall r. String -> Event (Attribute (Indexed (rel :: String | r)))
_rel_ = _rel <<< Applicative.pure

_ping :: forall r. Event String -> Event (Attribute (Indexed (ping :: String | r)))
_ping = Functor.map (unsafeAttribute <<< { key: "ping", value: _ } <<< Deku.Attribute.prop')

_ping_ :: forall r. String -> Event (Attribute (Indexed (ping :: String | r)))
_ping_ = _ping <<< Applicative.pure

_download :: forall r. Event String -> Event (Attribute (Indexed (download :: String | r)))
_download = Functor.map
  (unsafeAttribute <<< { key: "download", value: _ } <<< Deku.Attribute.prop')

_download_ :: forall r. String -> Event (Attribute (Indexed (download :: String | r)))
_download_ = _download <<< Applicative.pure

_target :: forall r. Event String -> Event (Attribute (Indexed (target :: String | r)))
_target = Functor.map (unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop')

_target_ :: forall r. String -> Event (Attribute (Indexed (target :: String | r)))
_target_ = _target <<< Applicative.pure

_in :: forall r. Event String -> Event (Attribute (Indexed (in :: String | r)))
_in = Functor.map (unsafeAttribute <<< { key: "in", value: _ } <<< Deku.Attribute.prop')

_in_ :: forall r. String -> Event (Attribute (Indexed (in :: String | r)))
_in_ = _in <<< Applicative.pure

_result :: forall r. Event String -> Event (Attribute (Indexed (result :: String | r)))
_result = Functor.map (unsafeAttribute <<< { key: "result", value: _ } <<< Deku.Attribute.prop')

_result_ :: forall r. String -> Event (Attribute (Indexed (result :: String | r)))
_result_ = _result <<< Applicative.pure

_filterRes :: forall r. Event String -> Event (Attribute (Indexed (filterRes :: String | r)))
_filterRes = Functor.map
  (unsafeAttribute <<< { key: "filterRes", value: _ } <<< Deku.Attribute.prop')

_filterRes_ :: forall r. String -> Event (Attribute (Indexed (filterRes :: String | r)))
_filterRes_ = _filterRes <<< Applicative.pure

_primitiveUnits
  :: forall r. Event String -> Event (Attribute (Indexed (primitiveUnits :: String | r)))
_primitiveUnits = Functor.map
  (unsafeAttribute <<< { key: "primitiveUnits", value: _ } <<< Deku.Attribute.prop')

_primitiveUnits_ :: forall r. String -> Event (Attribute (Indexed (primitiveUnits :: String | r)))
_primitiveUnits_ = _primitiveUnits <<< Applicative.pure

_filterUnits :: forall r. Event String -> Event (Attribute (Indexed (filterUnits :: String | r)))
_filterUnits = Functor.map
  (unsafeAttribute <<< { key: "filterUnits", value: _ } <<< Deku.Attribute.prop')

_filterUnits_ :: forall r. String -> Event (Attribute (Indexed (filterUnits :: String | r)))
_filterUnits_ = _filterUnits <<< Applicative.pure

_in2 :: forall r. Event String -> Event (Attribute (Indexed (in2 :: String | r)))
_in2 = Functor.map (unsafeAttribute <<< { key: "in2", value: _ } <<< Deku.Attribute.prop')

_in2_ :: forall r. String -> Event (Attribute (Indexed (in2 :: String | r)))
_in2_ = _in2 <<< Applicative.pure

_noComposite :: forall r. Event String -> Event (Attribute (Indexed (noComposite :: String | r)))
_noComposite = Functor.map
  (unsafeAttribute <<< { key: "no-composite", value: _ } <<< Deku.Attribute.prop')

_noComposite_ :: forall r. String -> Event (Attribute (Indexed (noComposite :: String | r)))
_noComposite_ = _noComposite <<< Applicative.pure

_mode :: forall r. Event String -> Event (Attribute (Indexed (mode :: String | r)))
_mode = Functor.map (unsafeAttribute <<< { key: "mode", value: _ } <<< Deku.Attribute.prop')

_mode_ :: forall r. String -> Event (Attribute (Indexed (mode :: String | r)))
_mode_ = _mode <<< Applicative.pure

_values :: forall r. Event String -> Event (Attribute (Indexed (values :: String | r)))
_values = Functor.map (unsafeAttribute <<< { key: "values", value: _ } <<< Deku.Attribute.prop')

_values_ :: forall r. String -> Event (Attribute (Indexed (values :: String | r)))
_values_ = _values <<< Applicative.pure

_exponent :: forall r. Event String -> Event (Attribute (Indexed (exponent :: String | r)))
_exponent = Functor.map
  (unsafeAttribute <<< { key: "exponent", value: _ } <<< Deku.Attribute.prop')

_exponent_ :: forall r. String -> Event (Attribute (Indexed (exponent :: String | r)))
_exponent_ = _exponent <<< Applicative.pure

_amplitude :: forall r. Event String -> Event (Attribute (Indexed (amplitude :: String | r)))
_amplitude = Functor.map
  (unsafeAttribute <<< { key: "amplitude", value: _ } <<< Deku.Attribute.prop')

_amplitude_ :: forall r. String -> Event (Attribute (Indexed (amplitude :: String | r)))
_amplitude_ = _amplitude <<< Applicative.pure

_intercept :: forall r. Event String -> Event (Attribute (Indexed (intercept :: String | r)))
_intercept = Functor.map
  (unsafeAttribute <<< { key: "intercept", value: _ } <<< Deku.Attribute.prop')

_intercept_ :: forall r. String -> Event (Attribute (Indexed (intercept :: String | r)))
_intercept_ = _intercept <<< Applicative.pure

_slope :: forall r. Event String -> Event (Attribute (Indexed (slope :: String | r)))
_slope = Functor.map (unsafeAttribute <<< { key: "slope", value: _ } <<< Deku.Attribute.prop')

_slope_ :: forall r. String -> Event (Attribute (Indexed (slope :: String | r)))
_slope_ = _slope <<< Applicative.pure

_tableValues :: forall r. Event String -> Event (Attribute (Indexed (tableValues :: String | r)))
_tableValues = Functor.map
  (unsafeAttribute <<< { key: "tableValues", value: _ } <<< Deku.Attribute.prop')

_tableValues_ :: forall r. String -> Event (Attribute (Indexed (tableValues :: String | r)))
_tableValues_ = _tableValues <<< Applicative.pure

_k4 :: forall r. Event String -> Event (Attribute (Indexed (k4 :: String | r)))
_k4 = Functor.map (unsafeAttribute <<< { key: "k4", value: _ } <<< Deku.Attribute.prop')

_k4_ :: forall r. String -> Event (Attribute (Indexed (k4 :: String | r)))
_k4_ = _k4 <<< Applicative.pure

_k3 :: forall r. Event String -> Event (Attribute (Indexed (k3 :: String | r)))
_k3 = Functor.map (unsafeAttribute <<< { key: "k3", value: _ } <<< Deku.Attribute.prop')

_k3_ :: forall r. String -> Event (Attribute (Indexed (k3 :: String | r)))
_k3_ = _k3 <<< Applicative.pure

_k2 :: forall r. Event String -> Event (Attribute (Indexed (k2 :: String | r)))
_k2 = Functor.map (unsafeAttribute <<< { key: "k2", value: _ } <<< Deku.Attribute.prop')

_k2_ :: forall r. String -> Event (Attribute (Indexed (k2 :: String | r)))
_k2_ = _k2 <<< Applicative.pure

_k1 :: forall r. Event String -> Event (Attribute (Indexed (k1 :: String | r)))
_k1 = Functor.map (unsafeAttribute <<< { key: "k1", value: _ } <<< Deku.Attribute.prop')

_k1_ :: forall r. String -> Event (Attribute (Indexed (k1 :: String | r)))
_k1_ = _k1 <<< Applicative.pure

_preserveAlpha
  :: forall r. Event String -> Event (Attribute (Indexed (preserveAlpha :: String | r)))
_preserveAlpha = Functor.map
  (unsafeAttribute <<< { key: "preserveAlpha", value: _ } <<< Deku.Attribute.prop')

_preserveAlpha_ :: forall r. String -> Event (Attribute (Indexed (preserveAlpha :: String | r)))
_preserveAlpha_ = _preserveAlpha <<< Applicative.pure

_kernelUnitLength
  :: forall r. Event String -> Event (Attribute (Indexed (kernelUnitLength :: String | r)))
_kernelUnitLength = Functor.map
  (unsafeAttribute <<< { key: "kernelUnitLength", value: _ } <<< Deku.Attribute.prop')

_kernelUnitLength_
  :: forall r. String -> Event (Attribute (Indexed (kernelUnitLength :: String | r)))
_kernelUnitLength_ = _kernelUnitLength <<< Applicative.pure

_targetY :: forall r. Event String -> Event (Attribute (Indexed (targetY :: String | r)))
_targetY = Functor.map (unsafeAttribute <<< { key: "targetY", value: _ } <<< Deku.Attribute.prop')

_targetY_ :: forall r. String -> Event (Attribute (Indexed (targetY :: String | r)))
_targetY_ = _targetY <<< Applicative.pure

_targetX :: forall r. Event String -> Event (Attribute (Indexed (targetX :: String | r)))
_targetX = Functor.map (unsafeAttribute <<< { key: "targetX", value: _ } <<< Deku.Attribute.prop')

_targetX_ :: forall r. String -> Event (Attribute (Indexed (targetX :: String | r)))
_targetX_ = _targetX <<< Applicative.pure

_bias :: forall r. Event String -> Event (Attribute (Indexed (bias :: String | r)))
_bias = Functor.map (unsafeAttribute <<< { key: "bias", value: _ } <<< Deku.Attribute.prop')

_bias_ :: forall r. String -> Event (Attribute (Indexed (bias :: String | r)))
_bias_ = _bias <<< Applicative.pure

_divisor :: forall r. Event String -> Event (Attribute (Indexed (divisor :: String | r)))
_divisor = Functor.map (unsafeAttribute <<< { key: "divisor", value: _ } <<< Deku.Attribute.prop')

_divisor_ :: forall r. String -> Event (Attribute (Indexed (divisor :: String | r)))
_divisor_ = _divisor <<< Applicative.pure

_kernelMatrix :: forall r. Event String -> Event (Attribute (Indexed (kernelMatrix :: String | r)))
_kernelMatrix = Functor.map
  (unsafeAttribute <<< { key: "kernelMatrix", value: _ } <<< Deku.Attribute.prop')

_kernelMatrix_ :: forall r. String -> Event (Attribute (Indexed (kernelMatrix :: String | r)))
_kernelMatrix_ = _kernelMatrix <<< Applicative.pure

_order :: forall r. Event String -> Event (Attribute (Indexed (order :: String | r)))
_order = Functor.map (unsafeAttribute <<< { key: "order", value: _ } <<< Deku.Attribute.prop')

_order_ :: forall r. String -> Event (Attribute (Indexed (order :: String | r)))
_order_ = _order <<< Applicative.pure

_diffuseConstant
  :: forall r. Event String -> Event (Attribute (Indexed (diffuseConstant :: String | r)))
_diffuseConstant = Functor.map
  (unsafeAttribute <<< { key: "diffuseConstant", value: _ } <<< Deku.Attribute.prop')

_diffuseConstant_
  :: forall r. String -> Event (Attribute (Indexed (diffuseConstant :: String | r)))
_diffuseConstant_ = _diffuseConstant <<< Applicative.pure

_surfaceScale :: forall r. Event String -> Event (Attribute (Indexed (surfaceScale :: String | r)))
_surfaceScale = Functor.map
  (unsafeAttribute <<< { key: "surfaceScale", value: _ } <<< Deku.Attribute.prop')

_surfaceScale_ :: forall r. String -> Event (Attribute (Indexed (surfaceScale :: String | r)))
_surfaceScale_ = _surfaceScale <<< Applicative.pure

_yChannelSelector
  :: forall r. Event String -> Event (Attribute (Indexed (yChannelSelector :: String | r)))
_yChannelSelector = Functor.map
  (unsafeAttribute <<< { key: "yChannelSelector", value: _ } <<< Deku.Attribute.prop')

_yChannelSelector_
  :: forall r. String -> Event (Attribute (Indexed (yChannelSelector :: String | r)))
_yChannelSelector_ = _yChannelSelector <<< Applicative.pure

_xChannelSelector
  :: forall r. Event String -> Event (Attribute (Indexed (xChannelSelector :: String | r)))
_xChannelSelector = Functor.map
  (unsafeAttribute <<< { key: "xChannelSelector", value: _ } <<< Deku.Attribute.prop')

_xChannelSelector_
  :: forall r. String -> Event (Attribute (Indexed (xChannelSelector :: String | r)))
_xChannelSelector_ = _xChannelSelector <<< Applicative.pure

_scale :: forall r. Event String -> Event (Attribute (Indexed (scale :: String | r)))
_scale = Functor.map (unsafeAttribute <<< { key: "scale", value: _ } <<< Deku.Attribute.prop')

_scale_ :: forall r. String -> Event (Attribute (Indexed (scale :: String | r)))
_scale_ = _scale <<< Applicative.pure

_stdDeviation :: forall r. Event String -> Event (Attribute (Indexed (stdDeviation :: String | r)))
_stdDeviation = Functor.map
  (unsafeAttribute <<< { key: "stdDeviation", value: _ } <<< Deku.Attribute.prop')

_stdDeviation_ :: forall r. String -> Event (Attribute (Indexed (stdDeviation :: String | r)))
_stdDeviation_ = _stdDeviation <<< Applicative.pure

_radius :: forall r. Event String -> Event (Attribute (Indexed (radius :: String | r)))
_radius = Functor.map (unsafeAttribute <<< { key: "radius", value: _ } <<< Deku.Attribute.prop')

_radius_ :: forall r. String -> Event (Attribute (Indexed (radius :: String | r)))
_radius_ = _radius <<< Applicative.pure

_specularExponent
  :: forall r. Event String -> Event (Attribute (Indexed (specularExponent :: String | r)))
_specularExponent = Functor.map
  (unsafeAttribute <<< { key: "specularExponent", value: _ } <<< Deku.Attribute.prop')

_specularExponent_
  :: forall r. String -> Event (Attribute (Indexed (specularExponent :: String | r)))
_specularExponent_ = _specularExponent <<< Applicative.pure

_specularConstant
  :: forall r. Event String -> Event (Attribute (Indexed (specularConstant :: String | r)))
_specularConstant = Functor.map
  (unsafeAttribute <<< { key: "specularConstant", value: _ } <<< Deku.Attribute.prop')

_specularConstant_
  :: forall r. String -> Event (Attribute (Indexed (specularConstant :: String | r)))
_specularConstant_ = _specularConstant <<< Applicative.pure

_stitchTiles :: forall r. Event String -> Event (Attribute (Indexed (stitchTiles :: String | r)))
_stitchTiles = Functor.map
  (unsafeAttribute <<< { key: "stitchTiles", value: _ } <<< Deku.Attribute.prop')

_stitchTiles_ :: forall r. String -> Event (Attribute (Indexed (stitchTiles :: String | r)))
_stitchTiles_ = _stitchTiles <<< Applicative.pure

_seed :: forall r. Event String -> Event (Attribute (Indexed (seed :: String | r)))
_seed = Functor.map (unsafeAttribute <<< { key: "seed", value: _ } <<< Deku.Attribute.prop')

_seed_ :: forall r. String -> Event (Attribute (Indexed (seed :: String | r)))
_seed_ = _seed <<< Applicative.pure

_numOctaves :: forall r. Event String -> Event (Attribute (Indexed (numOctaves :: String | r)))
_numOctaves = Functor.map
  (unsafeAttribute <<< { key: "numOctaves", value: _ } <<< Deku.Attribute.prop')

_numOctaves_ :: forall r. String -> Event (Attribute (Indexed (numOctaves :: String | r)))
_numOctaves_ = _numOctaves <<< Applicative.pure

_baseFrequency
  :: forall r. Event String -> Event (Attribute (Indexed (baseFrequency :: String | r)))
_baseFrequency = Functor.map
  (unsafeAttribute <<< { key: "baseFrequency", value: _ } <<< Deku.Attribute.prop')

_baseFrequency_ :: forall r. String -> Event (Attribute (Indexed (baseFrequency :: String | r)))
_baseFrequency_ = _baseFrequency <<< Applicative.pure

_elevation :: forall r. Event String -> Event (Attribute (Indexed (elevation :: String | r)))
_elevation = Functor.map
  (unsafeAttribute <<< { key: "elevation", value: _ } <<< Deku.Attribute.prop')

_elevation_ :: forall r. String -> Event (Attribute (Indexed (elevation :: String | r)))
_elevation_ = _elevation <<< Applicative.pure

_azimuth :: forall r. Event String -> Event (Attribute (Indexed (azimuth :: String | r)))
_azimuth = Functor.map (unsafeAttribute <<< { key: "azimuth", value: _ } <<< Deku.Attribute.prop')

_azimuth_ :: forall r. String -> Event (Attribute (Indexed (azimuth :: String | r)))
_azimuth_ = _azimuth <<< Applicative.pure

_z :: forall r. Event String -> Event (Attribute (Indexed (z :: String | r)))
_z = Functor.map (unsafeAttribute <<< { key: "z", value: _ } <<< Deku.Attribute.prop')

_z_ :: forall r. String -> Event (Attribute (Indexed (z :: String | r)))
_z_ = _z <<< Applicative.pure

_limitingConeAngle
  :: forall r. Event String -> Event (Attribute (Indexed (limitingConeAngle :: String | r)))
_limitingConeAngle = Functor.map
  (unsafeAttribute <<< { key: "limitingConeAngle", value: _ } <<< Deku.Attribute.prop')

_limitingConeAngle_
  :: forall r. String -> Event (Attribute (Indexed (limitingConeAngle :: String | r)))
_limitingConeAngle_ = _limitingConeAngle <<< Applicative.pure

_pointsAtZ :: forall r. Event String -> Event (Attribute (Indexed (pointsAtZ :: String | r)))
_pointsAtZ = Functor.map
  (unsafeAttribute <<< { key: "pointsAtZ", value: _ } <<< Deku.Attribute.prop')

_pointsAtZ_ :: forall r. String -> Event (Attribute (Indexed (pointsAtZ :: String | r)))
_pointsAtZ_ = _pointsAtZ <<< Applicative.pure

_pointsAtY :: forall r. Event String -> Event (Attribute (Indexed (pointsAtY :: String | r)))
_pointsAtY = Functor.map
  (unsafeAttribute <<< { key: "pointsAtY", value: _ } <<< Deku.Attribute.prop')

_pointsAtY_ :: forall r. String -> Event (Attribute (Indexed (pointsAtY :: String | r)))
_pointsAtY_ = _pointsAtY <<< Applicative.pure

_pointsAtX :: forall r. Event String -> Event (Attribute (Indexed (pointsAtX :: String | r)))
_pointsAtX = Functor.map
  (unsafeAttribute <<< { key: "pointsAtX", value: _ } <<< Deku.Attribute.prop')

_pointsAtX_ :: forall r. String -> Event (Attribute (Indexed (pointsAtX :: String | r)))
_pointsAtX_ = _pointsAtX <<< Applicative.pure

_origin :: forall r. Event String -> Event (Attribute (Indexed (origin :: String | r)))
_origin = Functor.map (unsafeAttribute <<< { key: "origin", value: _ } <<< Deku.Attribute.prop')

_origin_ :: forall r. String -> Event (Attribute (Indexed (origin :: String | r)))
_origin_ = _origin <<< Applicative.pure

_keyPoints :: forall r. Event String -> Event (Attribute (Indexed (keyPoints :: String | r)))
_keyPoints = Functor.map
  (unsafeAttribute <<< { key: "keyPoints", value: _ } <<< Deku.Attribute.prop')

_keyPoints_ :: forall r. String -> Event (Attribute (Indexed (keyPoints :: String | r)))
_keyPoints_ = _keyPoints <<< Applicative.pure

_accumulate :: forall r. Event String -> Event (Attribute (Indexed (accumulate :: String | r)))
_accumulate = Functor.map
  (unsafeAttribute <<< { key: "accumulate", value: _ } <<< Deku.Attribute.prop')

_accumulate_ :: forall r. String -> Event (Attribute (Indexed (accumulate :: String | r)))
_accumulate_ = _accumulate <<< Applicative.pure

_additive :: forall r. Event String -> Event (Attribute (Indexed (additive :: String | r)))
_additive = Functor.map
  (unsafeAttribute <<< { key: "additive", value: _ } <<< Deku.Attribute.prop')

_additive_ :: forall r. String -> Event (Attribute (Indexed (additive :: String | r)))
_additive_ = _additive <<< Applicative.pure

_from :: forall r. Event String -> Event (Attribute (Indexed (from :: String | r)))
_from = Functor.map (unsafeAttribute <<< { key: "from", value: _ } <<< Deku.Attribute.prop')

_from_ :: forall r. String -> Event (Attribute (Indexed (from :: String | r)))
_from_ = _from <<< Applicative.pure

_keySplines :: forall r. Event String -> Event (Attribute (Indexed (keySplines :: String | r)))
_keySplines = Functor.map
  (unsafeAttribute <<< { key: "keySplines", value: _ } <<< Deku.Attribute.prop')

_keySplines_ :: forall r. String -> Event (Attribute (Indexed (keySplines :: String | r)))
_keySplines_ = _keySplines <<< Applicative.pure

_keyTimes :: forall r. Event String -> Event (Attribute (Indexed (keyTimes :: String | r)))
_keyTimes = Functor.map
  (unsafeAttribute <<< { key: "keyTimes", value: _ } <<< Deku.Attribute.prop')

_keyTimes_ :: forall r. String -> Event (Attribute (Indexed (keyTimes :: String | r)))
_keyTimes_ = _keyTimes <<< Applicative.pure

_fill :: forall r. Event String -> Event (Attribute (Indexed (fill :: String | r)))
_fill = Functor.map (unsafeAttribute <<< { key: "fill", value: _ } <<< Deku.Attribute.prop')

_fill_ :: forall r. String -> Event (Attribute (Indexed (fill :: String | r)))
_fill_ = _fill <<< Applicative.pure

_repeatDur :: forall r. Event String -> Event (Attribute (Indexed (repeatDur :: String | r)))
_repeatDur = Functor.map
  (unsafeAttribute <<< { key: "repeatDur", value: _ } <<< Deku.Attribute.prop')

_repeatDur_ :: forall r. String -> Event (Attribute (Indexed (repeatDur :: String | r)))
_repeatDur_ = _repeatDur <<< Applicative.pure

_repeatCount :: forall r. Event String -> Event (Attribute (Indexed (repeatCount :: String | r)))
_repeatCount = Functor.map
  (unsafeAttribute <<< { key: "repeatCount", value: _ } <<< Deku.Attribute.prop')

_repeatCount_ :: forall r. String -> Event (Attribute (Indexed (repeatCount :: String | r)))
_repeatCount_ = _repeatCount <<< Applicative.pure

_restart :: forall r. Event String -> Event (Attribute (Indexed (restart :: String | r)))
_restart = Functor.map (unsafeAttribute <<< { key: "restart", value: _ } <<< Deku.Attribute.prop')

_restart_ :: forall r. String -> Event (Attribute (Indexed (restart :: String | r)))
_restart_ = _restart <<< Applicative.pure

_max :: forall r. Event String -> Event (Attribute (Indexed (max :: String | r)))
_max = Functor.map (unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop')

_max_ :: forall r. String -> Event (Attribute (Indexed (max :: String | r)))
_max_ = _max <<< Applicative.pure

_min :: forall r. Event String -> Event (Attribute (Indexed (min :: String | r)))
_min = Functor.map (unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop')

_min_ :: forall r. String -> Event (Attribute (Indexed (min :: String | r)))
_min_ = _min <<< Applicative.pure

_end :: forall r. Event String -> Event (Attribute (Indexed (end :: String | r)))
_end = Functor.map (unsafeAttribute <<< { key: "end", value: _ } <<< Deku.Attribute.prop')

_end_ :: forall r. String -> Event (Attribute (Indexed (end :: String | r)))
_end_ = _end <<< Applicative.pure

_dur :: forall r. Event String -> Event (Attribute (Indexed (dur :: String | r)))
_dur = Functor.map (unsafeAttribute <<< { key: "dur", value: _ } <<< Deku.Attribute.prop')

_dur_ :: forall r. String -> Event (Attribute (Indexed (dur :: String | r)))
_dur_ = _dur <<< Applicative.pure

_begin :: forall r. Event String -> Event (Attribute (Indexed (begin :: String | r)))
_begin = Functor.map (unsafeAttribute <<< { key: "begin", value: _ } <<< Deku.Attribute.prop')

_begin_ :: forall r. String -> Event (Attribute (Indexed (begin :: String | r)))
_begin_ = _begin <<< Applicative.pure

_attributeName
  :: forall r. Event String -> Event (Attribute (Indexed (attributeName :: String | r)))
_attributeName = Functor.map
  (unsafeAttribute <<< { key: "attributeName", value: _ } <<< Deku.Attribute.prop')

_attributeName_ :: forall r. String -> Event (Attribute (Indexed (attributeName :: String | r)))
_attributeName_ = _attributeName <<< Applicative.pure

_onrepeat
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onrepeat = Functor.map
  (unsafeAttribute <<< { key: "onrepeat", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onrepeat_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onrepeat :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onrepeat_ = _onrepeat <<< Applicative.pure

_onend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onend = Functor.map
  (unsafeAttribute <<< { key: "onend", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onend_ = _onend <<< Applicative.pure

_onbegin
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onbegin = Functor.map
  (unsafeAttribute <<< { key: "onbegin", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onbegin_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onbegin :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onbegin_ = _onbegin <<< Applicative.pure

_by :: forall r. Event String -> Event (Attribute (Indexed (by :: String | r)))
_by = Functor.map (unsafeAttribute <<< { key: "by", value: _ } <<< Deku.Attribute.prop')

_by_ :: forall r. String -> Event (Attribute (Indexed (by :: String | r)))
_by_ = _by <<< Applicative.pure

_to :: forall r. Event String -> Event (Attribute (Indexed (to :: String | r)))
_to = Functor.map (unsafeAttribute <<< { key: "to", value: _ } <<< Deku.Attribute.prop')

_to_ :: forall r. String -> Event (Attribute (Indexed (to :: String | r)))
_to_ = _to <<< Applicative.pure

_calcMode :: forall r. Event String -> Event (Attribute (Indexed (calcMode :: String | r)))
_calcMode = Functor.map
  (unsafeAttribute <<< { key: "calcMode", value: _ } <<< Deku.Attribute.prop')

_calcMode_ :: forall r. String -> Event (Attribute (Indexed (calcMode :: String | r)))
_calcMode_ = _calcMode <<< Applicative.pure

_lightingColor
  :: forall r. Event String -> Event (Attribute (Indexed (lightingColor :: String | r)))
_lightingColor = Functor.map
  (unsafeAttribute <<< { key: "lighting-color", value: _ } <<< Deku.Attribute.prop')

_lightingColor_ :: forall r. String -> Event (Attribute (Indexed (lightingColor :: String | r)))
_lightingColor_ = _lightingColor <<< Applicative.pure

_colorInterpolationFilters
  :: forall r. Event String -> Event (Attribute (Indexed (colorInterpolationFilters :: String | r)))
_colorInterpolationFilters = Functor.map
  (unsafeAttribute <<< { key: "color-interpolation-filters", value: _ } <<< Deku.Attribute.prop')

_colorInterpolationFilters_
  :: forall r. String -> Event (Attribute (Indexed (colorInterpolationFilters :: String | r)))
_colorInterpolationFilters_ = _colorInterpolationFilters <<< Applicative.pure

_floodOpacity :: forall r. Event String -> Event (Attribute (Indexed (floodOpacity :: String | r)))
_floodOpacity = Functor.map
  (unsafeAttribute <<< { key: "flood-opacity", value: _ } <<< Deku.Attribute.prop')

_floodOpacity_ :: forall r. String -> Event (Attribute (Indexed (floodOpacity :: String | r)))
_floodOpacity_ = _floodOpacity <<< Applicative.pure

_floodColor :: forall r. Event String -> Event (Attribute (Indexed (floodColor :: String | r)))
_floodColor = Functor.map
  (unsafeAttribute <<< { key: "flood-color", value: _ } <<< Deku.Attribute.prop')

_floodColor_ :: forall r. String -> Event (Attribute (Indexed (floodColor :: String | r)))
_floodColor_ = _floodColor <<< Applicative.pure

_filter :: forall r. Event String -> Event (Attribute (Indexed (filter :: String | r)))
_filter = Functor.map (unsafeAttribute <<< { key: "filter", value: _ } <<< Deku.Attribute.prop')

_filter_ :: forall r. String -> Event (Attribute (Indexed (filter :: String | r)))
_filter_ = _filter <<< Applicative.pure

_strokeOpacity
  :: forall r. Event String -> Event (Attribute (Indexed (strokeOpacity :: String | r)))
_strokeOpacity = Functor.map
  (unsafeAttribute <<< { key: "stroke-opacity", value: _ } <<< Deku.Attribute.prop')

_strokeOpacity_ :: forall r. String -> Event (Attribute (Indexed (strokeOpacity :: String | r)))
_strokeOpacity_ = _strokeOpacity <<< Applicative.pure

_stroke :: forall r. Event String -> Event (Attribute (Indexed (stroke :: String | r)))
_stroke = Functor.map (unsafeAttribute <<< { key: "stroke", value: _ } <<< Deku.Attribute.prop')

_stroke_ :: forall r. String -> Event (Attribute (Indexed (stroke :: String | r)))
_stroke_ = _stroke <<< Applicative.pure

_strokeRepeat :: forall r. Event String -> Event (Attribute (Indexed (strokeRepeat :: String | r)))
_strokeRepeat = Functor.map
  (unsafeAttribute <<< { key: "stroke-repeat", value: _ } <<< Deku.Attribute.prop')

_strokeRepeat_ :: forall r. String -> Event (Attribute (Indexed (strokeRepeat :: String | r)))
_strokeRepeat_ = _strokeRepeat <<< Applicative.pure

_strokeSize :: forall r. Event String -> Event (Attribute (Indexed (strokeSize :: String | r)))
_strokeSize = Functor.map
  (unsafeAttribute <<< { key: "stroke-size", value: _ } <<< Deku.Attribute.prop')

_strokeSize_ :: forall r. String -> Event (Attribute (Indexed (strokeSize :: String | r)))
_strokeSize_ = _strokeSize <<< Applicative.pure

_strokePosition
  :: forall r. Event String -> Event (Attribute (Indexed (strokePosition :: String | r)))
_strokePosition = Functor.map
  (unsafeAttribute <<< { key: "stroke-position", value: _ } <<< Deku.Attribute.prop')

_strokePosition_ :: forall r. String -> Event (Attribute (Indexed (strokePosition :: String | r)))
_strokePosition_ = _strokePosition <<< Applicative.pure

_strokeOrigin :: forall r. Event String -> Event (Attribute (Indexed (strokeOrigin :: String | r)))
_strokeOrigin = Functor.map
  (unsafeAttribute <<< { key: "stroke-origin", value: _ } <<< Deku.Attribute.prop')

_strokeOrigin_ :: forall r. String -> Event (Attribute (Indexed (strokeOrigin :: String | r)))
_strokeOrigin_ = _strokeOrigin <<< Applicative.pure

_strokeImage :: forall r. Event String -> Event (Attribute (Indexed (strokeImage :: String | r)))
_strokeImage = Functor.map
  (unsafeAttribute <<< { key: "stroke-image", value: _ } <<< Deku.Attribute.prop')

_strokeImage_ :: forall r. String -> Event (Attribute (Indexed (strokeImage :: String | r)))
_strokeImage_ = _strokeImage <<< Applicative.pure

_strokeColor :: forall r. Event String -> Event (Attribute (Indexed (strokeColor :: String | r)))
_strokeColor = Functor.map
  (unsafeAttribute <<< { key: "stroke-color", value: _ } <<< Deku.Attribute.prop')

_strokeColor_ :: forall r. String -> Event (Attribute (Indexed (strokeColor :: String | r)))
_strokeColor_ = _strokeColor <<< Applicative.pure

_strokeDashJustify
  :: forall r. Event String -> Event (Attribute (Indexed (strokeDashJustify :: String | r)))
_strokeDashJustify = Functor.map
  (unsafeAttribute <<< { key: "stroke-dash-justify", value: _ } <<< Deku.Attribute.prop')

_strokeDashJustify_
  :: forall r. String -> Event (Attribute (Indexed (strokeDashJustify :: String | r)))
_strokeDashJustify_ = _strokeDashJustify <<< Applicative.pure

_strokeDashCorner
  :: forall r. Event String -> Event (Attribute (Indexed (strokeDashCorner :: String | r)))
_strokeDashCorner = Functor.map
  (unsafeAttribute <<< { key: "stroke-dash-corner", value: _ } <<< Deku.Attribute.prop')

_strokeDashCorner_
  :: forall r. String -> Event (Attribute (Indexed (strokeDashCorner :: String | r)))
_strokeDashCorner_ = _strokeDashCorner <<< Applicative.pure

_strokeDashoffset
  :: forall r. Event String -> Event (Attribute (Indexed (strokeDashoffset :: String | r)))
_strokeDashoffset = Functor.map
  (unsafeAttribute <<< { key: "stroke-dashoffset", value: _ } <<< Deku.Attribute.prop')

_strokeDashoffset_
  :: forall r. String -> Event (Attribute (Indexed (strokeDashoffset :: String | r)))
_strokeDashoffset_ = _strokeDashoffset <<< Applicative.pure

_strokeDasharray
  :: forall r. Event String -> Event (Attribute (Indexed (strokeDasharray :: String | r)))
_strokeDasharray = Functor.map
  (unsafeAttribute <<< { key: "stroke-dasharray", value: _ } <<< Deku.Attribute.prop')

_strokeDasharray_
  :: forall r. String -> Event (Attribute (Indexed (strokeDasharray :: String | r)))
_strokeDasharray_ = _strokeDasharray <<< Applicative.pure

_strokeBreak :: forall r. Event String -> Event (Attribute (Indexed (strokeBreak :: String | r)))
_strokeBreak = Functor.map
  (unsafeAttribute <<< { key: "stroke-break", value: _ } <<< Deku.Attribute.prop')

_strokeBreak_ :: forall r. String -> Event (Attribute (Indexed (strokeBreak :: String | r)))
_strokeBreak_ = _strokeBreak <<< Applicative.pure

_strokeMiterlimit
  :: forall r. Event String -> Event (Attribute (Indexed (strokeMiterlimit :: String | r)))
_strokeMiterlimit = Functor.map
  (unsafeAttribute <<< { key: "stroke-miterlimit", value: _ } <<< Deku.Attribute.prop')

_strokeMiterlimit_
  :: forall r. String -> Event (Attribute (Indexed (strokeMiterlimit :: String | r)))
_strokeMiterlimit_ = _strokeMiterlimit <<< Applicative.pure

_strokeLinejoin
  :: forall r. Event String -> Event (Attribute (Indexed (strokeLinejoin :: String | r)))
_strokeLinejoin = Functor.map
  (unsafeAttribute <<< { key: "stroke-linejoin", value: _ } <<< Deku.Attribute.prop')

_strokeLinejoin_ :: forall r. String -> Event (Attribute (Indexed (strokeLinejoin :: String | r)))
_strokeLinejoin_ = _strokeLinejoin <<< Applicative.pure

_strokeLinecap
  :: forall r. Event String -> Event (Attribute (Indexed (strokeLinecap :: String | r)))
_strokeLinecap = Functor.map
  (unsafeAttribute <<< { key: "stroke-linecap", value: _ } <<< Deku.Attribute.prop')

_strokeLinecap_ :: forall r. String -> Event (Attribute (Indexed (strokeLinecap :: String | r)))
_strokeLinecap_ = _strokeLinecap <<< Applicative.pure

_strokeAlign :: forall r. Event String -> Event (Attribute (Indexed (strokeAlign :: String | r)))
_strokeAlign = Functor.map
  (unsafeAttribute <<< { key: "stroke-align", value: _ } <<< Deku.Attribute.prop')

_strokeAlign_ :: forall r. String -> Event (Attribute (Indexed (strokeAlign :: String | r)))
_strokeAlign_ = _strokeAlign <<< Applicative.pure

_strokeWidth :: forall r. Event String -> Event (Attribute (Indexed (strokeWidth :: String | r)))
_strokeWidth = Functor.map
  (unsafeAttribute <<< { key: "stroke-width", value: _ } <<< Deku.Attribute.prop')

_strokeWidth_ :: forall r. String -> Event (Attribute (Indexed (strokeWidth :: String | r)))
_strokeWidth_ = _strokeWidth <<< Applicative.pure

_fillOpacity :: forall r. Event String -> Event (Attribute (Indexed (fillOpacity :: String | r)))
_fillOpacity = Functor.map
  (unsafeAttribute <<< { key: "fill-opacity", value: _ } <<< Deku.Attribute.prop')

_fillOpacity_ :: forall r. String -> Event (Attribute (Indexed (fillOpacity :: String | r)))
_fillOpacity_ = _fillOpacity <<< Applicative.pure

_fillRepeat :: forall r. Event String -> Event (Attribute (Indexed (fillRepeat :: String | r)))
_fillRepeat = Functor.map
  (unsafeAttribute <<< { key: "fill-repeat", value: _ } <<< Deku.Attribute.prop')

_fillRepeat_ :: forall r. String -> Event (Attribute (Indexed (fillRepeat :: String | r)))
_fillRepeat_ = _fillRepeat <<< Applicative.pure

_fillSize :: forall r. Event String -> Event (Attribute (Indexed (fillSize :: String | r)))
_fillSize = Functor.map
  (unsafeAttribute <<< { key: "fill-size", value: _ } <<< Deku.Attribute.prop')

_fillSize_ :: forall r. String -> Event (Attribute (Indexed (fillSize :: String | r)))
_fillSize_ = _fillSize <<< Applicative.pure

_fillPosition :: forall r. Event String -> Event (Attribute (Indexed (fillPosition :: String | r)))
_fillPosition = Functor.map
  (unsafeAttribute <<< { key: "fill-position", value: _ } <<< Deku.Attribute.prop')

_fillPosition_ :: forall r. String -> Event (Attribute (Indexed (fillPosition :: String | r)))
_fillPosition_ = _fillPosition <<< Applicative.pure

_fillOrigin :: forall r. Event String -> Event (Attribute (Indexed (fillOrigin :: String | r)))
_fillOrigin = Functor.map
  (unsafeAttribute <<< { key: "fill-origin", value: _ } <<< Deku.Attribute.prop')

_fillOrigin_ :: forall r. String -> Event (Attribute (Indexed (fillOrigin :: String | r)))
_fillOrigin_ = _fillOrigin <<< Applicative.pure

_fillImage :: forall r. Event String -> Event (Attribute (Indexed (fillImage :: String | r)))
_fillImage = Functor.map
  (unsafeAttribute <<< { key: "fill-image", value: _ } <<< Deku.Attribute.prop')

_fillImage_ :: forall r. String -> Event (Attribute (Indexed (fillImage :: String | r)))
_fillImage_ = _fillImage <<< Applicative.pure

_fillColor :: forall r. Event String -> Event (Attribute (Indexed (fillColor :: String | r)))
_fillColor = Functor.map
  (unsafeAttribute <<< { key: "fill-color", value: _ } <<< Deku.Attribute.prop')

_fillColor_ :: forall r. String -> Event (Attribute (Indexed (fillColor :: String | r)))
_fillColor_ = _fillColor <<< Applicative.pure

_fillBreak :: forall r. Event String -> Event (Attribute (Indexed (fillBreak :: String | r)))
_fillBreak = Functor.map
  (unsafeAttribute <<< { key: "fill-break", value: _ } <<< Deku.Attribute.prop')

_fillBreak_ :: forall r. String -> Event (Attribute (Indexed (fillBreak :: String | r)))
_fillBreak_ = _fillBreak <<< Applicative.pure

_fillRule :: forall r. Event String -> Event (Attribute (Indexed (fillRule :: String | r)))
_fillRule = Functor.map
  (unsafeAttribute <<< { key: "fill-rule", value: _ } <<< Deku.Attribute.prop')

_fillRule_ :: forall r. String -> Event (Attribute (Indexed (fillRule :: String | r)))
_fillRule_ = _fillRule <<< Applicative.pure

_pointerEvents
  :: forall r. Event String -> Event (Attribute (Indexed (pointerEvents :: String | r)))
_pointerEvents = Functor.map
  (unsafeAttribute <<< { key: "pointer-events", value: _ } <<< Deku.Attribute.prop')

_pointerEvents_ :: forall r. String -> Event (Attribute (Indexed (pointerEvents :: String | r)))
_pointerEvents_ = _pointerEvents <<< Applicative.pure

_imageRendering
  :: forall r. Event String -> Event (Attribute (Indexed (imageRendering :: String | r)))
_imageRendering = Functor.map
  (unsafeAttribute <<< { key: "image-rendering", value: _ } <<< Deku.Attribute.prop')

_imageRendering_ :: forall r. String -> Event (Attribute (Indexed (imageRendering :: String | r)))
_imageRendering_ = _imageRendering <<< Applicative.pure

_textRendering
  :: forall r. Event String -> Event (Attribute (Indexed (textRendering :: String | r)))
_textRendering = Functor.map
  (unsafeAttribute <<< { key: "text-rendering", value: _ } <<< Deku.Attribute.prop')

_textRendering_ :: forall r. String -> Event (Attribute (Indexed (textRendering :: String | r)))
_textRendering_ = _textRendering <<< Applicative.pure

_shapeRendering
  :: forall r. Event String -> Event (Attribute (Indexed (shapeRendering :: String | r)))
_shapeRendering = Functor.map
  (unsafeAttribute <<< { key: "shape-rendering", value: _ } <<< Deku.Attribute.prop')

_shapeRendering_ :: forall r. String -> Event (Attribute (Indexed (shapeRendering :: String | r)))
_shapeRendering_ = _shapeRendering <<< Applicative.pure

_colorInterpolation
  :: forall r. Event String -> Event (Attribute (Indexed (colorInterpolation :: String | r)))
_colorInterpolation = Functor.map
  (unsafeAttribute <<< { key: "color-interpolation", value: _ } <<< Deku.Attribute.prop')

_colorInterpolation_
  :: forall r. String -> Event (Attribute (Indexed (colorInterpolation :: String | r)))
_colorInterpolation_ = _colorInterpolation <<< Applicative.pure

_paintOrder :: forall r. Event String -> Event (Attribute (Indexed (paintOrder :: String | r)))
_paintOrder = Functor.map
  (unsafeAttribute <<< { key: "paint-order", value: _ } <<< Deku.Attribute.prop')

_paintOrder_ :: forall r. String -> Event (Attribute (Indexed (paintOrder :: String | r)))
_paintOrder_ = _paintOrder <<< Applicative.pure

_marker :: forall r. Event String -> Event (Attribute (Indexed (marker :: String | r)))
_marker = Functor.map (unsafeAttribute <<< { key: "marker", value: _ } <<< Deku.Attribute.prop')

_marker_ :: forall r. String -> Event (Attribute (Indexed (marker :: String | r)))
_marker_ = _marker <<< Applicative.pure

_markerEnd :: forall r. Event String -> Event (Attribute (Indexed (markerEnd :: String | r)))
_markerEnd = Functor.map
  (unsafeAttribute <<< { key: "marker-end", value: _ } <<< Deku.Attribute.prop')

_markerEnd_ :: forall r. String -> Event (Attribute (Indexed (markerEnd :: String | r)))
_markerEnd_ = _markerEnd <<< Applicative.pure

_markerMid :: forall r. Event String -> Event (Attribute (Indexed (markerMid :: String | r)))
_markerMid = Functor.map
  (unsafeAttribute <<< { key: "marker-mid", value: _ } <<< Deku.Attribute.prop')

_markerMid_ :: forall r. String -> Event (Attribute (Indexed (markerMid :: String | r)))
_markerMid_ = _markerMid <<< Applicative.pure

_markerStart :: forall r. Event String -> Event (Attribute (Indexed (markerStart :: String | r)))
_markerStart = Functor.map
  (unsafeAttribute <<< { key: "marker-start", value: _ } <<< Deku.Attribute.prop')

_markerStart_ :: forall r. String -> Event (Attribute (Indexed (markerStart :: String | r)))
_markerStart_ = _markerStart <<< Applicative.pure

_textAnchor :: forall r. Event String -> Event (Attribute (Indexed (textAnchor :: String | r)))
_textAnchor = Functor.map
  (unsafeAttribute <<< { key: "text-anchor", value: _ } <<< Deku.Attribute.prop')

_textAnchor_ :: forall r. String -> Event (Attribute (Indexed (textAnchor :: String | r)))
_textAnchor_ = _textAnchor <<< Applicative.pure

_shapeMargin :: forall r. Event String -> Event (Attribute (Indexed (shapeMargin :: String | r)))
_shapeMargin = Functor.map
  (unsafeAttribute <<< { key: "shape-margin", value: _ } <<< Deku.Attribute.prop')

_shapeMargin_ :: forall r. String -> Event (Attribute (Indexed (shapeMargin :: String | r)))
_shapeMargin_ = _shapeMargin <<< Applicative.pure

_shapeSubtract
  :: forall r. Event String -> Event (Attribute (Indexed (shapeSubtract :: String | r)))
_shapeSubtract = Functor.map
  (unsafeAttribute <<< { key: "shape-subtract", value: _ } <<< Deku.Attribute.prop')

_shapeSubtract_ :: forall r. String -> Event (Attribute (Indexed (shapeSubtract :: String | r)))
_shapeSubtract_ = _shapeSubtract <<< Applicative.pure

_shapeInside :: forall r. Event String -> Event (Attribute (Indexed (shapeInside :: String | r)))
_shapeInside = Functor.map
  (unsafeAttribute <<< { key: "shape-inside", value: _ } <<< Deku.Attribute.prop')

_shapeInside_ :: forall r. String -> Event (Attribute (Indexed (shapeInside :: String | r)))
_shapeInside_ = _shapeInside <<< Applicative.pure

_inlineSize :: forall r. Event String -> Event (Attribute (Indexed (inlineSize :: String | r)))
_inlineSize = Functor.map
  (unsafeAttribute <<< { key: "inline-size", value: _ } <<< Deku.Attribute.prop')

_inlineSize_ :: forall r. String -> Event (Attribute (Indexed (inlineSize :: String | r)))
_inlineSize_ = _inlineSize <<< Applicative.pure

_d :: forall r. Event String -> Event (Attribute (Indexed (d :: String | r)))
_d = Functor.map (unsafeAttribute <<< { key: "d", value: _ } <<< Deku.Attribute.prop')

_d_ :: forall r. String -> Event (Attribute (Indexed (d :: String | r)))
_d_ = _d <<< Applicative.pure

_vectorEffect :: forall r. Event String -> Event (Attribute (Indexed (vectorEffect :: String | r)))
_vectorEffect = Functor.map
  (unsafeAttribute <<< { key: "vector-effect", value: _ } <<< Deku.Attribute.prop')

_vectorEffect_ :: forall r. String -> Event (Attribute (Indexed (vectorEffect :: String | r)))
_vectorEffect_ = _vectorEffect <<< Applicative.pure

_ry :: forall r. Event String -> Event (Attribute (Indexed (ry :: String | r)))
_ry = Functor.map (unsafeAttribute <<< { key: "ry", value: _ } <<< Deku.Attribute.prop')

_ry_ :: forall r. String -> Event (Attribute (Indexed (ry :: String | r)))
_ry_ = _ry <<< Applicative.pure

_rx :: forall r. Event String -> Event (Attribute (Indexed (rx :: String | r)))
_rx = Functor.map (unsafeAttribute <<< { key: "rx", value: _ } <<< Deku.Attribute.prop')

_rx_ :: forall r. String -> Event (Attribute (Indexed (rx :: String | r)))
_rx_ = _rx <<< Applicative.pure

_alignmentBaseline
  :: forall r. Event String -> Event (Attribute (Indexed (alignmentBaseline :: String | r)))
_alignmentBaseline = Functor.map
  (unsafeAttribute <<< { key: "alignment-baseline", value: _ } <<< Deku.Attribute.prop')

_alignmentBaseline_
  :: forall r. String -> Event (Attribute (Indexed (alignmentBaseline :: String | r)))
_alignmentBaseline_ = _alignmentBaseline <<< Applicative.pure

_baselineShift
  :: forall r. Event String -> Event (Attribute (Indexed (baselineShift :: String | r)))
_baselineShift = Functor.map
  (unsafeAttribute <<< { key: "baseline-shift", value: _ } <<< Deku.Attribute.prop')

_baselineShift_ :: forall r. String -> Event (Attribute (Indexed (baselineShift :: String | r)))
_baselineShift_ = _baselineShift <<< Applicative.pure

_dominantBaseline
  :: forall r. Event String -> Event (Attribute (Indexed (dominantBaseline :: String | r)))
_dominantBaseline = Functor.map
  (unsafeAttribute <<< { key: "dominant-baseline", value: _ } <<< Deku.Attribute.prop')

_dominantBaseline_
  :: forall r. String -> Event (Attribute (Indexed (dominantBaseline :: String | r)))
_dominantBaseline_ = _dominantBaseline <<< Applicative.pure

_fontFamily :: forall r. Event String -> Event (Attribute (Indexed (fontFamily :: String | r)))
_fontFamily = Functor.map
  (unsafeAttribute <<< { key: "font-family", value: _ } <<< Deku.Attribute.prop')

_fontFamily_ :: forall r. String -> Event (Attribute (Indexed (fontFamily :: String | r)))
_fontFamily_ = _fontFamily <<< Applicative.pure

_fontSize :: forall r. Event String -> Event (Attribute (Indexed (fontSize :: String | r)))
_fontSize = Functor.map
  (unsafeAttribute <<< { key: "font-size", value: _ } <<< Deku.Attribute.prop')

_fontSize_ :: forall r. String -> Event (Attribute (Indexed (fontSize :: String | r)))
_fontSize_ = _fontSize <<< Applicative.pure

_fontSizeAdjust
  :: forall r. Event String -> Event (Attribute (Indexed (fontSizeAdjust :: String | r)))
_fontSizeAdjust = Functor.map
  (unsafeAttribute <<< { key: "font-size-adjust", value: _ } <<< Deku.Attribute.prop')

_fontSizeAdjust_ :: forall r. String -> Event (Attribute (Indexed (fontSizeAdjust :: String | r)))
_fontSizeAdjust_ = _fontSizeAdjust <<< Applicative.pure

_fontStretch :: forall r. Event String -> Event (Attribute (Indexed (fontStretch :: String | r)))
_fontStretch = Functor.map
  (unsafeAttribute <<< { key: "font-stretch", value: _ } <<< Deku.Attribute.prop')

_fontStretch_ :: forall r. String -> Event (Attribute (Indexed (fontStretch :: String | r)))
_fontStretch_ = _fontStretch <<< Applicative.pure

_fontStyle :: forall r. Event String -> Event (Attribute (Indexed (fontStyle :: String | r)))
_fontStyle = Functor.map
  (unsafeAttribute <<< { key: "font-style", value: _ } <<< Deku.Attribute.prop')

_fontStyle_ :: forall r. String -> Event (Attribute (Indexed (fontStyle :: String | r)))
_fontStyle_ = _fontStyle <<< Applicative.pure

_fontVariant :: forall r. Event String -> Event (Attribute (Indexed (fontVariant :: String | r)))
_fontVariant = Functor.map
  (unsafeAttribute <<< { key: "font-variant", value: _ } <<< Deku.Attribute.prop')

_fontVariant_ :: forall r. String -> Event (Attribute (Indexed (fontVariant :: String | r)))
_fontVariant_ = _fontVariant <<< Applicative.pure

_fontWeight :: forall r. Event String -> Event (Attribute (Indexed (fontWeight :: String | r)))
_fontWeight = Functor.map
  (unsafeAttribute <<< { key: "font-weight", value: _ } <<< Deku.Attribute.prop')

_fontWeight_ :: forall r. String -> Event (Attribute (Indexed (fontWeight :: String | r)))
_fontWeight_ = _fontWeight <<< Applicative.pure

_letterSpacing
  :: forall r. Event String -> Event (Attribute (Indexed (letterSpacing :: String | r)))
_letterSpacing = Functor.map
  (unsafeAttribute <<< { key: "letter-spacing", value: _ } <<< Deku.Attribute.prop')

_letterSpacing_ :: forall r. String -> Event (Attribute (Indexed (letterSpacing :: String | r)))
_letterSpacing_ = _letterSpacing <<< Applicative.pure

_textDecoration
  :: forall r. Event String -> Event (Attribute (Indexed (textDecoration :: String | r)))
_textDecoration = Functor.map
  (unsafeAttribute <<< { key: "text-decoration", value: _ } <<< Deku.Attribute.prop')

_textDecoration_ :: forall r. String -> Event (Attribute (Indexed (textDecoration :: String | r)))
_textDecoration_ = _textDecoration <<< Applicative.pure

_wordSpacing :: forall r. Event String -> Event (Attribute (Indexed (wordSpacing :: String | r)))
_wordSpacing = Functor.map
  (unsafeAttribute <<< { key: "word-spacing", value: _ } <<< Deku.Attribute.prop')

_wordSpacing_ :: forall r. String -> Event (Attribute (Indexed (wordSpacing :: String | r)))
_wordSpacing_ = _wordSpacing <<< Applicative.pure

_writingMode :: forall r. Event String -> Event (Attribute (Indexed (writingMode :: String | r)))
_writingMode = Functor.map
  (unsafeAttribute <<< { key: "writing-mode", value: _ } <<< Deku.Attribute.prop')

_writingMode_ :: forall r. String -> Event (Attribute (Indexed (writingMode :: String | r)))
_writingMode_ = _writingMode <<< Applicative.pure

_unicodeBidi :: forall r. Event String -> Event (Attribute (Indexed (unicodeBidi :: String | r)))
_unicodeBidi = Functor.map
  (unsafeAttribute <<< { key: "unicode-bidi", value: _ } <<< Deku.Attribute.prop')

_unicodeBidi_ :: forall r. String -> Event (Attribute (Indexed (unicodeBidi :: String | r)))
_unicodeBidi_ = _unicodeBidi <<< Applicative.pure

_pathLength :: forall r. Event String -> Event (Attribute (Indexed (pathLength :: String | r)))
_pathLength = Functor.map
  (unsafeAttribute <<< { key: "pathLength", value: _ } <<< Deku.Attribute.prop')

_pathLength_ :: forall r. String -> Event (Attribute (Indexed (pathLength :: String | r)))
_pathLength_ = _pathLength <<< Applicative.pure

_mask :: forall r. Event String -> Event (Attribute (Indexed (mask :: String | r)))
_mask = Functor.map (unsafeAttribute <<< { key: "mask", value: _ } <<< Deku.Attribute.prop')

_mask_ :: forall r. String -> Event (Attribute (Indexed (mask :: String | r)))
_mask_ = _mask <<< Applicative.pure

_opacity :: forall r. Event String -> Event (Attribute (Indexed (opacity :: String | r)))
_opacity = Functor.map (unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop')

_opacity_ :: forall r. String -> Event (Attribute (Indexed (opacity :: String | r)))
_opacity_ = _opacity <<< Applicative.pure

_overflow :: forall r. Event String -> Event (Attribute (Indexed (overflow :: String | r)))
_overflow = Functor.map
  (unsafeAttribute <<< { key: "overflow", value: _ } <<< Deku.Attribute.prop')

_overflow_ :: forall r. String -> Event (Attribute (Indexed (overflow :: String | r)))
_overflow_ = _overflow <<< Applicative.pure

_clipPath :: forall r. Event String -> Event (Attribute (Indexed (clipPath :: String | r)))
_clipPath = Functor.map
  (unsafeAttribute <<< { key: "clip-path", value: _ } <<< Deku.Attribute.prop')

_clipPath_ :: forall r. String -> Event (Attribute (Indexed (clipPath :: String | r)))
_clipPath_ = _clipPath <<< Applicative.pure

_cursor :: forall r. Event String -> Event (Attribute (Indexed (cursor :: String | r)))
_cursor = Functor.map (unsafeAttribute <<< { key: "cursor", value: _ } <<< Deku.Attribute.prop')

_cursor_ :: forall r. String -> Event (Attribute (Indexed (cursor :: String | r)))
_cursor_ = _cursor <<< Applicative.pure

_display :: forall r. Event String -> Event (Attribute (Indexed (display :: String | r)))
_display = Functor.map (unsafeAttribute <<< { key: "display", value: _ } <<< Deku.Attribute.prop')

_display_ :: forall r. String -> Event (Attribute (Indexed (display :: String | r)))
_display_ = _display <<< Applicative.pure

_transform :: forall r. Event String -> Event (Attribute (Indexed (transform :: String | r)))
_transform = Functor.map
  (unsafeAttribute <<< { key: "transform", value: _ } <<< Deku.Attribute.prop')

_transform_ :: forall r. String -> Event (Attribute (Indexed (transform :: String | r)))
_transform_ = _transform <<< Applicative.pure

_transformOrigin
  :: forall r. Event String -> Event (Attribute (Indexed (transformOrigin :: String | r)))
_transformOrigin = Functor.map
  (unsafeAttribute <<< { key: "transform-origin", value: _ } <<< Deku.Attribute.prop')

_transformOrigin_
  :: forall r. String -> Event (Attribute (Indexed (transformOrigin :: String | r)))
_transformOrigin_ = _transformOrigin <<< Applicative.pure

_visibility :: forall r. Event String -> Event (Attribute (Indexed (visibility :: String | r)))
_visibility = Functor.map
  (unsafeAttribute <<< { key: "visibility", value: _ } <<< Deku.Attribute.prop')

_visibility_ :: forall r. String -> Event (Attribute (Indexed (visibility :: String | r)))
_visibility_ = _visibility <<< Applicative.pure

__over :: Keyword "over"
__over = Keyword "over"

__in :: Keyword "in"
__in = Keyword "in"

__out :: Keyword "out"
__out = Keyword "out"

__atop :: Keyword "atop"
__atop = Keyword "atop"

__xor :: Keyword "xor"
__xor = Keyword "xor"

__lighter :: Keyword "lighter"
__lighter = Keyword "lighter"

__arithmetic :: Keyword "arithmetic"
__arithmetic = Keyword "arithmetic"

__duplicate :: Keyword "duplicate"
__duplicate = Keyword "duplicate"

__wrap :: Keyword "wrap"
__wrap = Keyword "wrap"
