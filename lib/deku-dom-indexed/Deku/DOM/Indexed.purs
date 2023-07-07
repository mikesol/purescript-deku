module Deku.DOM.Indexed where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Function (($))
import Data.Functor (map) as Functor
import Data.Newtype (unwrap, class Newtype) as Newtype
import Data.Show (show) as Show
import Deku.Attribute (Cb, Attribute, AttributeValue, unsafeAttribute, prop', cb')
import Deku.Control (elementify2)
import Deku.Core (Nut)
import FRP.Event (Event)
import Type.Proxy (Proxy)

data Indexed (r :: Row Type)

type role Indexed phantom
type ARIAMixin (r :: Row Type) =
  ( __nominal :: Proxy "ARIAMixin"
  , role :: String
  , ariaAtomic :: String
  , ariaAutoComplete :: String
  , ariaBusy :: String
  , ariaChecked :: String
  , ariaColCount :: String
  , ariaColIndex :: String
  , ariaColIndexText :: String
  , ariaColSpan :: String
  , ariaCurrent :: String
  , ariaDescription :: String
  , ariaDisabled :: String
  , ariaExpanded :: String
  , ariaHasPopup :: String
  , ariaHidden :: String
  , ariaInvalid :: String
  , ariaKeyShortcuts :: String
  , ariaLabel :: String
  , ariaLevel :: String
  , ariaLive :: String
  , ariaModal :: String
  , ariaMultiLine :: String
  , ariaMultiSelectable :: String
  , ariaOrientation :: String
  , ariaPlaceholder :: String
  , ariaPosInSet :: String
  , ariaPressed :: String
  , ariaReadOnly :: String
  , ariaRequired :: String
  , ariaRoleDescription :: String
  , ariaRowCount :: String
  , ariaRowIndex :: String
  , ariaRowIndexText :: String
  , ariaRowSpan :: String
  , ariaSelected :: String
  , ariaSetSize :: String
  , ariaSort :: String
  , ariaValueMax :: String
  , ariaValueMin :: String
  , ariaValueNow :: String
  , ariaValueText :: String
  | r
  )

type Element (r :: Row Type) = (__nominal :: Proxy "Element" | ARIAMixin (ARIAMixin r))
type ElementContentEditable (r :: Row Type) =
  ( __nominal :: Proxy "ElementContentEditable"
  , contentEditable :: String
  , enterKeyHint :: String
  , inputMode :: String
  | r
  )

type GlobalEventHandlers (r :: Row Type) =
  ( __nominal :: Proxy "GlobalEventHandlers"
  , onabort :: Cb
  , onauxclick :: Cb
  , onbeforeinput :: Cb
  , onbeforematch :: Cb
  , onbeforetoggle :: Cb
  , onblur :: Cb
  , oncancel :: Cb
  , oncanplay :: Cb
  , oncanplaythrough :: Cb
  , onchange :: Cb
  , onclick :: Cb
  , onclose :: Cb
  , oncontextlost :: Cb
  , oncontextmenu :: Cb
  , oncontextrestored :: Cb
  , oncopy :: Cb
  , oncuechange :: Cb
  , oncut :: Cb
  , ondblclick :: Cb
  , ondrag :: Cb
  , ondragend :: Cb
  , ondragenter :: Cb
  , ondragleave :: Cb
  , ondragover :: Cb
  , ondragstart :: Cb
  , ondrop :: Cb
  , ondurationchange :: Cb
  , onemptied :: Cb
  , onended :: Cb
  , onfocus :: Cb
  , onformdata :: Cb
  , oninput :: Cb
  , oninvalid :: Cb
  , onkeydown :: Cb
  , onkeypress :: Cb
  , onkeyup :: Cb
  , onload :: Cb
  , onloadeddata :: Cb
  , onloadedmetadata :: Cb
  , onloadstart :: Cb
  , onmousedown :: Cb
  , onmouseenter :: Cb
  , onmouseleave :: Cb
  , onmousemove :: Cb
  , onmouseout :: Cb
  , onmouseover :: Cb
  , onmouseup :: Cb
  , onpaste :: Cb
  , onpause :: Cb
  , onplay :: Cb
  , onplaying :: Cb
  , onprogress :: Cb
  , onratechange :: Cb
  , onreset :: Cb
  , onresize :: Cb
  , onscroll :: Cb
  , onscrollend :: Cb
  , onsecuritypolicyviolation :: Cb
  , onseeked :: Cb
  , onseeking :: Cb
  , onselect :: Cb
  , onslotchange :: Cb
  , onstalled :: Cb
  , onsubmit :: Cb
  , onsuspend :: Cb
  , ontimeupdate :: Cb
  , ontoggle :: Cb
  , onvolumechange :: Cb
  , onwaiting :: Cb
  , onwebkitanimationend :: Cb
  , onwebkitanimationiteration :: Cb
  , onwebkitanimationstart :: Cb
  , onwebkittransitionend :: Cb
  , onwheel :: Cb
  | r
  )

type HTMLAreaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAreaElement"
  , alt :: String
  , coords :: String
  , shape :: String
  , target :: String
  , download :: String
  , ping :: String
  , rel :: String
  , referrerPolicy :: String
  | HTMLElement (HTMLHyperlinkElementUtils r)
  )

type HTMLAudioElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLAudioElement" | HTMLMediaElement r)

type HTMLBRElement (r :: Row Type) = (__nominal :: Proxy "HTMLBRElement" | HTMLElement r)
type HTMLBaseElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLBaseElement", href :: String, target :: String | HTMLElement r)

type HTMLBodyElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLBodyElement" | HTMLElement (WindowEventHandlers r))

type HTMLButtonElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLButtonElement"
  , disabled :: Boolean
  , formAction :: String
  , formEnctype :: String
  , formMethod :: String
  , formNoValidate :: Boolean
  , formTarget :: String
  , name :: String
  , type :: String
  , value :: String
  | HTMLElement (PopoverInvokerElement r)
  )

type HTMLCanvasElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLCanvasElement", width :: Int, height :: Int | HTMLElement r)

type HTMLDListElement (r :: Row Type) = (__nominal :: Proxy "HTMLDListElement" | HTMLElement r)
type HTMLDataElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLDataElement", value :: String | HTMLElement r)

type HTMLDataListElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLDataListElement" | HTMLElement r)

type HTMLDetailsElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLDetailsElement", open :: Boolean | HTMLElement r)

type HTMLDialogElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLDialogElement", open :: Boolean, returnValue :: String | HTMLElement r)

type HTMLDirectoryElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLDirectoryElement", compact :: Boolean | HTMLElement r)

type HTMLDivElement (r :: Row Type) = (__nominal :: Proxy "HTMLDivElement" | HTMLElement r)
type HTMLElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLElement"
  , title :: String
  , lang :: String
  , translate :: Boolean
  , dir :: String
  , hidden :: Boolean
  , hidden :: Number
  , hidden :: String
  , inert :: Boolean
  , accessKey :: String
  , draggable :: Boolean
  , spellcheck :: Boolean
  , autocapitalize :: String
  , innerText :: String
  , outerText :: String
  , popover :: String
  | Element (HTMLOrSVGElement (ElementContentEditable (GlobalEventHandlers r)))
  )

type HTMLEmbedElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLEmbedElement"
  , src :: String
  , type :: String
  , width :: String
  , height :: String
  | HTMLElement r
  )

type HTMLFieldSetElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLFieldSetElement", disabled :: Boolean, name :: String | HTMLElement r)

type HTMLFontElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFontElement"
  , color :: String
  , face :: String
  , size :: String
  | HTMLElement r
  )

type HTMLFormElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFormElement"
  , acceptCharset :: String
  , action :: String
  , autocomplete :: String
  , enctype :: String
  , encoding :: String
  , method :: String
  , name :: String
  , noValidate :: Boolean
  , target :: String
  , rel :: String
  | HTMLElement r
  )

type HTMLFrameElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFrameElement"
  , name :: String
  , scrolling :: String
  , src :: String
  , frameBorder :: String
  , longDesc :: String
  , noResize :: Boolean
  , marginHeight :: String
  , marginWidth :: String
  | HTMLElement r
  )

type HTMLFrameSetElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFrameSetElement"
  , cols :: String
  , rows :: String
  | HTMLElement (WindowEventHandlers r)
  )

type HTMLHRElement (r :: Row Type) = (__nominal :: Proxy "HTMLHRElement" | HTMLElement r)
type HTMLHeadElement (r :: Row Type) = (__nominal :: Proxy "HTMLHeadElement" | HTMLElement r)
type HTMLHeadingElement (r :: Row Type) = (__nominal :: Proxy "HTMLHeadingElement" | HTMLElement r)
type HTMLHtmlElement (r :: Row Type) = (__nominal :: Proxy "HTMLHtmlElement" | HTMLElement r)
type HTMLHyperlinkElementUtils (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHyperlinkElementUtils"
  , href :: String
  , protocol :: String
  , username :: String
  , password :: String
  , host :: String
  , hostname :: String
  , port :: String
  , pathname :: String
  , search :: String
  , hash :: String
  | r
  )

type HTMLIFrameElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLIFrameElement"
  , src :: String
  , srcdoc :: String
  , name :: String
  , allow :: String
  , allowFullscreen :: Boolean
  , width :: String
  , height :: String
  , referrerPolicy :: String
  , loading :: String
  | HTMLElement r
  )

type HTMLImageElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLImageElement"
  , alt :: String
  , src :: String
  , srcset :: String
  , sizes :: String
  , crossOrigin :: String
  , useMap :: String
  , isMap :: Boolean
  , width :: Int
  , height :: Int
  , referrerPolicy :: String
  , decoding :: String
  , loading :: String
  , fetchPriority :: String
  | HTMLElement r
  )

type HTMLInputElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLInputElement"
  , accept :: String
  , alt :: String
  , autocomplete :: String
  , defaultChecked :: Boolean
  , checked :: Boolean
  , dirName :: String
  , disabled :: Boolean
  , formAction :: String
  , formEnctype :: String
  , formMethod :: String
  , formNoValidate :: Boolean
  , formTarget :: String
  , height :: Int
  , indeterminate :: Boolean
  , max :: String
  , maxLength :: Int
  , min :: String
  , minLength :: Int
  , multiple :: Boolean
  , name :: String
  , pattern :: String
  , placeholder :: String
  , readOnly :: Boolean
  , required :: Boolean
  , size :: Int
  , src :: String
  , step :: String
  , type :: String
  , defaultValue :: String
  , value :: String
  , valueAsNumber :: Number
  , width :: Int
  , selectionStart :: Int
  , selectionEnd :: Int
  , selectionDirection :: String
  | HTMLElement (PopoverInvokerElement r)
  )

type HTMLLIElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLLIElement", value :: Int | HTMLElement r)

type HTMLLabelElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLLabelElement", htmlFor :: String | HTMLElement r)

type HTMLLegendElement (r :: Row Type) = (__nominal :: Proxy "HTMLLegendElement" | HTMLElement r)
type HTMLLinkElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLLinkElement"
  , href :: String
  , crossOrigin :: String
  , rel :: String
  , as :: String
  , media :: String
  , integrity :: String
  , hreflang :: String
  , type :: String
  , imageSrcset :: String
  , imageSizes :: String
  , referrerPolicy :: String
  , disabled :: Boolean
  , fetchPriority :: String
  | HTMLElement r
  )

type HTMLMapElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLMapElement", name :: String | HTMLElement r)

type HTMLMarqueeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMarqueeElement"
  , behavior :: String
  , bgColor :: String
  , direction :: String
  , height :: String
  , hspace :: Int
  , loop :: Int
  , scrollAmount :: Int
  , scrollDelay :: Int
  , trueSpeed :: Boolean
  , vspace :: Int
  , width :: String
  | HTMLElement r
  )

type HTMLMediaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMediaElement"
  , src :: String
  , crossOrigin :: String
  , preload :: String
  , currentTime :: Number
  , defaultPlaybackRate :: Number
  , playbackRate :: Number
  , preservesPitch :: Boolean
  , autoplay :: Boolean
  , loop :: Boolean
  , controls :: Boolean
  , volume :: Number
  , muted :: Boolean
  , defaultMuted :: Boolean
  | HTMLElement r
  )

type HTMLMenuElement (r :: Row Type) = (__nominal :: Proxy "HTMLMenuElement" | HTMLElement r)
type HTMLMetaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMetaElement"
  , name :: String
  , httpEquiv :: String
  , content :: String
  , media :: String
  | HTMLElement r
  )

type HTMLMeterElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMeterElement"
  , value :: Number
  , min :: Number
  , max :: Number
  , low :: Number
  , high :: Number
  , optimum :: Number
  | HTMLElement r
  )

type HTMLModElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLModElement", cite :: String, dateTime :: String | HTMLElement r)

type HTMLOListElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOListElement"
  , reversed :: Boolean
  , start :: Int
  , type :: String
  | HTMLElement r
  )

type HTMLObjectElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLObjectElement"
  , data :: String
  , type :: String
  , name :: String
  , width :: String
  , height :: String
  | HTMLElement r
  )

type HTMLOptGroupElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLOptGroupElement", disabled :: Boolean, label :: String | HTMLElement r)

type HTMLOptionElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOptionElement"
  , disabled :: Boolean
  , label :: String
  , defaultSelected :: Boolean
  , selected :: Boolean
  , value :: String
  , text :: String
  | HTMLElement r
  )

type HTMLOrSVGElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOrSVGElement"
  , nonce :: String
  , autofocus :: Boolean
  , tabIndex :: Int
  | r
  )

type HTMLOutputElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOutputElement"
  , name :: String
  , defaultValue :: String
  , value :: String
  | HTMLElement r
  )

type HTMLParagraphElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLParagraphElement" | HTMLElement r)

type HTMLParamElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLParamElement"
  , name :: String
  , value :: String
  , type :: String
  , valueType :: String
  | HTMLElement r
  )

type HTMLPictureElement (r :: Row Type) = (__nominal :: Proxy "HTMLPictureElement" | HTMLElement r)
type HTMLPreElement (r :: Row Type) = (__nominal :: Proxy "HTMLPreElement" | HTMLElement r)
type HTMLProgressElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLProgressElement", value :: Number, max :: Number | HTMLElement r)

type HTMLQuoteElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLQuoteElement", cite :: String | HTMLElement r)

type HTMLSelectElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSelectElement"
  , autocomplete :: String
  , disabled :: Boolean
  , multiple :: Boolean
  , name :: String
  , required :: Boolean
  , size :: Int
  , length :: Int
  , selectedIndex :: Int
  , value :: String
  | HTMLElement r
  )

type HTMLSlotElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLSlotElement", name :: String | HTMLElement r)

type HTMLSourceElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSourceElement"
  , src :: String
  , type :: String
  , srcset :: String
  , sizes :: String
  , media :: String
  , width :: Int
  , height :: Int
  | HTMLElement r
  )

type HTMLSpanElement (r :: Row Type) = (__nominal :: Proxy "HTMLSpanElement" | HTMLElement r)
type HTMLTableCaptionElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTableCaptionElement" | HTMLElement r)

type HTMLTableCellElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTableCellElement"
  , colSpan :: Int
  , rowSpan :: Int
  , headers :: String
  , scope :: String
  , abbr :: String
  | HTMLElement r
  )

type HTMLTableColElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTableColElement", span :: Int | HTMLElement r)

type HTMLTableElement (r :: Row Type) = (__nominal :: Proxy "HTMLTableElement" | HTMLElement r)
type HTMLTableRowElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTableRowElement" | HTMLElement r)

type HTMLTableSectionElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTableSectionElement" | HTMLElement r)

type HTMLTemplateElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTemplateElement" | HTMLElement r)

type HTMLTextAreaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTextAreaElement"
  , autocomplete :: String
  , cols :: Int
  , dirName :: String
  , disabled :: Boolean
  , maxLength :: Int
  , minLength :: Int
  , name :: String
  , placeholder :: String
  , readOnly :: Boolean
  , required :: Boolean
  , rows :: Int
  , wrap :: String
  , defaultValue :: String
  , value :: String
  , selectionStart :: Int
  , selectionEnd :: Int
  , selectionDirection :: String
  | HTMLElement r
  )

type HTMLTimeElement (r :: Row Type) =
  (__nominal :: Proxy "HTMLTimeElement", dateTime :: String | HTMLElement r)

type HTMLTrackElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTrackElement"
  , kind :: String
  , src :: String
  , srclang :: String
  , label :: String
  , default :: Boolean
  | HTMLElement r
  )

type HTMLUListElement (r :: Row Type) = (__nominal :: Proxy "HTMLUListElement" | HTMLElement r)
type HTMLUnknownElement (r :: Row Type) = (__nominal :: Proxy "HTMLUnknownElement" | HTMLElement r)
type HTMLVideoElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLVideoElement"
  , width :: Int
  , height :: Int
  , poster :: String
  , playsInline :: Boolean
  | HTMLMediaElement r
  )

type PopoverInvokerElement (r :: Row Type) =
  (__nominal :: Proxy "PopoverInvokerElement", popoverTargetAction :: String | r)

type SVGAElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGAElement"
  , download :: String
  , ping :: String
  , rel :: String
  , hreflang :: String
  , type :: String
  , text :: String
  , referrerPolicy :: String
  | SVGGraphicsElement (SVGURIReference r)
  )

type SVGAnimatedPoints (r :: Row Type) = (__nominal :: Proxy "SVGAnimatedPoints" | r)
type SVGCircleElement (r :: Row Type) =
  (__nominal :: Proxy "SVGCircleElement" | SVGGeometryElement r)

type SVGComponentTransferFunctionElement (r :: Row Type) =
  (__nominal :: Proxy "SVGComponentTransferFunctionElement" | SVGElement r)

type SVGDefsElement (r :: Row Type) = (__nominal :: Proxy "SVGDefsElement" | SVGGraphicsElement r)
type SVGDescElement (r :: Row Type) = (__nominal :: Proxy "SVGDescElement" | SVGElement r)
type SVGElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGElement"
  | Element (HTMLOrSVGElement (SVGElementInstance (GlobalEventHandlers r)))
  )

type SVGElementInstance (r :: Row Type) = (__nominal :: Proxy "SVGElementInstance" | r)
type SVGEllipseElement (r :: Row Type) =
  (__nominal :: Proxy "SVGEllipseElement" | SVGGeometryElement r)

type SVGFEBlendElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEBlendElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFEColorMatrixElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEColorMatrixElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEComponentTransferElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEComponentTransferElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFECompositeElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFECompositeElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFEConvolveMatrixElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEConvolveMatrixElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEDiffuseLightingElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEDiffuseLightingElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEDisplacementMapElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEDisplacementMapElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEDistantLightElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEDistantLightElement" | SVGElement r)

type SVGFEDropShadowElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEDropShadowElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEFloodElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEFloodElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFEFuncAElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEFuncAElement" | SVGComponentTransferFunctionElement r)

type SVGFEFuncBElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEFuncBElement" | SVGComponentTransferFunctionElement r)

type SVGFEFuncGElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEFuncGElement" | SVGComponentTransferFunctionElement r)

type SVGFEFuncRElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEFuncRElement" | SVGComponentTransferFunctionElement r)

type SVGFEGaussianBlurElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEGaussianBlurElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEImageElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEImageElement"
  | SVGElement (SVGURIReference (SVGFilterPrimitiveStandardAttributes r))
  )

type SVGFEMergeElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEMergeElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFEMergeNodeElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEMergeNodeElement" | SVGElement r)

type SVGFEMorphologyElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFEMorphologyElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFEOffsetElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEOffsetElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFEPointLightElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFEPointLightElement" | SVGElement r)

type SVGFESpecularLightingElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFESpecularLightingElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFESpotLightElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFESpotLightElement" | SVGElement r)

type SVGFETileElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFETileElement" | SVGElement (SVGFilterPrimitiveStandardAttributes r))

type SVGFETurbulenceElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGFETurbulenceElement"
  | SVGElement (SVGFilterPrimitiveStandardAttributes r)
  )

type SVGFilterElement (r :: Row Type) =
  (__nominal :: Proxy "SVGFilterElement" | SVGElement (SVGURIReference r))

type SVGFilterPrimitiveStandardAttributes (r :: Row Type) =
  (__nominal :: Proxy "SVGFilterPrimitiveStandardAttributes" | r)

type SVGFitToViewBox (r :: Row Type) = (__nominal :: Proxy "SVGFitToViewBox" | r)
type SVGForeignObjectElement (r :: Row Type) =
  (__nominal :: Proxy "SVGForeignObjectElement" | SVGGraphicsElement r)

type SVGGElement (r :: Row Type) = (__nominal :: Proxy "SVGGElement" | SVGGraphicsElement r)
type SVGGeometryElement (r :: Row Type) =
  (__nominal :: Proxy "SVGGeometryElement" | SVGGraphicsElement r)

type SVGGradientElement (r :: Row Type) =
  (__nominal :: Proxy "SVGGradientElement" | SVGElement (SVGURIReference r))

type SVGGraphicsElement (r :: Row Type) =
  (__nominal :: Proxy "SVGGraphicsElement" | SVGElement (SVGTests r))

type SVGImageElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGImageElement"
  , crossOrigin :: String
  | SVGGraphicsElement (SVGURIReference r)
  )

type SVGLineElement (r :: Row Type) = (__nominal :: Proxy "SVGLineElement" | SVGGeometryElement r)
type SVGLinearGradientElement (r :: Row Type) =
  (__nominal :: Proxy "SVGLinearGradientElement" | SVGGradientElement r)

type SVGMarkerElement (r :: Row Type) =
  (__nominal :: Proxy "SVGMarkerElement", orient :: String | SVGElement (SVGFitToViewBox r))

type SVGMetadataElement (r :: Row Type) = (__nominal :: Proxy "SVGMetadataElement" | SVGElement r)
type SVGPathElement (r :: Row Type) = (__nominal :: Proxy "SVGPathElement" | SVGGeometryElement r)
type SVGPatternElement (r :: Row Type) =
  (__nominal :: Proxy "SVGPatternElement" | SVGElement (SVGURIReference (SVGFitToViewBox r)))

type SVGPolygonElement (r :: Row Type) =
  (__nominal :: Proxy "SVGPolygonElement" | SVGGeometryElement (SVGAnimatedPoints r))

type SVGPolylineElement (r :: Row Type) =
  (__nominal :: Proxy "SVGPolylineElement" | SVGGeometryElement (SVGAnimatedPoints r))

type SVGRadialGradientElement (r :: Row Type) =
  (__nominal :: Proxy "SVGRadialGradientElement" | SVGGradientElement r)

type SVGRectElement (r :: Row Type) = (__nominal :: Proxy "SVGRectElement" | SVGGeometryElement r)
type SVGSVGElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGSVGElement"
  | SVGGraphicsElement (WindowEventHandlers (SVGFitToViewBox r))
  )

type SVGScriptElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGScriptElement"
  , type :: String
  , crossOrigin :: String
  | SVGElement (SVGURIReference r)
  )

type SVGStopElement (r :: Row Type) = (__nominal :: Proxy "SVGStopElement" | SVGElement r)
type SVGStyleElement (r :: Row Type) =
  ( __nominal :: Proxy "SVGStyleElement"
  , type :: String
  , media :: String
  , title :: String
  | SVGElement r
  )

type SVGSwitchElement (r :: Row Type) =
  (__nominal :: Proxy "SVGSwitchElement" | SVGGraphicsElement r)

type SVGSymbolElement (r :: Row Type) =
  (__nominal :: Proxy "SVGSymbolElement" | SVGGraphicsElement (SVGFitToViewBox r))

type SVGTSpanElement (r :: Row Type) =
  (__nominal :: Proxy "SVGTSpanElement" | SVGTextPositioningElement r)

type SVGTests (r :: Row Type) = (__nominal :: Proxy "SVGTests" | r)
type SVGTextContentElement (r :: Row Type) =
  (__nominal :: Proxy "SVGTextContentElement" | SVGGraphicsElement r)

type SVGTextElement (r :: Row Type) =
  (__nominal :: Proxy "SVGTextElement" | SVGTextPositioningElement r)

type SVGTextPathElement (r :: Row Type) =
  (__nominal :: Proxy "SVGTextPathElement" | SVGTextContentElement (SVGURIReference r))

type SVGTextPositioningElement (r :: Row Type) =
  (__nominal :: Proxy "SVGTextPositioningElement" | SVGTextContentElement r)

type SVGTitleElement (r :: Row Type) = (__nominal :: Proxy "SVGTitleElement" | SVGElement r)
type SVGURIReference (r :: Row Type) = (__nominal :: Proxy "SVGURIReference" | r)
type SVGUseElement (r :: Row Type) =
  (__nominal :: Proxy "SVGUseElement" | SVGGraphicsElement (SVGURIReference r))

type SVGViewElement (r :: Row Type) =
  (__nominal :: Proxy "SVGViewElement" | SVGElement (SVGFitToViewBox r))

type WindowEventHandlers (r :: Row Type) =
  ( __nominal :: Proxy "WindowEventHandlers"
  , onafterprint :: Cb
  , onbeforeprint :: Cb
  , onhashchange :: Cb
  , onlanguagechange :: Cb
  , onmessage :: Cb
  , onmessageerror :: Cb
  , onoffline :: Cb
  , ononline :: Cb
  , onpagehide :: Cb
  , onpageshow :: Cb
  , onpopstate :: Cb
  , onrejectionhandled :: Cb
  , onstorage :: Cb
  , onunhandledrejection :: Cb
  , onunload :: Cb
  | r
  )

html :: Array (Event (Attribute (Indexed (HTMLHtmlElement ())))) -> Array Nut -> Nut
html = elementify2 "html"

html_ :: Array Nut -> Nut
html_ = elementify2 "html" []

head :: Array (Event (Attribute (Indexed (HTMLHeadElement ())))) -> Array Nut -> Nut
head = elementify2 "head"

head_ :: Array Nut -> Nut
head_ = elementify2 "head" []

title :: Array (Event (Attribute (Indexed (SVGTitleElement ())))) -> Array Nut -> Nut
title = elementify2 "title"

title_ :: Array Nut -> Nut
title_ = elementify2 "title" []

base :: Array (Event (Attribute (Indexed (HTMLBaseElement ())))) -> Array Nut -> Nut
base = elementify2 "base"

base_ :: Array Nut -> Nut
base_ = elementify2 "base" []

link :: Array (Event (Attribute (Indexed (HTMLLinkElement ())))) -> Array Nut -> Nut
link = elementify2 "link"

link_ :: Array Nut -> Nut
link_ = elementify2 "link" []

meta :: Array (Event (Attribute (Indexed (HTMLMetaElement ())))) -> Array Nut -> Nut
meta = elementify2 "meta"

meta_ :: Array Nut -> Nut
meta_ = elementify2 "meta" []

style :: Array (Event (Attribute (Indexed (SVGStyleElement ())))) -> Array Nut -> Nut
style = elementify2 "style"

style_ :: Array Nut -> Nut
style_ = elementify2 "style" []

body :: Array (Event (Attribute (Indexed (HTMLBodyElement ())))) -> Array Nut -> Nut
body = elementify2 "body"

body_ :: Array Nut -> Nut
body_ = elementify2 "body" []

article :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
article = elementify2 "article"

article_ :: Array Nut -> Nut
article_ = elementify2 "article" []

section :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
section = elementify2 "section"

section_ :: Array Nut -> Nut
section_ = elementify2 "section" []

nav :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
nav = elementify2 "nav"

nav_ :: Array Nut -> Nut
nav_ = elementify2 "nav" []

aside :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
aside = elementify2 "aside"

aside_ :: Array Nut -> Nut
aside_ = elementify2 "aside" []

h1 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h1 = elementify2 "h1"

h1_ :: Array Nut -> Nut
h1_ = elementify2 "h1" []

h2 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h2 = elementify2 "h2"

h2_ :: Array Nut -> Nut
h2_ = elementify2 "h2" []

h3 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h3 = elementify2 "h3"

h3_ :: Array Nut -> Nut
h3_ = elementify2 "h3" []

h4 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h4 = elementify2 "h4"

h4_ :: Array Nut -> Nut
h4_ = elementify2 "h4" []

h5 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h5 = elementify2 "h5"

h5_ :: Array Nut -> Nut
h5_ = elementify2 "h5" []

h6 :: Array (Event (Attribute (Indexed (HTMLHeadingElement ())))) -> Array Nut -> Nut
h6 = elementify2 "h6"

h6_ :: Array Nut -> Nut
h6_ = elementify2 "h6" []

hgroup :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
hgroup = elementify2 "hgroup"

hgroup_ :: Array Nut -> Nut
hgroup_ = elementify2 "hgroup" []

header :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
header = elementify2 "header"

header_ :: Array Nut -> Nut
header_ = elementify2 "header" []

footer :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
footer = elementify2 "footer"

footer_ :: Array Nut -> Nut
footer_ = elementify2 "footer" []

address :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
address = elementify2 "address"

address_ :: Array Nut -> Nut
address_ = elementify2 "address" []

p :: Array (Event (Attribute (Indexed (HTMLParagraphElement ())))) -> Array Nut -> Nut
p = elementify2 "p"

p_ :: Array Nut -> Nut
p_ = elementify2 "p" []

hr :: Array (Event (Attribute (Indexed (HTMLHRElement ())))) -> Array Nut -> Nut
hr = elementify2 "hr"

hr_ :: Array Nut -> Nut
hr_ = elementify2 "hr" []

pre :: Array (Event (Attribute (Indexed (HTMLPreElement ())))) -> Array Nut -> Nut
pre = elementify2 "pre"

pre_ :: Array Nut -> Nut
pre_ = elementify2 "pre" []

blockquote :: Array (Event (Attribute (Indexed (HTMLQuoteElement ())))) -> Array Nut -> Nut
blockquote = elementify2 "blockquote"

blockquote_ :: Array Nut -> Nut
blockquote_ = elementify2 "blockquote" []

ol :: Array (Event (Attribute (Indexed (HTMLOListElement ())))) -> Array Nut -> Nut
ol = elementify2 "ol"

ol_ :: Array Nut -> Nut
ol_ = elementify2 "ol" []

ul :: Array (Event (Attribute (Indexed (HTMLUListElement ())))) -> Array Nut -> Nut
ul = elementify2 "ul"

ul_ :: Array Nut -> Nut
ul_ = elementify2 "ul" []

menu :: Array (Event (Attribute (Indexed (HTMLMenuElement ())))) -> Array Nut -> Nut
menu = elementify2 "menu"

menu_ :: Array Nut -> Nut
menu_ = elementify2 "menu" []

li :: Array (Event (Attribute (Indexed (HTMLLIElement ())))) -> Array Nut -> Nut
li = elementify2 "li"

li_ :: Array Nut -> Nut
li_ = elementify2 "li" []

dl :: Array (Event (Attribute (Indexed (HTMLDListElement ())))) -> Array Nut -> Nut
dl = elementify2 "dl"

dl_ :: Array Nut -> Nut
dl_ = elementify2 "dl" []

dt :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
dt = elementify2 "dt"

dt_ :: Array Nut -> Nut
dt_ = elementify2 "dt" []

dd :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
dd = elementify2 "dd"

dd_ :: Array Nut -> Nut
dd_ = elementify2 "dd" []

figure :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
figure = elementify2 "figure"

figure_ :: Array Nut -> Nut
figure_ = elementify2 "figure" []

figcaption :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
figcaption = elementify2 "figcaption"

figcaption_ :: Array Nut -> Nut
figcaption_ = elementify2 "figcaption" []

main :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
main = elementify2 "main"

main_ :: Array Nut -> Nut
main_ = elementify2 "main" []

search :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
search = elementify2 "search"

search_ :: Array Nut -> Nut
search_ = elementify2 "search" []

div :: Array (Event (Attribute (Indexed (HTMLDivElement ())))) -> Array Nut -> Nut
div = elementify2 "div"

div_ :: Array Nut -> Nut
div_ = elementify2 "div" []

a :: Array (Event (Attribute (Indexed (SVGAElement ())))) -> Array Nut -> Nut
a = elementify2 "a"

a_ :: Array Nut -> Nut
a_ = elementify2 "a" []

em :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
em = elementify2 "em"

em_ :: Array Nut -> Nut
em_ = elementify2 "em" []

strong :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
strong = elementify2 "strong"

strong_ :: Array Nut -> Nut
strong_ = elementify2 "strong" []

small :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
small = elementify2 "small"

small_ :: Array Nut -> Nut
small_ = elementify2 "small" []

s :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
s = elementify2 "s"

s_ :: Array Nut -> Nut
s_ = elementify2 "s" []

cite :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
cite = elementify2 "cite"

cite_ :: Array Nut -> Nut
cite_ = elementify2 "cite" []

q :: Array (Event (Attribute (Indexed (HTMLQuoteElement ())))) -> Array Nut -> Nut
q = elementify2 "q"

q_ :: Array Nut -> Nut
q_ = elementify2 "q" []

dfn :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
dfn = elementify2 "dfn"

dfn_ :: Array Nut -> Nut
dfn_ = elementify2 "dfn" []

abbr :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
abbr = elementify2 "abbr"

abbr_ :: Array Nut -> Nut
abbr_ = elementify2 "abbr" []

ruby :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
ruby = elementify2 "ruby"

ruby_ :: Array Nut -> Nut
ruby_ = elementify2 "ruby" []

rt :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
rt = elementify2 "rt"

rt_ :: Array Nut -> Nut
rt_ = elementify2 "rt" []

rp :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
rp = elementify2 "rp"

rp_ :: Array Nut -> Nut
rp_ = elementify2 "rp" []

xdata :: Array (Event (Attribute (Indexed (HTMLDataElement ())))) -> Array Nut -> Nut
xdata = elementify2 "xdata"

xdata_ :: Array Nut -> Nut
xdata_ = elementify2 "xdata" []

time :: Array (Event (Attribute (Indexed (HTMLTimeElement ())))) -> Array Nut -> Nut
time = elementify2 "time"

time_ :: Array Nut -> Nut
time_ = elementify2 "time" []

code :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
code = elementify2 "code"

code_ :: Array Nut -> Nut
code_ = elementify2 "code" []

var :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
var = elementify2 "var"

var_ :: Array Nut -> Nut
var_ = elementify2 "var" []

samp :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
samp = elementify2 "samp"

samp_ :: Array Nut -> Nut
samp_ = elementify2 "samp" []

kbd :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
kbd = elementify2 "kbd"

kbd_ :: Array Nut -> Nut
kbd_ = elementify2 "kbd" []

sub :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
sub = elementify2 "sub"

sub_ :: Array Nut -> Nut
sub_ = elementify2 "sub" []

sup :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
sup = elementify2 "sup"

sup_ :: Array Nut -> Nut
sup_ = elementify2 "sup" []

i :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
i = elementify2 "i"

i_ :: Array Nut -> Nut
i_ = elementify2 "i" []

b :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
b = elementify2 "b"

b_ :: Array Nut -> Nut
b_ = elementify2 "b" []

u :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
u = elementify2 "u"

u_ :: Array Nut -> Nut
u_ = elementify2 "u" []

mark :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
mark = elementify2 "mark"

mark_ :: Array Nut -> Nut
mark_ = elementify2 "mark" []

bdi :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
bdi = elementify2 "bdi"

bdi_ :: Array Nut -> Nut
bdi_ = elementify2 "bdi" []

bdo :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
bdo = elementify2 "bdo"

bdo_ :: Array Nut -> Nut
bdo_ = elementify2 "bdo" []

span :: Array (Event (Attribute (Indexed (HTMLSpanElement ())))) -> Array Nut -> Nut
span = elementify2 "span"

span_ :: Array Nut -> Nut
span_ = elementify2 "span" []

br :: Array (Event (Attribute (Indexed (HTMLBRElement ())))) -> Array Nut -> Nut
br = elementify2 "br"

br_ :: Array Nut -> Nut
br_ = elementify2 "br" []

wbr :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
wbr = elementify2 "wbr"

wbr_ :: Array Nut -> Nut
wbr_ = elementify2 "wbr" []

ins :: Array (Event (Attribute (Indexed (HTMLModElement ())))) -> Array Nut -> Nut
ins = elementify2 "ins"

ins_ :: Array Nut -> Nut
ins_ = elementify2 "ins" []

del :: Array (Event (Attribute (Indexed (HTMLModElement ())))) -> Array Nut -> Nut
del = elementify2 "del"

del_ :: Array Nut -> Nut
del_ = elementify2 "del" []

picture :: Array (Event (Attribute (Indexed (HTMLPictureElement ())))) -> Array Nut -> Nut
picture = elementify2 "picture"

picture_ :: Array Nut -> Nut
picture_ = elementify2 "picture" []

source :: Array (Event (Attribute (Indexed (HTMLSourceElement ())))) -> Array Nut -> Nut
source = elementify2 "source"

source_ :: Array Nut -> Nut
source_ = elementify2 "source" []

img :: Array (Event (Attribute (Indexed (HTMLImageElement ())))) -> Array Nut -> Nut
img = elementify2 "img"

img_ :: Array Nut -> Nut
img_ = elementify2 "img" []

iframe :: Array (Event (Attribute (Indexed (HTMLIFrameElement ())))) -> Array Nut -> Nut
iframe = elementify2 "iframe"

iframe_ :: Array Nut -> Nut
iframe_ = elementify2 "iframe" []

embed :: Array (Event (Attribute (Indexed (HTMLEmbedElement ())))) -> Array Nut -> Nut
embed = elementify2 "embed"

embed_ :: Array Nut -> Nut
embed_ = elementify2 "embed" []

object :: Array (Event (Attribute (Indexed (HTMLObjectElement ())))) -> Array Nut -> Nut
object = elementify2 "object"

object_ :: Array Nut -> Nut
object_ = elementify2 "object" []

video :: Array (Event (Attribute (Indexed (HTMLVideoElement ())))) -> Array Nut -> Nut
video = elementify2 "video"

video_ :: Array Nut -> Nut
video_ = elementify2 "video" []

audio :: Array (Event (Attribute (Indexed (HTMLAudioElement ())))) -> Array Nut -> Nut
audio = elementify2 "audio"

audio_ :: Array Nut -> Nut
audio_ = elementify2 "audio" []

track :: Array (Event (Attribute (Indexed (HTMLTrackElement ())))) -> Array Nut -> Nut
track = elementify2 "track"

track_ :: Array Nut -> Nut
track_ = elementify2 "track" []

map :: Array (Event (Attribute (Indexed (HTMLMapElement ())))) -> Array Nut -> Nut
map = elementify2 "map"

map_ :: Array Nut -> Nut
map_ = elementify2 "map" []

area :: Array (Event (Attribute (Indexed (HTMLAreaElement ())))) -> Array Nut -> Nut
area = elementify2 "area"

area_ :: Array Nut -> Nut
area_ = elementify2 "area" []

table :: Array (Event (Attribute (Indexed (HTMLTableElement ())))) -> Array Nut -> Nut
table = elementify2 "table"

table_ :: Array Nut -> Nut
table_ = elementify2 "table" []

caption :: Array (Event (Attribute (Indexed (HTMLTableCaptionElement ())))) -> Array Nut -> Nut
caption = elementify2 "caption"

caption_ :: Array Nut -> Nut
caption_ = elementify2 "caption" []

colgroup :: Array (Event (Attribute (Indexed (HTMLTableColElement ())))) -> Array Nut -> Nut
colgroup = elementify2 "colgroup"

colgroup_ :: Array Nut -> Nut
colgroup_ = elementify2 "colgroup" []

col :: Array (Event (Attribute (Indexed (HTMLTableColElement ())))) -> Array Nut -> Nut
col = elementify2 "col"

col_ :: Array Nut -> Nut
col_ = elementify2 "col" []

tbody :: Array (Event (Attribute (Indexed (HTMLTableSectionElement ())))) -> Array Nut -> Nut
tbody = elementify2 "tbody"

tbody_ :: Array Nut -> Nut
tbody_ = elementify2 "tbody" []

thead :: Array (Event (Attribute (Indexed (HTMLTableSectionElement ())))) -> Array Nut -> Nut
thead = elementify2 "thead"

thead_ :: Array Nut -> Nut
thead_ = elementify2 "thead" []

tfoot :: Array (Event (Attribute (Indexed (HTMLTableSectionElement ())))) -> Array Nut -> Nut
tfoot = elementify2 "tfoot"

tfoot_ :: Array Nut -> Nut
tfoot_ = elementify2 "tfoot" []

tr :: Array (Event (Attribute (Indexed (HTMLTableRowElement ())))) -> Array Nut -> Nut
tr = elementify2 "tr"

tr_ :: Array Nut -> Nut
tr_ = elementify2 "tr" []

td :: Array (Event (Attribute (Indexed (HTMLTableCellElement ())))) -> Array Nut -> Nut
td = elementify2 "td"

td_ :: Array Nut -> Nut
td_ = elementify2 "td" []

th :: Array (Event (Attribute (Indexed (HTMLTableCellElement ())))) -> Array Nut -> Nut
th = elementify2 "th"

th_ :: Array Nut -> Nut
th_ = elementify2 "th" []

form :: Array (Event (Attribute (Indexed (HTMLFormElement ())))) -> Array Nut -> Nut
form = elementify2 "form"

form_ :: Array Nut -> Nut
form_ = elementify2 "form" []

label :: Array (Event (Attribute (Indexed (HTMLLabelElement ())))) -> Array Nut -> Nut
label = elementify2 "label"

label_ :: Array Nut -> Nut
label_ = elementify2 "label" []

input :: Array (Event (Attribute (Indexed (HTMLInputElement ())))) -> Array Nut -> Nut
input = elementify2 "input"

input_ :: Array Nut -> Nut
input_ = elementify2 "input" []

button :: Array (Event (Attribute (Indexed (HTMLButtonElement ())))) -> Array Nut -> Nut
button = elementify2 "button"

button_ :: Array Nut -> Nut
button_ = elementify2 "button" []

select :: Array (Event (Attribute (Indexed (HTMLSelectElement ())))) -> Array Nut -> Nut
select = elementify2 "select"

select_ :: Array Nut -> Nut
select_ = elementify2 "select" []

datalist :: Array (Event (Attribute (Indexed (HTMLDataListElement ())))) -> Array Nut -> Nut
datalist = elementify2 "datalist"

datalist_ :: Array Nut -> Nut
datalist_ = elementify2 "datalist" []

optgroup :: Array (Event (Attribute (Indexed (HTMLOptGroupElement ())))) -> Array Nut -> Nut
optgroup = elementify2 "optgroup"

optgroup_ :: Array Nut -> Nut
optgroup_ = elementify2 "optgroup" []

option :: Array (Event (Attribute (Indexed (HTMLOptionElement ())))) -> Array Nut -> Nut
option = elementify2 "option"

option_ :: Array Nut -> Nut
option_ = elementify2 "option" []

textarea :: Array (Event (Attribute (Indexed (HTMLTextAreaElement ())))) -> Array Nut -> Nut
textarea = elementify2 "textarea"

textarea_ :: Array Nut -> Nut
textarea_ = elementify2 "textarea" []

output :: Array (Event (Attribute (Indexed (HTMLOutputElement ())))) -> Array Nut -> Nut
output = elementify2 "output"

output_ :: Array Nut -> Nut
output_ = elementify2 "output" []

progress :: Array (Event (Attribute (Indexed (HTMLProgressElement ())))) -> Array Nut -> Nut
progress = elementify2 "progress"

progress_ :: Array Nut -> Nut
progress_ = elementify2 "progress" []

meter :: Array (Event (Attribute (Indexed (HTMLMeterElement ())))) -> Array Nut -> Nut
meter = elementify2 "meter"

meter_ :: Array Nut -> Nut
meter_ = elementify2 "meter" []

fieldset :: Array (Event (Attribute (Indexed (HTMLFieldSetElement ())))) -> Array Nut -> Nut
fieldset = elementify2 "fieldset"

fieldset_ :: Array Nut -> Nut
fieldset_ = elementify2 "fieldset" []

legend :: Array (Event (Attribute (Indexed (HTMLLegendElement ())))) -> Array Nut -> Nut
legend = elementify2 "legend"

legend_ :: Array Nut -> Nut
legend_ = elementify2 "legend" []

details :: Array (Event (Attribute (Indexed (HTMLDetailsElement ())))) -> Array Nut -> Nut
details = elementify2 "details"

details_ :: Array Nut -> Nut
details_ = elementify2 "details" []

summary :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
summary = elementify2 "summary"

summary_ :: Array Nut -> Nut
summary_ = elementify2 "summary" []

dialog :: Array (Event (Attribute (Indexed (HTMLDialogElement ())))) -> Array Nut -> Nut
dialog = elementify2 "dialog"

dialog_ :: Array Nut -> Nut
dialog_ = elementify2 "dialog" []

script :: Array (Event (Attribute (Indexed (SVGScriptElement ())))) -> Array Nut -> Nut
script = elementify2 "script"

script_ :: Array Nut -> Nut
script_ = elementify2 "script" []

noscript :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
noscript = elementify2 "noscript"

noscript_ :: Array Nut -> Nut
noscript_ = elementify2 "noscript" []

template :: Array (Event (Attribute (Indexed (HTMLTemplateElement ())))) -> Array Nut -> Nut
template = elementify2 "template"

template_ :: Array Nut -> Nut
template_ = elementify2 "template" []

slot :: Array (Event (Attribute (Indexed (HTMLSlotElement ())))) -> Array Nut -> Nut
slot = elementify2 "slot"

slot_ :: Array Nut -> Nut
slot_ = elementify2 "slot" []

canvas :: Array (Event (Attribute (Indexed (HTMLCanvasElement ())))) -> Array Nut -> Nut
canvas = elementify2 "canvas"

canvas_ :: Array Nut -> Nut
canvas_ = elementify2 "canvas" []

applet :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
applet = elementify2 "applet"

applet_ :: Array Nut -> Nut
applet_ = elementify2 "applet" []

acronym :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
acronym = elementify2 "acronym"

acronym_ :: Array Nut -> Nut
acronym_ = elementify2 "acronym" []

bgsound :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
bgsound = elementify2 "bgsound"

bgsound_ :: Array Nut -> Nut
bgsound_ = elementify2 "bgsound" []

dir :: Array (Event (Attribute (Indexed (HTMLDirectoryElement ())))) -> Array Nut -> Nut
dir = elementify2 "dir"

dir_ :: Array Nut -> Nut
dir_ = elementify2 "dir" []

frame :: Array (Event (Attribute (Indexed (HTMLFrameElement ())))) -> Array Nut -> Nut
frame = elementify2 "frame"

frame_ :: Array Nut -> Nut
frame_ = elementify2 "frame" []

frameset :: Array (Event (Attribute (Indexed (HTMLFrameSetElement ())))) -> Array Nut -> Nut
frameset = elementify2 "frameset"

frameset_ :: Array Nut -> Nut
frameset_ = elementify2 "frameset" []

noframes :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
noframes = elementify2 "noframes"

noframes_ :: Array Nut -> Nut
noframes_ = elementify2 "noframes" []

isindex :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
isindex = elementify2 "isindex"

isindex_ :: Array Nut -> Nut
isindex_ = elementify2 "isindex" []

keygen :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
keygen = elementify2 "keygen"

keygen_ :: Array Nut -> Nut
keygen_ = elementify2 "keygen" []

listing :: Array (Event (Attribute (Indexed (HTMLPreElement ())))) -> Array Nut -> Nut
listing = elementify2 "listing"

listing_ :: Array Nut -> Nut
listing_ = elementify2 "listing" []

menuitem :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
menuitem = elementify2 "menuitem"

menuitem_ :: Array Nut -> Nut
menuitem_ = elementify2 "menuitem" []

nextid :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
nextid = elementify2 "nextid"

nextid_ :: Array Nut -> Nut
nextid_ = elementify2 "nextid" []

noembed :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
noembed = elementify2 "noembed"

noembed_ :: Array Nut -> Nut
noembed_ = elementify2 "noembed" []

param :: Array (Event (Attribute (Indexed (HTMLParamElement ())))) -> Array Nut -> Nut
param = elementify2 "param"

param_ :: Array Nut -> Nut
param_ = elementify2 "param" []

plaintext :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
plaintext = elementify2 "plaintext"

plaintext_ :: Array Nut -> Nut
plaintext_ = elementify2 "plaintext" []

rb :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
rb = elementify2 "rb"

rb_ :: Array Nut -> Nut
rb_ = elementify2 "rb" []

rtc :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
rtc = elementify2 "rtc"

rtc_ :: Array Nut -> Nut
rtc_ = elementify2 "rtc" []

strike :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
strike = elementify2 "strike"

strike_ :: Array Nut -> Nut
strike_ = elementify2 "strike" []

xmp :: Array (Event (Attribute (Indexed (HTMLPreElement ())))) -> Array Nut -> Nut
xmp = elementify2 "xmp"

xmp_ :: Array Nut -> Nut
xmp_ = elementify2 "xmp" []

basefont :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
basefont = elementify2 "basefont"

basefont_ :: Array Nut -> Nut
basefont_ = elementify2 "basefont" []

big :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
big = elementify2 "big"

big_ :: Array Nut -> Nut
big_ = elementify2 "big" []

blink :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
blink = elementify2 "blink"

blink_ :: Array Nut -> Nut
blink_ = elementify2 "blink" []

center :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
center = elementify2 "center"

center_ :: Array Nut -> Nut
center_ = elementify2 "center" []

font :: Array (Event (Attribute (Indexed (HTMLFontElement ())))) -> Array Nut -> Nut
font = elementify2 "font"

font_ :: Array Nut -> Nut
font_ = elementify2 "font" []

marquee :: Array (Event (Attribute (Indexed (HTMLMarqueeElement ())))) -> Array Nut -> Nut
marquee = elementify2 "marquee"

marquee_ :: Array Nut -> Nut
marquee_ = elementify2 "marquee" []

multicol :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
multicol = elementify2 "multicol"

multicol_ :: Array Nut -> Nut
multicol_ = elementify2 "multicol" []

nobr :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
nobr = elementify2 "nobr"

nobr_ :: Array Nut -> Nut
nobr_ = elementify2 "nobr" []

spacer :: Array (Event (Attribute (Indexed (HTMLUnknownElement ())))) -> Array Nut -> Nut
spacer = elementify2 "spacer"

spacer_ :: Array Nut -> Nut
spacer_ = elementify2 "spacer" []

tt :: Array (Event (Attribute (Indexed (HTMLElement ())))) -> Array Nut -> Nut
tt = elementify2 "tt"

tt_ :: Array Nut -> Nut
tt_ = elementify2 "tt" []

svg :: Array (Event (Attribute (Indexed (SVGSVGElement ())))) -> Array Nut -> Nut
svg = elementify2 "svg"

svg_ :: Array Nut -> Nut
svg_ = elementify2 "svg" []

g :: Array (Event (Attribute (Indexed (SVGGElement ())))) -> Array Nut -> Nut
g = elementify2 "g"

g_ :: Array Nut -> Nut
g_ = elementify2 "g" []

defs :: Array (Event (Attribute (Indexed (SVGDefsElement ())))) -> Array Nut -> Nut
defs = elementify2 "defs"

defs_ :: Array Nut -> Nut
defs_ = elementify2 "defs" []

symbol :: Array (Event (Attribute (Indexed (SVGSymbolElement ())))) -> Array Nut -> Nut
symbol = elementify2 "symbol"

symbol_ :: Array Nut -> Nut
symbol_ = elementify2 "symbol" []

use :: Array (Event (Attribute (Indexed (SVGUseElement ())))) -> Array Nut -> Nut
use = elementify2 "use"

use_ :: Array Nut -> Nut
use_ = elementify2 "use" []

switch :: Array (Event (Attribute (Indexed (SVGSwitchElement ())))) -> Array Nut -> Nut
switch = elementify2 "switch"

switch_ :: Array Nut -> Nut
switch_ = elementify2 "switch" []

desc :: Array (Event (Attribute (Indexed (SVGDescElement ())))) -> Array Nut -> Nut
desc = elementify2 "desc"

desc_ :: Array Nut -> Nut
desc_ = elementify2 "desc" []

metadata :: Array (Event (Attribute (Indexed (SVGMetadataElement ())))) -> Array Nut -> Nut
metadata = elementify2 "metadata"

metadata_ :: Array Nut -> Nut
metadata_ = elementify2 "metadata" []

path :: Array (Event (Attribute (Indexed (SVGPathElement ())))) -> Array Nut -> Nut
path = elementify2 "path"

path_ :: Array Nut -> Nut
path_ = elementify2 "path" []

rect :: Array (Event (Attribute (Indexed (SVGRectElement ())))) -> Array Nut -> Nut
rect = elementify2 "rect"

rect_ :: Array Nut -> Nut
rect_ = elementify2 "rect" []

circle :: Array (Event (Attribute (Indexed (SVGCircleElement ())))) -> Array Nut -> Nut
circle = elementify2 "circle"

circle_ :: Array Nut -> Nut
circle_ = elementify2 "circle" []

ellipse :: Array (Event (Attribute (Indexed (SVGEllipseElement ())))) -> Array Nut -> Nut
ellipse = elementify2 "ellipse"

ellipse_ :: Array Nut -> Nut
ellipse_ = elementify2 "ellipse" []

line :: Array (Event (Attribute (Indexed (SVGLineElement ())))) -> Array Nut -> Nut
line = elementify2 "line"

line_ :: Array Nut -> Nut
line_ = elementify2 "line" []

polyline :: Array (Event (Attribute (Indexed (SVGPolylineElement ())))) -> Array Nut -> Nut
polyline = elementify2 "polyline"

polyline_ :: Array Nut -> Nut
polyline_ = elementify2 "polyline" []

polygon :: Array (Event (Attribute (Indexed (SVGPolygonElement ())))) -> Array Nut -> Nut
polygon = elementify2 "polygon"

polygon_ :: Array Nut -> Nut
polygon_ = elementify2 "polygon" []

text :: Array (Event (Attribute (Indexed (SVGTextElement ())))) -> Array Nut -> Nut
text = elementify2 "text"

text_ :: Array Nut -> Nut
text_ = elementify2 "text" []

tspan :: Array (Event (Attribute (Indexed (SVGTSpanElement ())))) -> Array Nut -> Nut
tspan = elementify2 "tspan"

tspan_ :: Array Nut -> Nut
tspan_ = elementify2 "tspan" []

textPath :: Array (Event (Attribute (Indexed (SVGTextPathElement ())))) -> Array Nut -> Nut
textPath = elementify2 "textPath"

textPath_ :: Array Nut -> Nut
textPath_ = elementify2 "textPath" []

image :: Array (Event (Attribute (Indexed (SVGImageElement ())))) -> Array Nut -> Nut
image = elementify2 "image"

image_ :: Array Nut -> Nut
image_ = elementify2 "image" []

foreignObject
  :: Array (Event (Attribute (Indexed (SVGForeignObjectElement ())))) -> Array Nut -> Nut
foreignObject = elementify2 "foreignObject"

foreignObject_ :: Array Nut -> Nut
foreignObject_ = elementify2 "foreignObject" []

marker :: Array (Event (Attribute (Indexed (SVGMarkerElement ())))) -> Array Nut -> Nut
marker = elementify2 "marker"

marker_ :: Array Nut -> Nut
marker_ = elementify2 "marker" []

linearGradient
  :: Array (Event (Attribute (Indexed (SVGLinearGradientElement ())))) -> Array Nut -> Nut
linearGradient = elementify2 "linearGradient"

linearGradient_ :: Array Nut -> Nut
linearGradient_ = elementify2 "linearGradient" []

radialGradient
  :: Array (Event (Attribute (Indexed (SVGRadialGradientElement ())))) -> Array Nut -> Nut
radialGradient = elementify2 "radialGradient"

radialGradient_ :: Array Nut -> Nut
radialGradient_ = elementify2 "radialGradient" []

stop :: Array (Event (Attribute (Indexed (SVGStopElement ())))) -> Array Nut -> Nut
stop = elementify2 "stop"

stop_ :: Array Nut -> Nut
stop_ = elementify2 "stop" []

pattern :: Array (Event (Attribute (Indexed (SVGPatternElement ())))) -> Array Nut -> Nut
pattern = elementify2 "pattern"

pattern_ :: Array Nut -> Nut
pattern_ = elementify2 "pattern" []

view :: Array (Event (Attribute (Indexed (SVGViewElement ())))) -> Array Nut -> Nut
view = elementify2 "view"

view_ :: Array Nut -> Nut
view_ = elementify2 "view" []

filter :: Array (Event (Attribute (Indexed (SVGFilterElement ())))) -> Array Nut -> Nut
filter = elementify2 "filter"

filter_ :: Array Nut -> Nut
filter_ = elementify2 "filter" []

feBlend :: Array (Event (Attribute (Indexed (SVGFEBlendElement ())))) -> Array Nut -> Nut
feBlend = elementify2 "feBlend"

feBlend_ :: Array Nut -> Nut
feBlend_ = elementify2 "feBlend" []

feColorMatrix
  :: Array (Event (Attribute (Indexed (SVGFEColorMatrixElement ())))) -> Array Nut -> Nut
feColorMatrix = elementify2 "feColorMatrix"

feColorMatrix_ :: Array Nut -> Nut
feColorMatrix_ = elementify2 "feColorMatrix" []

feComponentTransfer
  :: Array (Event (Attribute (Indexed (SVGFEComponentTransferElement ())))) -> Array Nut -> Nut
feComponentTransfer = elementify2 "feComponentTransfer"

feComponentTransfer_ :: Array Nut -> Nut
feComponentTransfer_ = elementify2 "feComponentTransfer" []

feFuncR :: Array (Event (Attribute (Indexed (SVGFEFuncRElement ())))) -> Array Nut -> Nut
feFuncR = elementify2 "feFuncR"

feFuncR_ :: Array Nut -> Nut
feFuncR_ = elementify2 "feFuncR" []

feFuncG :: Array (Event (Attribute (Indexed (SVGFEFuncGElement ())))) -> Array Nut -> Nut
feFuncG = elementify2 "feFuncG"

feFuncG_ :: Array Nut -> Nut
feFuncG_ = elementify2 "feFuncG" []

feFuncB :: Array (Event (Attribute (Indexed (SVGFEFuncBElement ())))) -> Array Nut -> Nut
feFuncB = elementify2 "feFuncB"

feFuncB_ :: Array Nut -> Nut
feFuncB_ = elementify2 "feFuncB" []

feFuncA :: Array (Event (Attribute (Indexed (SVGFEFuncAElement ())))) -> Array Nut -> Nut
feFuncA = elementify2 "feFuncA"

feFuncA_ :: Array Nut -> Nut
feFuncA_ = elementify2 "feFuncA" []

feComposite :: Array (Event (Attribute (Indexed (SVGFECompositeElement ())))) -> Array Nut -> Nut
feComposite = elementify2 "feComposite"

feComposite_ :: Array Nut -> Nut
feComposite_ = elementify2 "feComposite" []

feConvolveMatrix
  :: Array (Event (Attribute (Indexed (SVGFEConvolveMatrixElement ())))) -> Array Nut -> Nut
feConvolveMatrix = elementify2 "feConvolveMatrix"

feConvolveMatrix_ :: Array Nut -> Nut
feConvolveMatrix_ = elementify2 "feConvolveMatrix" []

feDiffuseLighting
  :: Array (Event (Attribute (Indexed (SVGFEDiffuseLightingElement ())))) -> Array Nut -> Nut
feDiffuseLighting = elementify2 "feDiffuseLighting"

feDiffuseLighting_ :: Array Nut -> Nut
feDiffuseLighting_ = elementify2 "feDiffuseLighting" []

feDisplacementMap
  :: Array (Event (Attribute (Indexed (SVGFEDisplacementMapElement ())))) -> Array Nut -> Nut
feDisplacementMap = elementify2 "feDisplacementMap"

feDisplacementMap_ :: Array Nut -> Nut
feDisplacementMap_ = elementify2 "feDisplacementMap" []

feDropShadow :: Array (Event (Attribute (Indexed (SVGFEDropShadowElement ())))) -> Array Nut -> Nut
feDropShadow = elementify2 "feDropShadow"

feDropShadow_ :: Array Nut -> Nut
feDropShadow_ = elementify2 "feDropShadow" []

feFlood :: Array (Event (Attribute (Indexed (SVGFEFloodElement ())))) -> Array Nut -> Nut
feFlood = elementify2 "feFlood"

feFlood_ :: Array Nut -> Nut
feFlood_ = elementify2 "feFlood" []

feGaussianBlur
  :: Array (Event (Attribute (Indexed (SVGFEGaussianBlurElement ())))) -> Array Nut -> Nut
feGaussianBlur = elementify2 "feGaussianBlur"

feGaussianBlur_ :: Array Nut -> Nut
feGaussianBlur_ = elementify2 "feGaussianBlur" []

feImage :: Array (Event (Attribute (Indexed (SVGFEImageElement ())))) -> Array Nut -> Nut
feImage = elementify2 "feImage"

feImage_ :: Array Nut -> Nut
feImage_ = elementify2 "feImage" []

feMerge :: Array (Event (Attribute (Indexed (SVGFEMergeElement ())))) -> Array Nut -> Nut
feMerge = elementify2 "feMerge"

feMerge_ :: Array Nut -> Nut
feMerge_ = elementify2 "feMerge" []

feMergeNode :: Array (Event (Attribute (Indexed (SVGFEMergeNodeElement ())))) -> Array Nut -> Nut
feMergeNode = elementify2 "feMergeNode"

feMergeNode_ :: Array Nut -> Nut
feMergeNode_ = elementify2 "feMergeNode" []

feMorphology :: Array (Event (Attribute (Indexed (SVGFEMorphologyElement ())))) -> Array Nut -> Nut
feMorphology = elementify2 "feMorphology"

feMorphology_ :: Array Nut -> Nut
feMorphology_ = elementify2 "feMorphology" []

feOffset :: Array (Event (Attribute (Indexed (SVGFEOffsetElement ())))) -> Array Nut -> Nut
feOffset = elementify2 "feOffset"

feOffset_ :: Array Nut -> Nut
feOffset_ = elementify2 "feOffset" []

feSpecularLighting
  :: Array (Event (Attribute (Indexed (SVGFESpecularLightingElement ())))) -> Array Nut -> Nut
feSpecularLighting = elementify2 "feSpecularLighting"

feSpecularLighting_ :: Array Nut -> Nut
feSpecularLighting_ = elementify2 "feSpecularLighting" []

feTile :: Array (Event (Attribute (Indexed (SVGFETileElement ())))) -> Array Nut -> Nut
feTile = elementify2 "feTile"

feTile_ :: Array Nut -> Nut
feTile_ = elementify2 "feTile" []

feTurbulence :: Array (Event (Attribute (Indexed (SVGFETurbulenceElement ())))) -> Array Nut -> Nut
feTurbulence = elementify2 "feTurbulence"

feTurbulence_ :: Array Nut -> Nut
feTurbulence_ = elementify2 "feTurbulence" []

feDistantLight
  :: Array (Event (Attribute (Indexed (SVGFEDistantLightElement ())))) -> Array Nut -> Nut
feDistantLight = elementify2 "feDistantLight"

feDistantLight_ :: Array Nut -> Nut
feDistantLight_ = elementify2 "feDistantLight" []

fePointLight :: Array (Event (Attribute (Indexed (SVGFEPointLightElement ())))) -> Array Nut -> Nut
fePointLight = elementify2 "fePointLight"

fePointLight_ :: Array Nut -> Nut
fePointLight_ = elementify2 "fePointLight" []

feSpotLight :: Array (Event (Attribute (Indexed (SVGFESpotLightElement ())))) -> Array Nut -> Nut
feSpotLight = elementify2 "feSpotLight"

feSpotLight_ :: Array Nut -> Nut
feSpotLight_ = elementify2 "feSpotLight" []

boolAttributeValue :: Boolean -> AttributeValue
boolAttributeValue = prop' <<< Show.show

numberAttributeValue :: Number -> AttributeValue
numberAttributeValue = prop' <<< Show.show

intAttributeValue :: Int -> AttributeValue
intAttributeValue = prop' <<< Show.show

keywordAttributeValue :: forall v. Keyword v -> AttributeValue
keywordAttributeValue = prop' <<< Newtype.unwrap

class IsCrossorigin (v :: Type) (a :: Type) | v -> a where
  isCrossorigin :: v -> AttributeValue

instance IsCrossorigin (Keyword "use-credentials") String where
  isCrossorigin = keywordAttributeValue

instance IsCrossorigin (Keyword "anonymous") String where
  isCrossorigin = keywordAttributeValue

_crossorigin
  :: forall r v a
   . IsCrossorigin v a
  => Event v
  -> Event (Attribute (Indexed (crossorigin :: a | r)))
_crossorigin = Functor.map $
  (unsafeAttribute <<< { key: "crossorigin", value: _ } <<< isCrossorigin)

_crossorigin_
  :: forall r v a. IsCrossorigin v a => v -> Event (Attribute (Indexed (crossorigin :: a | r)))
_crossorigin_ = _crossorigin <<< Applicative.pure

class IsLoading (v :: Type) (a :: Type) | v -> a where
  isLoading :: v -> AttributeValue

instance IsLoading String String where
  isLoading = prop'

instance IsLoading (Keyword "eager") String where
  isLoading = keywordAttributeValue

instance IsLoading (Keyword "lazy") String where
  isLoading = keywordAttributeValue

_loading
  :: forall r v a. IsLoading v a => Event v -> Event (Attribute (Indexed (loading :: a | r)))
_loading = Functor.map $ (unsafeAttribute <<< { key: "loading", value: _ } <<< isLoading)

_loading_ :: forall r v a. IsLoading v a => v -> Event (Attribute (Indexed (loading :: a | r)))
_loading_ = _loading <<< Applicative.pure

class IsFetchpriority (v :: Type) (a :: Type) | v -> a where
  isFetchpriority :: v -> AttributeValue

instance IsFetchpriority (Keyword "auto") String where
  isFetchpriority = keywordAttributeValue

instance IsFetchpriority (Keyword "low") String where
  isFetchpriority = keywordAttributeValue

instance IsFetchpriority (Keyword "high") String where
  isFetchpriority = keywordAttributeValue

_fetchpriority
  :: forall r v a
   . IsFetchpriority v a
  => Event v
  -> Event (Attribute (Indexed (fetchpriority :: a | r)))
_fetchpriority = Functor.map $
  (unsafeAttribute <<< { key: "fetchpriority", value: _ } <<< isFetchpriority)

_fetchpriority_
  :: forall r v a. IsFetchpriority v a => v -> Event (Attribute (Indexed (fetchpriority :: a | r)))
_fetchpriority_ = _fetchpriority <<< Applicative.pure

class IsDir (v :: Type) (a :: Type) | v -> a where
  isDir :: v -> AttributeValue

instance IsDir String String where
  isDir = prop'

instance IsDir (Keyword "auto") String where
  isDir = keywordAttributeValue

instance IsDir (Keyword "rtl") String where
  isDir = keywordAttributeValue

instance IsDir (Keyword "ltr") String where
  isDir = keywordAttributeValue

_dir :: forall r v a. IsDir v a => Event v -> Event (Attribute (Indexed (dir :: a | r)))
_dir = Functor.map $ (unsafeAttribute <<< { key: "dir", value: _ } <<< isDir)

_dir_ :: forall r v a. IsDir v a => v -> Event (Attribute (Indexed (dir :: a | r)))
_dir_ = _dir <<< Applicative.pure

class IsName (v :: Type) (a :: Type) | v -> a where
  isName :: v -> AttributeValue

instance IsName String String where
  isName = prop'

instance IsName (Keyword "color-scheme") String where
  isName = keywordAttributeValue

instance IsName (Keyword "theme-color") String where
  isName = keywordAttributeValue

instance IsName (Keyword "referrer") String where
  isName = keywordAttributeValue

instance IsName (Keyword "keywords") String where
  isName = keywordAttributeValue

instance IsName (Keyword "generator") String where
  isName = keywordAttributeValue

instance IsName (Keyword "description") String where
  isName = keywordAttributeValue

instance IsName (Keyword "author") String where
  isName = keywordAttributeValue

instance IsName (Keyword "application-name") String where
  isName = keywordAttributeValue

_name :: forall r v a. IsName v a => Event v -> Event (Attribute (Indexed (name :: a | r)))
_name = Functor.map $ (unsafeAttribute <<< { key: "name", value: _ } <<< isName)

_name_ :: forall r v a. IsName v a => v -> Event (Attribute (Indexed (name :: a | r)))
_name_ = _name <<< Applicative.pure

class IsHttpEquiv (v :: Type) (a :: Type) | v -> a where
  isHttpEquiv :: v -> AttributeValue

instance IsHttpEquiv String String where
  isHttpEquiv = prop'

instance IsHttpEquiv (Keyword "content-security-policy") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "x-ua-compatible") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "set-cookie") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "refresh") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "default-style") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "content-type") String where
  isHttpEquiv = keywordAttributeValue

instance IsHttpEquiv (Keyword "content-language") String where
  isHttpEquiv = keywordAttributeValue

_httpEquiv
  :: forall r v a. IsHttpEquiv v a => Event v -> Event (Attribute (Indexed (httpEquiv :: a | r)))
_httpEquiv = Functor.map $ (unsafeAttribute <<< { key: "httpEquiv", value: _ } <<< isHttpEquiv)

_httpEquiv_
  :: forall r v a. IsHttpEquiv v a => v -> Event (Attribute (Indexed (httpEquiv :: a | r)))
_httpEquiv_ = _httpEquiv <<< Applicative.pure

class IsXtype (v :: Type) (a :: Type) | v -> a where
  isXtype :: v -> AttributeValue

instance IsXtype String String where
  isXtype = prop'

instance IsXtype (Keyword "button") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "reset") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "submit") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "image") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "file") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "radio") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "checkbox") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "color") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "range") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "number") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "datetime-local") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "time") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "week") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "month") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "date") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "password") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "email") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "url") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "tel") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "search") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "text") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "hidden") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "I") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "i") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "A") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "a") String where
  isXtype = keywordAttributeValue

instance IsXtype (Keyword "1") String where
  isXtype = keywordAttributeValue

_xtype :: forall r v a. IsXtype v a => Event v -> Event (Attribute (Indexed (xtype :: a | r)))
_xtype = Functor.map $ (unsafeAttribute <<< { key: "type", value: _ } <<< isXtype)

_xtype_ :: forall r v a. IsXtype v a => v -> Event (Attribute (Indexed (xtype :: a | r)))
_xtype_ = _xtype <<< Applicative.pure

class IsRel (v :: Type) (a :: Type) | v -> a where
  isRel :: v -> AttributeValue

instance IsRel String String where
  isRel = prop'

instance IsRel (Keyword "prev") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "next") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "tag") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "stylesheet") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "search") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "preload") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "prefetch") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "preconnect") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "pingback") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "opener") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "noreferrer") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "noopener") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "nofollow") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "modulepreload") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "manifest") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "license") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "icon") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "help") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "external") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "dns-prefetch") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "canonical") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "bookmark") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "author") String where
  isRel = keywordAttributeValue

instance IsRel (Keyword "alternate") String where
  isRel = keywordAttributeValue

_rel :: forall r v a. IsRel v a => Event v -> Event (Attribute (Indexed (rel :: a | r)))
_rel = Functor.map $ (unsafeAttribute <<< { key: "rel", value: _ } <<< isRel)

_rel_ :: forall r v a. IsRel v a => v -> Event (Attribute (Indexed (rel :: a | r)))
_rel_ = _rel <<< Applicative.pure

class IsDecoding (v :: Type) (a :: Type) | v -> a where
  isDecoding :: v -> AttributeValue

instance IsDecoding String String where
  isDecoding = prop'

instance IsDecoding (Keyword "auto") String where
  isDecoding = keywordAttributeValue

instance IsDecoding (Keyword "async") String where
  isDecoding = keywordAttributeValue

instance IsDecoding (Keyword "sync") String where
  isDecoding = keywordAttributeValue

_decoding
  :: forall r v a. IsDecoding v a => Event v -> Event (Attribute (Indexed (decoding :: a | r)))
_decoding = Functor.map $ (unsafeAttribute <<< { key: "decoding", value: _ } <<< isDecoding)

_decoding_ :: forall r v a. IsDecoding v a => v -> Event (Attribute (Indexed (decoding :: a | r)))
_decoding_ = _decoding <<< Applicative.pure

class IsKind (v :: Type) (a :: Type) | v -> a where
  isKind :: v -> AttributeValue

instance IsKind String String where
  isKind = prop'

instance IsKind (Keyword "metadata") String where
  isKind = keywordAttributeValue

instance IsKind (Keyword "chapters") String where
  isKind = keywordAttributeValue

instance IsKind (Keyword "descriptions") String where
  isKind = keywordAttributeValue

instance IsKind (Keyword "captions") String where
  isKind = keywordAttributeValue

instance IsKind (Keyword "subtitles") String where
  isKind = keywordAttributeValue

_kind :: forall r v a. IsKind v a => Event v -> Event (Attribute (Indexed (kind :: a | r)))
_kind = Functor.map $ (unsafeAttribute <<< { key: "kind", value: _ } <<< isKind)

_kind_ :: forall r v a. IsKind v a => v -> Event (Attribute (Indexed (kind :: a | r)))
_kind_ = _kind <<< Applicative.pure

class IsPreload (v :: Type) (a :: Type) | v -> a where
  isPreload :: v -> AttributeValue

instance IsPreload String String where
  isPreload = prop'

instance IsPreload (Keyword "auto") String where
  isPreload = keywordAttributeValue

instance IsPreload (Keyword "metadata") String where
  isPreload = keywordAttributeValue

instance IsPreload (Keyword "none") String where
  isPreload = keywordAttributeValue

_preload
  :: forall r v a. IsPreload v a => Event v -> Event (Attribute (Indexed (preload :: a | r)))
_preload = Functor.map $ (unsafeAttribute <<< { key: "preload", value: _ } <<< isPreload)

_preload_ :: forall r v a. IsPreload v a => v -> Event (Attribute (Indexed (preload :: a | r)))
_preload_ = _preload <<< Applicative.pure

class IsShape (v :: Type) (a :: Type) | v -> a where
  isShape :: v -> AttributeValue

instance IsShape String String where
  isShape = prop'

instance IsShape (Keyword "rectangle state") String where
  isShape = keywordAttributeValue

instance IsShape (Keyword "polygon state") String where
  isShape = keywordAttributeValue

instance IsShape (Keyword "default state") String where
  isShape = keywordAttributeValue

instance IsShape (Keyword "circle state") String where
  isShape = keywordAttributeValue

_shape :: forall r v a. IsShape v a => Event v -> Event (Attribute (Indexed (shape :: a | r)))
_shape = Functor.map $ (unsafeAttribute <<< { key: "shape", value: _ } <<< isShape)

_shape_ :: forall r v a. IsShape v a => v -> Event (Attribute (Indexed (shape :: a | r)))
_shape_ = _shape <<< Applicative.pure

class IsScope (v :: Type) (a :: Type) | v -> a where
  isScope :: v -> AttributeValue

instance IsScope String String where
  isScope = prop'

instance IsScope (Keyword "auto") String where
  isScope = keywordAttributeValue

instance IsScope (Keyword "colgroup") String where
  isScope = keywordAttributeValue

instance IsScope (Keyword "rowgroup") String where
  isScope = keywordAttributeValue

instance IsScope (Keyword "col") String where
  isScope = keywordAttributeValue

instance IsScope (Keyword "row") String where
  isScope = keywordAttributeValue

_scope :: forall r v a. IsScope v a => Event v -> Event (Attribute (Indexed (scope :: a | r)))
_scope = Functor.map $ (unsafeAttribute <<< { key: "scope", value: _ } <<< isScope)

_scope_ :: forall r v a. IsScope v a => v -> Event (Attribute (Indexed (scope :: a | r)))
_scope_ = _scope <<< Applicative.pure

class IsWrap (v :: Type) (a :: Type) | v -> a where
  isWrap :: v -> AttributeValue

instance IsWrap String String where
  isWrap = prop'

instance IsWrap (Keyword "hard") String where
  isWrap = keywordAttributeValue

instance IsWrap (Keyword "soft") String where
  isWrap = keywordAttributeValue

_wrap :: forall r v a. IsWrap v a => Event v -> Event (Attribute (Indexed (wrap :: a | r)))
_wrap = Functor.map $ (unsafeAttribute <<< { key: "wrap", value: _ } <<< isWrap)

_wrap_ :: forall r v a. IsWrap v a => v -> Event (Attribute (Indexed (wrap :: a | r)))
_wrap_ = _wrap <<< Applicative.pure

class IsMethod (v :: Type) (a :: Type) | v -> a where
  isMethod :: v -> AttributeValue

instance IsMethod String String where
  isMethod = prop'

instance IsMethod (Keyword "dialog") String where
  isMethod = keywordAttributeValue

instance IsMethod (Keyword "post") String where
  isMethod = keywordAttributeValue

instance IsMethod (Keyword "get") String where
  isMethod = keywordAttributeValue

_method :: forall r v a. IsMethod v a => Event v -> Event (Attribute (Indexed (method :: a | r)))
_method = Functor.map $ (unsafeAttribute <<< { key: "method", value: _ } <<< isMethod)

_method_ :: forall r v a. IsMethod v a => v -> Event (Attribute (Indexed (method :: a | r)))
_method_ = _method <<< Applicative.pure

class IsEnctype (v :: Type) (a :: Type) | v -> a where
  isEnctype :: v -> AttributeValue

instance IsEnctype String String where
  isEnctype = prop'

instance IsEnctype (Keyword "text/plain") String where
  isEnctype = keywordAttributeValue

instance IsEnctype (Keyword "multipart/form-data") String where
  isEnctype = keywordAttributeValue

instance IsEnctype (Keyword "application/x-www-form-urlencoded") String where
  isEnctype = keywordAttributeValue

_enctype
  :: forall r v a. IsEnctype v a => Event v -> Event (Attribute (Indexed (enctype :: a | r)))
_enctype = Functor.map $ (unsafeAttribute <<< { key: "enctype", value: _ } <<< isEnctype)

_enctype_ :: forall r v a. IsEnctype v a => v -> Event (Attribute (Indexed (enctype :: a | r)))
_enctype_ = _enctype <<< Applicative.pure

class IsAutocomplete (v :: Type) (a :: Type) | v -> a where
  isAutocomplete :: v -> AttributeValue

instance IsAutocomplete String String where
  isAutocomplete = prop'

instance IsAutocomplete (Keyword "impp") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "email") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-extension") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-local-suffix") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-local-prefix") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-local") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-area-code") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-national") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel-country-code") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "tel") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "photo") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "url") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "sex") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "bday-year") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "bday-month") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "bday-day") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "bday") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "language") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "transaction-amount") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "transaction-currency") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-type") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-csc") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-exp-year") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-exp-month") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-exp") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-number") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-family-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-additional-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-given-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "cc-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "postal-code") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "country-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "country") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-level1") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-level2") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-level3") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-level4") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-line3") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-line2") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "address-line1") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "street-address") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "organization") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "one-time-code") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "current-password") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "new-password") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "username") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "organization-title") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "nickname") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "honorific-suffix") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "family-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "additional-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "given-name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "honorific-prefix") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "name") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "on") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "off") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "pager") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "fax") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "mobile") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "work") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "home") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "billing") String where
  isAutocomplete = keywordAttributeValue

instance IsAutocomplete (Keyword "shipping") String where
  isAutocomplete = keywordAttributeValue

_autocomplete
  :: forall r v a
   . IsAutocomplete v a
  => Event v
  -> Event (Attribute (Indexed (autocomplete :: a | r)))
_autocomplete = Functor.map $
  (unsafeAttribute <<< { key: "autocomplete", value: _ } <<< isAutocomplete)

_autocomplete_
  :: forall r v a. IsAutocomplete v a => v -> Event (Attribute (Indexed (autocomplete :: a | r)))
_autocomplete_ = _autocomplete <<< Applicative.pure

class IsEntry (v :: Type) (a :: Type) | v -> a where
  isEntry :: v -> AttributeValue

instance IsEntry (Keyword "value") String where
  isEntry = keywordAttributeValue

instance IsEntry (Keyword "name") String where
  isEntry = keywordAttributeValue

_entry :: forall r v a. IsEntry v a => Event v -> Event (Attribute (Indexed (entry :: a | r)))
_entry = Functor.map $ (unsafeAttribute <<< { key: "entry", value: _ } <<< isEntry)

_entry_ :: forall r v a. IsEntry v a => v -> Event (Attribute (Indexed (entry :: a | r)))
_entry_ = _entry <<< Applicative.pure

class IsHidden (v :: Type) (a :: Type) | v -> a where
  isHidden :: v -> AttributeValue

instance IsHidden Boolean Boolean where
  isHidden = boolAttributeValue

instance IsHidden Number Number where
  isHidden = numberAttributeValue

instance IsHidden String String where
  isHidden = prop'

instance IsHidden (Keyword "hidden") String where
  isHidden = keywordAttributeValue

instance IsHidden (Keyword "until-found") String where
  isHidden = keywordAttributeValue

_hidden :: forall r v a. IsHidden v a => Event v -> Event (Attribute (Indexed (hidden :: a | r)))
_hidden = Functor.map $ (unsafeAttribute <<< { key: "hidden", value: _ } <<< isHidden)

_hidden_ :: forall r v a. IsHidden v a => v -> Event (Attribute (Indexed (hidden :: a | r)))
_hidden_ = _hidden <<< Applicative.pure

class IsAutocapitalize (v :: Type) (a :: Type) | v -> a where
  isAutocapitalize :: v -> AttributeValue

instance IsAutocapitalize String String where
  isAutocapitalize = prop'

instance IsAutocapitalize (Keyword "characters") String where
  isAutocapitalize = keywordAttributeValue

instance IsAutocapitalize (Keyword "words") String where
  isAutocapitalize = keywordAttributeValue

instance IsAutocapitalize (Keyword "sentences") String where
  isAutocapitalize = keywordAttributeValue

instance IsAutocapitalize (Keyword "on") String where
  isAutocapitalize = keywordAttributeValue

instance IsAutocapitalize (Keyword "none") String where
  isAutocapitalize = keywordAttributeValue

instance IsAutocapitalize (Keyword "off") String where
  isAutocapitalize = keywordAttributeValue

_autocapitalize
  :: forall r v a
   . IsAutocapitalize v a
  => Event v
  -> Event (Attribute (Indexed (autocapitalize :: a | r)))
_autocapitalize = Functor.map $
  (unsafeAttribute <<< { key: "autocapitalize", value: _ } <<< isAutocapitalize)

_autocapitalize_
  :: forall r v a
   . IsAutocapitalize v a
  => v
  -> Event (Attribute (Indexed (autocapitalize :: a | r)))
_autocapitalize_ = _autocapitalize <<< Applicative.pure

class IsInputmode (v :: Type) (a :: Type) | v -> a where
  isInputmode :: v -> AttributeValue

instance IsInputmode (Keyword "search") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "decimal") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "numeric") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "email") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "url") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "tel") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "text") String where
  isInputmode = keywordAttributeValue

instance IsInputmode (Keyword "none") String where
  isInputmode = keywordAttributeValue

_inputmode
  :: forall r v a. IsInputmode v a => Event v -> Event (Attribute (Indexed (inputmode :: a | r)))
_inputmode = Functor.map $ (unsafeAttribute <<< { key: "inputmode", value: _ } <<< isInputmode)

_inputmode_
  :: forall r v a. IsInputmode v a => v -> Event (Attribute (Indexed (inputmode :: a | r)))
_inputmode_ = _inputmode <<< Applicative.pure

class IsEnterkeyhint (v :: Type) (a :: Type) | v -> a where
  isEnterkeyhint :: v -> AttributeValue

instance IsEnterkeyhint (Keyword "send") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "search") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "previous") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "next") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "go") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "done") String where
  isEnterkeyhint = keywordAttributeValue

instance IsEnterkeyhint (Keyword "enter") String where
  isEnterkeyhint = keywordAttributeValue

_enterkeyhint
  :: forall r v a
   . IsEnterkeyhint v a
  => Event v
  -> Event (Attribute (Indexed (enterkeyhint :: a | r)))
_enterkeyhint = Functor.map $
  (unsafeAttribute <<< { key: "enterkeyhint", value: _ } <<< isEnterkeyhint)

_enterkeyhint_
  :: forall r v a. IsEnterkeyhint v a => v -> Event (Attribute (Indexed (enterkeyhint :: a | r)))
_enterkeyhint_ = _enterkeyhint <<< Applicative.pure

class IsPopover (v :: Type) (a :: Type) | v -> a where
  isPopover :: v -> AttributeValue

instance IsPopover String String where
  isPopover = prop'

instance IsPopover (Keyword "manual") String where
  isPopover = keywordAttributeValue

instance IsPopover (Keyword "auto") String where
  isPopover = keywordAttributeValue

_popover
  :: forall r v a. IsPopover v a => Event v -> Event (Attribute (Indexed (popover :: a | r)))
_popover = Functor.map $ (unsafeAttribute <<< { key: "popover", value: _ } <<< isPopover)

_popover_ :: forall r v a. IsPopover v a => v -> Event (Attribute (Indexed (popover :: a | r)))
_popover_ = _popover <<< Applicative.pure

class IsPopovertargetaction (v :: Type) (a :: Type) | v -> a where
  isPopovertargetaction :: v -> AttributeValue

instance IsPopovertargetaction (Keyword "hide") String where
  isPopovertargetaction = keywordAttributeValue

instance IsPopovertargetaction (Keyword "show") String where
  isPopovertargetaction = keywordAttributeValue

instance IsPopovertargetaction (Keyword "toggle") String where
  isPopovertargetaction = keywordAttributeValue

_popovertargetaction
  :: forall r v a
   . IsPopovertargetaction v a
  => Event v
  -> Event (Attribute (Indexed (popovertargetaction :: a | r)))
_popovertargetaction = Functor.map $
  (unsafeAttribute <<< { key: "popovertargetaction", value: _ } <<< isPopovertargetaction)

_popovertargetaction_
  :: forall r v a
   . IsPopovertargetaction v a
  => v
  -> Event (Attribute (Indexed (popovertargetaction :: a | r)))
_popovertargetaction_ = _popovertargetaction <<< Applicative.pure

class IsSandbox (v :: Type) (a :: Type) | v -> a where
  isSandbox :: v -> AttributeValue

instance IsSandbox (Keyword "allow-top-navigation-to-custom-protocols") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-downloads") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-presentation") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-orientation-lock") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-modals") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-popups-to-escape-sandbox") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-scripts") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-pointer-lock") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-forms") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-same-origin") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-top-navigation-by-user-activation") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-top-navigation") String where
  isSandbox = keywordAttributeValue

instance IsSandbox (Keyword "allow-popups") String where
  isSandbox = keywordAttributeValue

_sandbox
  :: forall r v a. IsSandbox v a => Event v -> Event (Attribute (Indexed (sandbox :: a | r)))
_sandbox = Functor.map $ (unsafeAttribute <<< { key: "sandbox", value: _ } <<< isSandbox)

_sandbox_ :: forall r v a. IsSandbox v a => v -> Event (Attribute (Indexed (sandbox :: a | r)))
_sandbox_ = _sandbox <<< Applicative.pure

_role :: forall r. Event String -> Event (Attribute (Indexed (role :: String | r)))
_role = Functor.map $ (unsafeAttribute <<< { key: "role", value: _ } <<< prop')

_role_ :: forall r. String -> Event (Attribute (Indexed (role :: String | r)))
_role_ = _role <<< Applicative.pure

_ariaAtomic :: forall r. Event String -> Event (Attribute (Indexed (ariaAtomic :: String | r)))
_ariaAtomic = Functor.map $ (unsafeAttribute <<< { key: "ariaAtomic", value: _ } <<< prop')

_ariaAtomic_ :: forall r. String -> Event (Attribute (Indexed (ariaAtomic :: String | r)))
_ariaAtomic_ = _ariaAtomic <<< Applicative.pure

_ariaAutoComplete
  :: forall r. Event String -> Event (Attribute (Indexed (ariaAutoComplete :: String | r)))
_ariaAutoComplete = Functor.map $
  (unsafeAttribute <<< { key: "ariaAutoComplete", value: _ } <<< prop')

_ariaAutoComplete_
  :: forall r. String -> Event (Attribute (Indexed (ariaAutoComplete :: String | r)))
_ariaAutoComplete_ = _ariaAutoComplete <<< Applicative.pure

_ariaBusy :: forall r. Event String -> Event (Attribute (Indexed (ariaBusy :: String | r)))
_ariaBusy = Functor.map $ (unsafeAttribute <<< { key: "ariaBusy", value: _ } <<< prop')

_ariaBusy_ :: forall r. String -> Event (Attribute (Indexed (ariaBusy :: String | r)))
_ariaBusy_ = _ariaBusy <<< Applicative.pure

_ariaChecked :: forall r. Event String -> Event (Attribute (Indexed (ariaChecked :: String | r)))
_ariaChecked = Functor.map $ (unsafeAttribute <<< { key: "ariaChecked", value: _ } <<< prop')

_ariaChecked_ :: forall r. String -> Event (Attribute (Indexed (ariaChecked :: String | r)))
_ariaChecked_ = _ariaChecked <<< Applicative.pure

_ariaColCount :: forall r. Event String -> Event (Attribute (Indexed (ariaColCount :: String | r)))
_ariaColCount = Functor.map $ (unsafeAttribute <<< { key: "ariaColCount", value: _ } <<< prop')

_ariaColCount_ :: forall r. String -> Event (Attribute (Indexed (ariaColCount :: String | r)))
_ariaColCount_ = _ariaColCount <<< Applicative.pure

_ariaColIndex :: forall r. Event String -> Event (Attribute (Indexed (ariaColIndex :: String | r)))
_ariaColIndex = Functor.map $ (unsafeAttribute <<< { key: "ariaColIndex", value: _ } <<< prop')

_ariaColIndex_ :: forall r. String -> Event (Attribute (Indexed (ariaColIndex :: String | r)))
_ariaColIndex_ = _ariaColIndex <<< Applicative.pure

_ariaColIndexText
  :: forall r. Event String -> Event (Attribute (Indexed (ariaColIndexText :: String | r)))
_ariaColIndexText = Functor.map $
  (unsafeAttribute <<< { key: "ariaColIndexText", value: _ } <<< prop')

_ariaColIndexText_
  :: forall r. String -> Event (Attribute (Indexed (ariaColIndexText :: String | r)))
_ariaColIndexText_ = _ariaColIndexText <<< Applicative.pure

_ariaColSpan :: forall r. Event String -> Event (Attribute (Indexed (ariaColSpan :: String | r)))
_ariaColSpan = Functor.map $ (unsafeAttribute <<< { key: "ariaColSpan", value: _ } <<< prop')

_ariaColSpan_ :: forall r. String -> Event (Attribute (Indexed (ariaColSpan :: String | r)))
_ariaColSpan_ = _ariaColSpan <<< Applicative.pure

_ariaCurrent :: forall r. Event String -> Event (Attribute (Indexed (ariaCurrent :: String | r)))
_ariaCurrent = Functor.map $ (unsafeAttribute <<< { key: "ariaCurrent", value: _ } <<< prop')

_ariaCurrent_ :: forall r. String -> Event (Attribute (Indexed (ariaCurrent :: String | r)))
_ariaCurrent_ = _ariaCurrent <<< Applicative.pure

_ariaDescription
  :: forall r. Event String -> Event (Attribute (Indexed (ariaDescription :: String | r)))
_ariaDescription = Functor.map $
  (unsafeAttribute <<< { key: "ariaDescription", value: _ } <<< prop')

_ariaDescription_
  :: forall r. String -> Event (Attribute (Indexed (ariaDescription :: String | r)))
_ariaDescription_ = _ariaDescription <<< Applicative.pure

_ariaDisabled :: forall r. Event String -> Event (Attribute (Indexed (ariaDisabled :: String | r)))
_ariaDisabled = Functor.map $ (unsafeAttribute <<< { key: "ariaDisabled", value: _ } <<< prop')

_ariaDisabled_ :: forall r. String -> Event (Attribute (Indexed (ariaDisabled :: String | r)))
_ariaDisabled_ = _ariaDisabled <<< Applicative.pure

_ariaExpanded :: forall r. Event String -> Event (Attribute (Indexed (ariaExpanded :: String | r)))
_ariaExpanded = Functor.map $ (unsafeAttribute <<< { key: "ariaExpanded", value: _ } <<< prop')

_ariaExpanded_ :: forall r. String -> Event (Attribute (Indexed (ariaExpanded :: String | r)))
_ariaExpanded_ = _ariaExpanded <<< Applicative.pure

_ariaHasPopup :: forall r. Event String -> Event (Attribute (Indexed (ariaHasPopup :: String | r)))
_ariaHasPopup = Functor.map $ (unsafeAttribute <<< { key: "ariaHasPopup", value: _ } <<< prop')

_ariaHasPopup_ :: forall r. String -> Event (Attribute (Indexed (ariaHasPopup :: String | r)))
_ariaHasPopup_ = _ariaHasPopup <<< Applicative.pure

_ariaHidden :: forall r. Event String -> Event (Attribute (Indexed (ariaHidden :: String | r)))
_ariaHidden = Functor.map $ (unsafeAttribute <<< { key: "ariaHidden", value: _ } <<< prop')

_ariaHidden_ :: forall r. String -> Event (Attribute (Indexed (ariaHidden :: String | r)))
_ariaHidden_ = _ariaHidden <<< Applicative.pure

_ariaInvalid :: forall r. Event String -> Event (Attribute (Indexed (ariaInvalid :: String | r)))
_ariaInvalid = Functor.map $ (unsafeAttribute <<< { key: "ariaInvalid", value: _ } <<< prop')

_ariaInvalid_ :: forall r. String -> Event (Attribute (Indexed (ariaInvalid :: String | r)))
_ariaInvalid_ = _ariaInvalid <<< Applicative.pure

_ariaKeyShortcuts
  :: forall r. Event String -> Event (Attribute (Indexed (ariaKeyShortcuts :: String | r)))
_ariaKeyShortcuts = Functor.map $
  (unsafeAttribute <<< { key: "ariaKeyShortcuts", value: _ } <<< prop')

_ariaKeyShortcuts_
  :: forall r. String -> Event (Attribute (Indexed (ariaKeyShortcuts :: String | r)))
_ariaKeyShortcuts_ = _ariaKeyShortcuts <<< Applicative.pure

_ariaLabel :: forall r. Event String -> Event (Attribute (Indexed (ariaLabel :: String | r)))
_ariaLabel = Functor.map $ (unsafeAttribute <<< { key: "ariaLabel", value: _ } <<< prop')

_ariaLabel_ :: forall r. String -> Event (Attribute (Indexed (ariaLabel :: String | r)))
_ariaLabel_ = _ariaLabel <<< Applicative.pure

_ariaLevel :: forall r. Event String -> Event (Attribute (Indexed (ariaLevel :: String | r)))
_ariaLevel = Functor.map $ (unsafeAttribute <<< { key: "ariaLevel", value: _ } <<< prop')

_ariaLevel_ :: forall r. String -> Event (Attribute (Indexed (ariaLevel :: String | r)))
_ariaLevel_ = _ariaLevel <<< Applicative.pure

_ariaLive :: forall r. Event String -> Event (Attribute (Indexed (ariaLive :: String | r)))
_ariaLive = Functor.map $ (unsafeAttribute <<< { key: "ariaLive", value: _ } <<< prop')

_ariaLive_ :: forall r. String -> Event (Attribute (Indexed (ariaLive :: String | r)))
_ariaLive_ = _ariaLive <<< Applicative.pure

_ariaModal :: forall r. Event String -> Event (Attribute (Indexed (ariaModal :: String | r)))
_ariaModal = Functor.map $ (unsafeAttribute <<< { key: "ariaModal", value: _ } <<< prop')

_ariaModal_ :: forall r. String -> Event (Attribute (Indexed (ariaModal :: String | r)))
_ariaModal_ = _ariaModal <<< Applicative.pure

_ariaMultiLine
  :: forall r. Event String -> Event (Attribute (Indexed (ariaMultiLine :: String | r)))
_ariaMultiLine = Functor.map $ (unsafeAttribute <<< { key: "ariaMultiLine", value: _ } <<< prop')

_ariaMultiLine_ :: forall r. String -> Event (Attribute (Indexed (ariaMultiLine :: String | r)))
_ariaMultiLine_ = _ariaMultiLine <<< Applicative.pure

_ariaMultiSelectable
  :: forall r. Event String -> Event (Attribute (Indexed (ariaMultiSelectable :: String | r)))
_ariaMultiSelectable = Functor.map $
  (unsafeAttribute <<< { key: "ariaMultiSelectable", value: _ } <<< prop')

_ariaMultiSelectable_
  :: forall r. String -> Event (Attribute (Indexed (ariaMultiSelectable :: String | r)))
_ariaMultiSelectable_ = _ariaMultiSelectable <<< Applicative.pure

_ariaOrientation
  :: forall r. Event String -> Event (Attribute (Indexed (ariaOrientation :: String | r)))
_ariaOrientation = Functor.map $
  (unsafeAttribute <<< { key: "ariaOrientation", value: _ } <<< prop')

_ariaOrientation_
  :: forall r. String -> Event (Attribute (Indexed (ariaOrientation :: String | r)))
_ariaOrientation_ = _ariaOrientation <<< Applicative.pure

_ariaPlaceholder
  :: forall r. Event String -> Event (Attribute (Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder = Functor.map $
  (unsafeAttribute <<< { key: "ariaPlaceholder", value: _ } <<< prop')

_ariaPlaceholder_
  :: forall r. String -> Event (Attribute (Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder_ = _ariaPlaceholder <<< Applicative.pure

_ariaPosInSet :: forall r. Event String -> Event (Attribute (Indexed (ariaPosInSet :: String | r)))
_ariaPosInSet = Functor.map $ (unsafeAttribute <<< { key: "ariaPosInSet", value: _ } <<< prop')

_ariaPosInSet_ :: forall r. String -> Event (Attribute (Indexed (ariaPosInSet :: String | r)))
_ariaPosInSet_ = _ariaPosInSet <<< Applicative.pure

_ariaPressed :: forall r. Event String -> Event (Attribute (Indexed (ariaPressed :: String | r)))
_ariaPressed = Functor.map $ (unsafeAttribute <<< { key: "ariaPressed", value: _ } <<< prop')

_ariaPressed_ :: forall r. String -> Event (Attribute (Indexed (ariaPressed :: String | r)))
_ariaPressed_ = _ariaPressed <<< Applicative.pure

_ariaReadOnly :: forall r. Event String -> Event (Attribute (Indexed (ariaReadOnly :: String | r)))
_ariaReadOnly = Functor.map $ (unsafeAttribute <<< { key: "ariaReadOnly", value: _ } <<< prop')

_ariaReadOnly_ :: forall r. String -> Event (Attribute (Indexed (ariaReadOnly :: String | r)))
_ariaReadOnly_ = _ariaReadOnly <<< Applicative.pure

_ariaRequired :: forall r. Event String -> Event (Attribute (Indexed (ariaRequired :: String | r)))
_ariaRequired = Functor.map $ (unsafeAttribute <<< { key: "ariaRequired", value: _ } <<< prop')

_ariaRequired_ :: forall r. String -> Event (Attribute (Indexed (ariaRequired :: String | r)))
_ariaRequired_ = _ariaRequired <<< Applicative.pure

_ariaRoleDescription
  :: forall r. Event String -> Event (Attribute (Indexed (ariaRoleDescription :: String | r)))
_ariaRoleDescription = Functor.map $
  (unsafeAttribute <<< { key: "ariaRoleDescription", value: _ } <<< prop')

_ariaRoleDescription_
  :: forall r. String -> Event (Attribute (Indexed (ariaRoleDescription :: String | r)))
_ariaRoleDescription_ = _ariaRoleDescription <<< Applicative.pure

_ariaRowCount :: forall r. Event String -> Event (Attribute (Indexed (ariaRowCount :: String | r)))
_ariaRowCount = Functor.map $ (unsafeAttribute <<< { key: "ariaRowCount", value: _ } <<< prop')

_ariaRowCount_ :: forall r. String -> Event (Attribute (Indexed (ariaRowCount :: String | r)))
_ariaRowCount_ = _ariaRowCount <<< Applicative.pure

_ariaRowIndex :: forall r. Event String -> Event (Attribute (Indexed (ariaRowIndex :: String | r)))
_ariaRowIndex = Functor.map $ (unsafeAttribute <<< { key: "ariaRowIndex", value: _ } <<< prop')

_ariaRowIndex_ :: forall r. String -> Event (Attribute (Indexed (ariaRowIndex :: String | r)))
_ariaRowIndex_ = _ariaRowIndex <<< Applicative.pure

_ariaRowIndexText
  :: forall r. Event String -> Event (Attribute (Indexed (ariaRowIndexText :: String | r)))
_ariaRowIndexText = Functor.map $
  (unsafeAttribute <<< { key: "ariaRowIndexText", value: _ } <<< prop')

_ariaRowIndexText_
  :: forall r. String -> Event (Attribute (Indexed (ariaRowIndexText :: String | r)))
_ariaRowIndexText_ = _ariaRowIndexText <<< Applicative.pure

_ariaRowSpan :: forall r. Event String -> Event (Attribute (Indexed (ariaRowSpan :: String | r)))
_ariaRowSpan = Functor.map $ (unsafeAttribute <<< { key: "ariaRowSpan", value: _ } <<< prop')

_ariaRowSpan_ :: forall r. String -> Event (Attribute (Indexed (ariaRowSpan :: String | r)))
_ariaRowSpan_ = _ariaRowSpan <<< Applicative.pure

_ariaSelected :: forall r. Event String -> Event (Attribute (Indexed (ariaSelected :: String | r)))
_ariaSelected = Functor.map $ (unsafeAttribute <<< { key: "ariaSelected", value: _ } <<< prop')

_ariaSelected_ :: forall r. String -> Event (Attribute (Indexed (ariaSelected :: String | r)))
_ariaSelected_ = _ariaSelected <<< Applicative.pure

_ariaSetSize :: forall r. Event String -> Event (Attribute (Indexed (ariaSetSize :: String | r)))
_ariaSetSize = Functor.map $ (unsafeAttribute <<< { key: "ariaSetSize", value: _ } <<< prop')

_ariaSetSize_ :: forall r. String -> Event (Attribute (Indexed (ariaSetSize :: String | r)))
_ariaSetSize_ = _ariaSetSize <<< Applicative.pure

_ariaSort :: forall r. Event String -> Event (Attribute (Indexed (ariaSort :: String | r)))
_ariaSort = Functor.map $ (unsafeAttribute <<< { key: "ariaSort", value: _ } <<< prop')

_ariaSort_ :: forall r. String -> Event (Attribute (Indexed (ariaSort :: String | r)))
_ariaSort_ = _ariaSort <<< Applicative.pure

_ariaValueMax :: forall r. Event String -> Event (Attribute (Indexed (ariaValueMax :: String | r)))
_ariaValueMax = Functor.map $ (unsafeAttribute <<< { key: "ariaValueMax", value: _ } <<< prop')

_ariaValueMax_ :: forall r. String -> Event (Attribute (Indexed (ariaValueMax :: String | r)))
_ariaValueMax_ = _ariaValueMax <<< Applicative.pure

_ariaValueMin :: forall r. Event String -> Event (Attribute (Indexed (ariaValueMin :: String | r)))
_ariaValueMin = Functor.map $ (unsafeAttribute <<< { key: "ariaValueMin", value: _ } <<< prop')

_ariaValueMin_ :: forall r. String -> Event (Attribute (Indexed (ariaValueMin :: String | r)))
_ariaValueMin_ = _ariaValueMin <<< Applicative.pure

_ariaValueNow :: forall r. Event String -> Event (Attribute (Indexed (ariaValueNow :: String | r)))
_ariaValueNow = Functor.map $ (unsafeAttribute <<< { key: "ariaValueNow", value: _ } <<< prop')

_ariaValueNow_ :: forall r. String -> Event (Attribute (Indexed (ariaValueNow :: String | r)))
_ariaValueNow_ = _ariaValueNow <<< Applicative.pure

_ariaValueText
  :: forall r. Event String -> Event (Attribute (Indexed (ariaValueText :: String | r)))
_ariaValueText = Functor.map $ (unsafeAttribute <<< { key: "ariaValueText", value: _ } <<< prop')

_ariaValueText_ :: forall r. String -> Event (Attribute (Indexed (ariaValueText :: String | r)))
_ariaValueText_ = _ariaValueText <<< Applicative.pure

_contentEditable
  :: forall r. Event String -> Event (Attribute (Indexed (contentEditable :: String | r)))
_contentEditable = Functor.map $
  (unsafeAttribute <<< { key: "contentEditable", value: _ } <<< prop')

_contentEditable_
  :: forall r. String -> Event (Attribute (Indexed (contentEditable :: String | r)))
_contentEditable_ = _contentEditable <<< Applicative.pure

_enterKeyHint :: forall r. Event String -> Event (Attribute (Indexed (enterKeyHint :: String | r)))
_enterKeyHint = Functor.map $ (unsafeAttribute <<< { key: "enterKeyHint", value: _ } <<< prop')

_enterKeyHint_ :: forall r. String -> Event (Attribute (Indexed (enterKeyHint :: String | r)))
_enterKeyHint_ = _enterKeyHint <<< Applicative.pure

_inputMode :: forall r. Event String -> Event (Attribute (Indexed (inputMode :: String | r)))
_inputMode = Functor.map $ (unsafeAttribute <<< { key: "inputMode", value: _ } <<< prop')

_inputMode_ :: forall r. String -> Event (Attribute (Indexed (inputMode :: String | r)))
_inputMode_ = _inputMode <<< Applicative.pure

_onabort :: forall r. Event Cb -> Event (Attribute (Indexed (onabort :: Cb | r)))
_onabort = Functor.map $ (unsafeAttribute <<< { key: "onabort", value: _ } <<< cb')

_onabort_ :: forall r. Cb -> Event (Attribute (Indexed (onabort :: Cb | r)))
_onabort_ = _onabort <<< Applicative.pure

_onauxclick :: forall r. Event Cb -> Event (Attribute (Indexed (onauxclick :: Cb | r)))
_onauxclick = Functor.map $ (unsafeAttribute <<< { key: "onauxclick", value: _ } <<< cb')

_onauxclick_ :: forall r. Cb -> Event (Attribute (Indexed (onauxclick :: Cb | r)))
_onauxclick_ = _onauxclick <<< Applicative.pure

_onbeforeinput :: forall r. Event Cb -> Event (Attribute (Indexed (onbeforeinput :: Cb | r)))
_onbeforeinput = Functor.map $ (unsafeAttribute <<< { key: "onbeforeinput", value: _ } <<< cb')

_onbeforeinput_ :: forall r. Cb -> Event (Attribute (Indexed (onbeforeinput :: Cb | r)))
_onbeforeinput_ = _onbeforeinput <<< Applicative.pure

_onbeforematch :: forall r. Event Cb -> Event (Attribute (Indexed (onbeforematch :: Cb | r)))
_onbeforematch = Functor.map $ (unsafeAttribute <<< { key: "onbeforematch", value: _ } <<< cb')

_onbeforematch_ :: forall r. Cb -> Event (Attribute (Indexed (onbeforematch :: Cb | r)))
_onbeforematch_ = _onbeforematch <<< Applicative.pure

_onbeforetoggle :: forall r. Event Cb -> Event (Attribute (Indexed (onbeforetoggle :: Cb | r)))
_onbeforetoggle = Functor.map $ (unsafeAttribute <<< { key: "onbeforetoggle", value: _ } <<< cb')

_onbeforetoggle_ :: forall r. Cb -> Event (Attribute (Indexed (onbeforetoggle :: Cb | r)))
_onbeforetoggle_ = _onbeforetoggle <<< Applicative.pure

_onblur :: forall r. Event Cb -> Event (Attribute (Indexed (onblur :: Cb | r)))
_onblur = Functor.map $ (unsafeAttribute <<< { key: "onblur", value: _ } <<< cb')

_onblur_ :: forall r. Cb -> Event (Attribute (Indexed (onblur :: Cb | r)))
_onblur_ = _onblur <<< Applicative.pure

_oncancel :: forall r. Event Cb -> Event (Attribute (Indexed (oncancel :: Cb | r)))
_oncancel = Functor.map $ (unsafeAttribute <<< { key: "oncancel", value: _ } <<< cb')

_oncancel_ :: forall r. Cb -> Event (Attribute (Indexed (oncancel :: Cb | r)))
_oncancel_ = _oncancel <<< Applicative.pure

_oncanplay :: forall r. Event Cb -> Event (Attribute (Indexed (oncanplay :: Cb | r)))
_oncanplay = Functor.map $ (unsafeAttribute <<< { key: "oncanplay", value: _ } <<< cb')

_oncanplay_ :: forall r. Cb -> Event (Attribute (Indexed (oncanplay :: Cb | r)))
_oncanplay_ = _oncanplay <<< Applicative.pure

_oncanplaythrough :: forall r. Event Cb -> Event (Attribute (Indexed (oncanplaythrough :: Cb | r)))
_oncanplaythrough = Functor.map $
  (unsafeAttribute <<< { key: "oncanplaythrough", value: _ } <<< cb')

_oncanplaythrough_ :: forall r. Cb -> Event (Attribute (Indexed (oncanplaythrough :: Cb | r)))
_oncanplaythrough_ = _oncanplaythrough <<< Applicative.pure

_onchange :: forall r. Event Cb -> Event (Attribute (Indexed (onchange :: Cb | r)))
_onchange = Functor.map $ (unsafeAttribute <<< { key: "onchange", value: _ } <<< cb')

_onchange_ :: forall r. Cb -> Event (Attribute (Indexed (onchange :: Cb | r)))
_onchange_ = _onchange <<< Applicative.pure

_onclick :: forall r. Event Cb -> Event (Attribute (Indexed (onclick :: Cb | r)))
_onclick = Functor.map $ (unsafeAttribute <<< { key: "onclick", value: _ } <<< cb')

_onclick_ :: forall r. Cb -> Event (Attribute (Indexed (onclick :: Cb | r)))
_onclick_ = _onclick <<< Applicative.pure

_onclose :: forall r. Event Cb -> Event (Attribute (Indexed (onclose :: Cb | r)))
_onclose = Functor.map $ (unsafeAttribute <<< { key: "onclose", value: _ } <<< cb')

_onclose_ :: forall r. Cb -> Event (Attribute (Indexed (onclose :: Cb | r)))
_onclose_ = _onclose <<< Applicative.pure

_oncontextlost :: forall r. Event Cb -> Event (Attribute (Indexed (oncontextlost :: Cb | r)))
_oncontextlost = Functor.map $ (unsafeAttribute <<< { key: "oncontextlost", value: _ } <<< cb')

_oncontextlost_ :: forall r. Cb -> Event (Attribute (Indexed (oncontextlost :: Cb | r)))
_oncontextlost_ = _oncontextlost <<< Applicative.pure

_oncontextmenu :: forall r. Event Cb -> Event (Attribute (Indexed (oncontextmenu :: Cb | r)))
_oncontextmenu = Functor.map $ (unsafeAttribute <<< { key: "oncontextmenu", value: _ } <<< cb')

_oncontextmenu_ :: forall r. Cb -> Event (Attribute (Indexed (oncontextmenu :: Cb | r)))
_oncontextmenu_ = _oncontextmenu <<< Applicative.pure

_oncontextrestored
  :: forall r. Event Cb -> Event (Attribute (Indexed (oncontextrestored :: Cb | r)))
_oncontextrestored = Functor.map $
  (unsafeAttribute <<< { key: "oncontextrestored", value: _ } <<< cb')

_oncontextrestored_ :: forall r. Cb -> Event (Attribute (Indexed (oncontextrestored :: Cb | r)))
_oncontextrestored_ = _oncontextrestored <<< Applicative.pure

_oncopy :: forall r. Event Cb -> Event (Attribute (Indexed (oncopy :: Cb | r)))
_oncopy = Functor.map $ (unsafeAttribute <<< { key: "oncopy", value: _ } <<< cb')

_oncopy_ :: forall r. Cb -> Event (Attribute (Indexed (oncopy :: Cb | r)))
_oncopy_ = _oncopy <<< Applicative.pure

_oncuechange :: forall r. Event Cb -> Event (Attribute (Indexed (oncuechange :: Cb | r)))
_oncuechange = Functor.map $ (unsafeAttribute <<< { key: "oncuechange", value: _ } <<< cb')

_oncuechange_ :: forall r. Cb -> Event (Attribute (Indexed (oncuechange :: Cb | r)))
_oncuechange_ = _oncuechange <<< Applicative.pure

_oncut :: forall r. Event Cb -> Event (Attribute (Indexed (oncut :: Cb | r)))
_oncut = Functor.map $ (unsafeAttribute <<< { key: "oncut", value: _ } <<< cb')

_oncut_ :: forall r. Cb -> Event (Attribute (Indexed (oncut :: Cb | r)))
_oncut_ = _oncut <<< Applicative.pure

_ondblclick :: forall r. Event Cb -> Event (Attribute (Indexed (ondblclick :: Cb | r)))
_ondblclick = Functor.map $ (unsafeAttribute <<< { key: "ondblclick", value: _ } <<< cb')

_ondblclick_ :: forall r. Cb -> Event (Attribute (Indexed (ondblclick :: Cb | r)))
_ondblclick_ = _ondblclick <<< Applicative.pure

_ondrag :: forall r. Event Cb -> Event (Attribute (Indexed (ondrag :: Cb | r)))
_ondrag = Functor.map $ (unsafeAttribute <<< { key: "ondrag", value: _ } <<< cb')

_ondrag_ :: forall r. Cb -> Event (Attribute (Indexed (ondrag :: Cb | r)))
_ondrag_ = _ondrag <<< Applicative.pure

_ondragend :: forall r. Event Cb -> Event (Attribute (Indexed (ondragend :: Cb | r)))
_ondragend = Functor.map $ (unsafeAttribute <<< { key: "ondragend", value: _ } <<< cb')

_ondragend_ :: forall r. Cb -> Event (Attribute (Indexed (ondragend :: Cb | r)))
_ondragend_ = _ondragend <<< Applicative.pure

_ondragenter :: forall r. Event Cb -> Event (Attribute (Indexed (ondragenter :: Cb | r)))
_ondragenter = Functor.map $ (unsafeAttribute <<< { key: "ondragenter", value: _ } <<< cb')

_ondragenter_ :: forall r. Cb -> Event (Attribute (Indexed (ondragenter :: Cb | r)))
_ondragenter_ = _ondragenter <<< Applicative.pure

_ondragleave :: forall r. Event Cb -> Event (Attribute (Indexed (ondragleave :: Cb | r)))
_ondragleave = Functor.map $ (unsafeAttribute <<< { key: "ondragleave", value: _ } <<< cb')

_ondragleave_ :: forall r. Cb -> Event (Attribute (Indexed (ondragleave :: Cb | r)))
_ondragleave_ = _ondragleave <<< Applicative.pure

_ondragover :: forall r. Event Cb -> Event (Attribute (Indexed (ondragover :: Cb | r)))
_ondragover = Functor.map $ (unsafeAttribute <<< { key: "ondragover", value: _ } <<< cb')

_ondragover_ :: forall r. Cb -> Event (Attribute (Indexed (ondragover :: Cb | r)))
_ondragover_ = _ondragover <<< Applicative.pure

_ondragstart :: forall r. Event Cb -> Event (Attribute (Indexed (ondragstart :: Cb | r)))
_ondragstart = Functor.map $ (unsafeAttribute <<< { key: "ondragstart", value: _ } <<< cb')

_ondragstart_ :: forall r. Cb -> Event (Attribute (Indexed (ondragstart :: Cb | r)))
_ondragstart_ = _ondragstart <<< Applicative.pure

_ondrop :: forall r. Event Cb -> Event (Attribute (Indexed (ondrop :: Cb | r)))
_ondrop = Functor.map $ (unsafeAttribute <<< { key: "ondrop", value: _ } <<< cb')

_ondrop_ :: forall r. Cb -> Event (Attribute (Indexed (ondrop :: Cb | r)))
_ondrop_ = _ondrop <<< Applicative.pure

_ondurationchange :: forall r. Event Cb -> Event (Attribute (Indexed (ondurationchange :: Cb | r)))
_ondurationchange = Functor.map $
  (unsafeAttribute <<< { key: "ondurationchange", value: _ } <<< cb')

_ondurationchange_ :: forall r. Cb -> Event (Attribute (Indexed (ondurationchange :: Cb | r)))
_ondurationchange_ = _ondurationchange <<< Applicative.pure

_onemptied :: forall r. Event Cb -> Event (Attribute (Indexed (onemptied :: Cb | r)))
_onemptied = Functor.map $ (unsafeAttribute <<< { key: "onemptied", value: _ } <<< cb')

_onemptied_ :: forall r. Cb -> Event (Attribute (Indexed (onemptied :: Cb | r)))
_onemptied_ = _onemptied <<< Applicative.pure

_onended :: forall r. Event Cb -> Event (Attribute (Indexed (onended :: Cb | r)))
_onended = Functor.map $ (unsafeAttribute <<< { key: "onended", value: _ } <<< cb')

_onended_ :: forall r. Cb -> Event (Attribute (Indexed (onended :: Cb | r)))
_onended_ = _onended <<< Applicative.pure

_onfocus :: forall r. Event Cb -> Event (Attribute (Indexed (onfocus :: Cb | r)))
_onfocus = Functor.map $ (unsafeAttribute <<< { key: "onfocus", value: _ } <<< cb')

_onfocus_ :: forall r. Cb -> Event (Attribute (Indexed (onfocus :: Cb | r)))
_onfocus_ = _onfocus <<< Applicative.pure

_onformdata :: forall r. Event Cb -> Event (Attribute (Indexed (onformdata :: Cb | r)))
_onformdata = Functor.map $ (unsafeAttribute <<< { key: "onformdata", value: _ } <<< cb')

_onformdata_ :: forall r. Cb -> Event (Attribute (Indexed (onformdata :: Cb | r)))
_onformdata_ = _onformdata <<< Applicative.pure

_oninput :: forall r. Event Cb -> Event (Attribute (Indexed (oninput :: Cb | r)))
_oninput = Functor.map $ (unsafeAttribute <<< { key: "oninput", value: _ } <<< cb')

_oninput_ :: forall r. Cb -> Event (Attribute (Indexed (oninput :: Cb | r)))
_oninput_ = _oninput <<< Applicative.pure

_oninvalid :: forall r. Event Cb -> Event (Attribute (Indexed (oninvalid :: Cb | r)))
_oninvalid = Functor.map $ (unsafeAttribute <<< { key: "oninvalid", value: _ } <<< cb')

_oninvalid_ :: forall r. Cb -> Event (Attribute (Indexed (oninvalid :: Cb | r)))
_oninvalid_ = _oninvalid <<< Applicative.pure

_onkeydown :: forall r. Event Cb -> Event (Attribute (Indexed (onkeydown :: Cb | r)))
_onkeydown = Functor.map $ (unsafeAttribute <<< { key: "onkeydown", value: _ } <<< cb')

_onkeydown_ :: forall r. Cb -> Event (Attribute (Indexed (onkeydown :: Cb | r)))
_onkeydown_ = _onkeydown <<< Applicative.pure

_onkeypress :: forall r. Event Cb -> Event (Attribute (Indexed (onkeypress :: Cb | r)))
_onkeypress = Functor.map $ (unsafeAttribute <<< { key: "onkeypress", value: _ } <<< cb')

_onkeypress_ :: forall r. Cb -> Event (Attribute (Indexed (onkeypress :: Cb | r)))
_onkeypress_ = _onkeypress <<< Applicative.pure

_onkeyup :: forall r. Event Cb -> Event (Attribute (Indexed (onkeyup :: Cb | r)))
_onkeyup = Functor.map $ (unsafeAttribute <<< { key: "onkeyup", value: _ } <<< cb')

_onkeyup_ :: forall r. Cb -> Event (Attribute (Indexed (onkeyup :: Cb | r)))
_onkeyup_ = _onkeyup <<< Applicative.pure

_onload :: forall r. Event Cb -> Event (Attribute (Indexed (onload :: Cb | r)))
_onload = Functor.map $ (unsafeAttribute <<< { key: "onload", value: _ } <<< cb')

_onload_ :: forall r. Cb -> Event (Attribute (Indexed (onload :: Cb | r)))
_onload_ = _onload <<< Applicative.pure

_onloadeddata :: forall r. Event Cb -> Event (Attribute (Indexed (onloadeddata :: Cb | r)))
_onloadeddata = Functor.map $ (unsafeAttribute <<< { key: "onloadeddata", value: _ } <<< cb')

_onloadeddata_ :: forall r. Cb -> Event (Attribute (Indexed (onloadeddata :: Cb | r)))
_onloadeddata_ = _onloadeddata <<< Applicative.pure

_onloadedmetadata :: forall r. Event Cb -> Event (Attribute (Indexed (onloadedmetadata :: Cb | r)))
_onloadedmetadata = Functor.map $
  (unsafeAttribute <<< { key: "onloadedmetadata", value: _ } <<< cb')

_onloadedmetadata_ :: forall r. Cb -> Event (Attribute (Indexed (onloadedmetadata :: Cb | r)))
_onloadedmetadata_ = _onloadedmetadata <<< Applicative.pure

_onloadstart :: forall r. Event Cb -> Event (Attribute (Indexed (onloadstart :: Cb | r)))
_onloadstart = Functor.map $ (unsafeAttribute <<< { key: "onloadstart", value: _ } <<< cb')

_onloadstart_ :: forall r. Cb -> Event (Attribute (Indexed (onloadstart :: Cb | r)))
_onloadstart_ = _onloadstart <<< Applicative.pure

_onmousedown :: forall r. Event Cb -> Event (Attribute (Indexed (onmousedown :: Cb | r)))
_onmousedown = Functor.map $ (unsafeAttribute <<< { key: "onmousedown", value: _ } <<< cb')

_onmousedown_ :: forall r. Cb -> Event (Attribute (Indexed (onmousedown :: Cb | r)))
_onmousedown_ = _onmousedown <<< Applicative.pure

_onmouseenter :: forall r. Event Cb -> Event (Attribute (Indexed (onmouseenter :: Cb | r)))
_onmouseenter = Functor.map $ (unsafeAttribute <<< { key: "onmouseenter", value: _ } <<< cb')

_onmouseenter_ :: forall r. Cb -> Event (Attribute (Indexed (onmouseenter :: Cb | r)))
_onmouseenter_ = _onmouseenter <<< Applicative.pure

_onmouseleave :: forall r. Event Cb -> Event (Attribute (Indexed (onmouseleave :: Cb | r)))
_onmouseleave = Functor.map $ (unsafeAttribute <<< { key: "onmouseleave", value: _ } <<< cb')

_onmouseleave_ :: forall r. Cb -> Event (Attribute (Indexed (onmouseleave :: Cb | r)))
_onmouseleave_ = _onmouseleave <<< Applicative.pure

_onmousemove :: forall r. Event Cb -> Event (Attribute (Indexed (onmousemove :: Cb | r)))
_onmousemove = Functor.map $ (unsafeAttribute <<< { key: "onmousemove", value: _ } <<< cb')

_onmousemove_ :: forall r. Cb -> Event (Attribute (Indexed (onmousemove :: Cb | r)))
_onmousemove_ = _onmousemove <<< Applicative.pure

_onmouseout :: forall r. Event Cb -> Event (Attribute (Indexed (onmouseout :: Cb | r)))
_onmouseout = Functor.map $ (unsafeAttribute <<< { key: "onmouseout", value: _ } <<< cb')

_onmouseout_ :: forall r. Cb -> Event (Attribute (Indexed (onmouseout :: Cb | r)))
_onmouseout_ = _onmouseout <<< Applicative.pure

_onmouseover :: forall r. Event Cb -> Event (Attribute (Indexed (onmouseover :: Cb | r)))
_onmouseover = Functor.map $ (unsafeAttribute <<< { key: "onmouseover", value: _ } <<< cb')

_onmouseover_ :: forall r. Cb -> Event (Attribute (Indexed (onmouseover :: Cb | r)))
_onmouseover_ = _onmouseover <<< Applicative.pure

_onmouseup :: forall r. Event Cb -> Event (Attribute (Indexed (onmouseup :: Cb | r)))
_onmouseup = Functor.map $ (unsafeAttribute <<< { key: "onmouseup", value: _ } <<< cb')

_onmouseup_ :: forall r. Cb -> Event (Attribute (Indexed (onmouseup :: Cb | r)))
_onmouseup_ = _onmouseup <<< Applicative.pure

_onpaste :: forall r. Event Cb -> Event (Attribute (Indexed (onpaste :: Cb | r)))
_onpaste = Functor.map $ (unsafeAttribute <<< { key: "onpaste", value: _ } <<< cb')

_onpaste_ :: forall r. Cb -> Event (Attribute (Indexed (onpaste :: Cb | r)))
_onpaste_ = _onpaste <<< Applicative.pure

_onpause :: forall r. Event Cb -> Event (Attribute (Indexed (onpause :: Cb | r)))
_onpause = Functor.map $ (unsafeAttribute <<< { key: "onpause", value: _ } <<< cb')

_onpause_ :: forall r. Cb -> Event (Attribute (Indexed (onpause :: Cb | r)))
_onpause_ = _onpause <<< Applicative.pure

_onplay :: forall r. Event Cb -> Event (Attribute (Indexed (onplay :: Cb | r)))
_onplay = Functor.map $ (unsafeAttribute <<< { key: "onplay", value: _ } <<< cb')

_onplay_ :: forall r. Cb -> Event (Attribute (Indexed (onplay :: Cb | r)))
_onplay_ = _onplay <<< Applicative.pure

_onplaying :: forall r. Event Cb -> Event (Attribute (Indexed (onplaying :: Cb | r)))
_onplaying = Functor.map $ (unsafeAttribute <<< { key: "onplaying", value: _ } <<< cb')

_onplaying_ :: forall r. Cb -> Event (Attribute (Indexed (onplaying :: Cb | r)))
_onplaying_ = _onplaying <<< Applicative.pure

_onprogress :: forall r. Event Cb -> Event (Attribute (Indexed (onprogress :: Cb | r)))
_onprogress = Functor.map $ (unsafeAttribute <<< { key: "onprogress", value: _ } <<< cb')

_onprogress_ :: forall r. Cb -> Event (Attribute (Indexed (onprogress :: Cb | r)))
_onprogress_ = _onprogress <<< Applicative.pure

_onratechange :: forall r. Event Cb -> Event (Attribute (Indexed (onratechange :: Cb | r)))
_onratechange = Functor.map $ (unsafeAttribute <<< { key: "onratechange", value: _ } <<< cb')

_onratechange_ :: forall r. Cb -> Event (Attribute (Indexed (onratechange :: Cb | r)))
_onratechange_ = _onratechange <<< Applicative.pure

_onreset :: forall r. Event Cb -> Event (Attribute (Indexed (onreset :: Cb | r)))
_onreset = Functor.map $ (unsafeAttribute <<< { key: "onreset", value: _ } <<< cb')

_onreset_ :: forall r. Cb -> Event (Attribute (Indexed (onreset :: Cb | r)))
_onreset_ = _onreset <<< Applicative.pure

_onresize :: forall r. Event Cb -> Event (Attribute (Indexed (onresize :: Cb | r)))
_onresize = Functor.map $ (unsafeAttribute <<< { key: "onresize", value: _ } <<< cb')

_onresize_ :: forall r. Cb -> Event (Attribute (Indexed (onresize :: Cb | r)))
_onresize_ = _onresize <<< Applicative.pure

_onscroll :: forall r. Event Cb -> Event (Attribute (Indexed (onscroll :: Cb | r)))
_onscroll = Functor.map $ (unsafeAttribute <<< { key: "onscroll", value: _ } <<< cb')

_onscroll_ :: forall r. Cb -> Event (Attribute (Indexed (onscroll :: Cb | r)))
_onscroll_ = _onscroll <<< Applicative.pure

_onscrollend :: forall r. Event Cb -> Event (Attribute (Indexed (onscrollend :: Cb | r)))
_onscrollend = Functor.map $ (unsafeAttribute <<< { key: "onscrollend", value: _ } <<< cb')

_onscrollend_ :: forall r. Cb -> Event (Attribute (Indexed (onscrollend :: Cb | r)))
_onscrollend_ = _onscrollend <<< Applicative.pure

_onsecuritypolicyviolation
  :: forall r. Event Cb -> Event (Attribute (Indexed (onsecuritypolicyviolation :: Cb | r)))
_onsecuritypolicyviolation = Functor.map $
  (unsafeAttribute <<< { key: "onsecuritypolicyviolation", value: _ } <<< cb')

_onsecuritypolicyviolation_
  :: forall r. Cb -> Event (Attribute (Indexed (onsecuritypolicyviolation :: Cb | r)))
_onsecuritypolicyviolation_ = _onsecuritypolicyviolation <<< Applicative.pure

_onseeked :: forall r. Event Cb -> Event (Attribute (Indexed (onseeked :: Cb | r)))
_onseeked = Functor.map $ (unsafeAttribute <<< { key: "onseeked", value: _ } <<< cb')

_onseeked_ :: forall r. Cb -> Event (Attribute (Indexed (onseeked :: Cb | r)))
_onseeked_ = _onseeked <<< Applicative.pure

_onseeking :: forall r. Event Cb -> Event (Attribute (Indexed (onseeking :: Cb | r)))
_onseeking = Functor.map $ (unsafeAttribute <<< { key: "onseeking", value: _ } <<< cb')

_onseeking_ :: forall r. Cb -> Event (Attribute (Indexed (onseeking :: Cb | r)))
_onseeking_ = _onseeking <<< Applicative.pure

_onselect :: forall r. Event Cb -> Event (Attribute (Indexed (onselect :: Cb | r)))
_onselect = Functor.map $ (unsafeAttribute <<< { key: "onselect", value: _ } <<< cb')

_onselect_ :: forall r. Cb -> Event (Attribute (Indexed (onselect :: Cb | r)))
_onselect_ = _onselect <<< Applicative.pure

_onslotchange :: forall r. Event Cb -> Event (Attribute (Indexed (onslotchange :: Cb | r)))
_onslotchange = Functor.map $ (unsafeAttribute <<< { key: "onslotchange", value: _ } <<< cb')

_onslotchange_ :: forall r. Cb -> Event (Attribute (Indexed (onslotchange :: Cb | r)))
_onslotchange_ = _onslotchange <<< Applicative.pure

_onstalled :: forall r. Event Cb -> Event (Attribute (Indexed (onstalled :: Cb | r)))
_onstalled = Functor.map $ (unsafeAttribute <<< { key: "onstalled", value: _ } <<< cb')

_onstalled_ :: forall r. Cb -> Event (Attribute (Indexed (onstalled :: Cb | r)))
_onstalled_ = _onstalled <<< Applicative.pure

_onsubmit :: forall r. Event Cb -> Event (Attribute (Indexed (onsubmit :: Cb | r)))
_onsubmit = Functor.map $ (unsafeAttribute <<< { key: "onsubmit", value: _ } <<< cb')

_onsubmit_ :: forall r. Cb -> Event (Attribute (Indexed (onsubmit :: Cb | r)))
_onsubmit_ = _onsubmit <<< Applicative.pure

_onsuspend :: forall r. Event Cb -> Event (Attribute (Indexed (onsuspend :: Cb | r)))
_onsuspend = Functor.map $ (unsafeAttribute <<< { key: "onsuspend", value: _ } <<< cb')

_onsuspend_ :: forall r. Cb -> Event (Attribute (Indexed (onsuspend :: Cb | r)))
_onsuspend_ = _onsuspend <<< Applicative.pure

_ontimeupdate :: forall r. Event Cb -> Event (Attribute (Indexed (ontimeupdate :: Cb | r)))
_ontimeupdate = Functor.map $ (unsafeAttribute <<< { key: "ontimeupdate", value: _ } <<< cb')

_ontimeupdate_ :: forall r. Cb -> Event (Attribute (Indexed (ontimeupdate :: Cb | r)))
_ontimeupdate_ = _ontimeupdate <<< Applicative.pure

_ontoggle :: forall r. Event Cb -> Event (Attribute (Indexed (ontoggle :: Cb | r)))
_ontoggle = Functor.map $ (unsafeAttribute <<< { key: "ontoggle", value: _ } <<< cb')

_ontoggle_ :: forall r. Cb -> Event (Attribute (Indexed (ontoggle :: Cb | r)))
_ontoggle_ = _ontoggle <<< Applicative.pure

_onvolumechange :: forall r. Event Cb -> Event (Attribute (Indexed (onvolumechange :: Cb | r)))
_onvolumechange = Functor.map $ (unsafeAttribute <<< { key: "onvolumechange", value: _ } <<< cb')

_onvolumechange_ :: forall r. Cb -> Event (Attribute (Indexed (onvolumechange :: Cb | r)))
_onvolumechange_ = _onvolumechange <<< Applicative.pure

_onwaiting :: forall r. Event Cb -> Event (Attribute (Indexed (onwaiting :: Cb | r)))
_onwaiting = Functor.map $ (unsafeAttribute <<< { key: "onwaiting", value: _ } <<< cb')

_onwaiting_ :: forall r. Cb -> Event (Attribute (Indexed (onwaiting :: Cb | r)))
_onwaiting_ = _onwaiting <<< Applicative.pure

_onwebkitanimationend
  :: forall r. Event Cb -> Event (Attribute (Indexed (onwebkitanimationend :: Cb | r)))
_onwebkitanimationend = Functor.map $
  (unsafeAttribute <<< { key: "onwebkitanimationend", value: _ } <<< cb')

_onwebkitanimationend_
  :: forall r. Cb -> Event (Attribute (Indexed (onwebkitanimationend :: Cb | r)))
_onwebkitanimationend_ = _onwebkitanimationend <<< Applicative.pure

_onwebkitanimationiteration
  :: forall r. Event Cb -> Event (Attribute (Indexed (onwebkitanimationiteration :: Cb | r)))
_onwebkitanimationiteration = Functor.map $
  (unsafeAttribute <<< { key: "onwebkitanimationiteration", value: _ } <<< cb')

_onwebkitanimationiteration_
  :: forall r. Cb -> Event (Attribute (Indexed (onwebkitanimationiteration :: Cb | r)))
_onwebkitanimationiteration_ = _onwebkitanimationiteration <<< Applicative.pure

_onwebkitanimationstart
  :: forall r. Event Cb -> Event (Attribute (Indexed (onwebkitanimationstart :: Cb | r)))
_onwebkitanimationstart = Functor.map $
  (unsafeAttribute <<< { key: "onwebkitanimationstart", value: _ } <<< cb')

_onwebkitanimationstart_
  :: forall r. Cb -> Event (Attribute (Indexed (onwebkitanimationstart :: Cb | r)))
_onwebkitanimationstart_ = _onwebkitanimationstart <<< Applicative.pure

_onwebkittransitionend
  :: forall r. Event Cb -> Event (Attribute (Indexed (onwebkittransitionend :: Cb | r)))
_onwebkittransitionend = Functor.map $
  (unsafeAttribute <<< { key: "onwebkittransitionend", value: _ } <<< cb')

_onwebkittransitionend_
  :: forall r. Cb -> Event (Attribute (Indexed (onwebkittransitionend :: Cb | r)))
_onwebkittransitionend_ = _onwebkittransitionend <<< Applicative.pure

_onwheel :: forall r. Event Cb -> Event (Attribute (Indexed (onwheel :: Cb | r)))
_onwheel = Functor.map $ (unsafeAttribute <<< { key: "onwheel", value: _ } <<< cb')

_onwheel_ :: forall r. Cb -> Event (Attribute (Indexed (onwheel :: Cb | r)))
_onwheel_ = _onwheel <<< Applicative.pure

_alt :: forall r. Event String -> Event (Attribute (Indexed (alt :: String | r)))
_alt = Functor.map $ (unsafeAttribute <<< { key: "alt", value: _ } <<< prop')

_alt_ :: forall r. String -> Event (Attribute (Indexed (alt :: String | r)))
_alt_ = _alt <<< Applicative.pure

_coords :: forall r. Event String -> Event (Attribute (Indexed (coords :: String | r)))
_coords = Functor.map $ (unsafeAttribute <<< { key: "coords", value: _ } <<< prop')

_coords_ :: forall r. String -> Event (Attribute (Indexed (coords :: String | r)))
_coords_ = _coords <<< Applicative.pure

_target :: forall r. Event String -> Event (Attribute (Indexed (target :: String | r)))
_target = Functor.map $ (unsafeAttribute <<< { key: "target", value: _ } <<< prop')

_target_ :: forall r. String -> Event (Attribute (Indexed (target :: String | r)))
_target_ = _target <<< Applicative.pure

_download :: forall r. Event String -> Event (Attribute (Indexed (download :: String | r)))
_download = Functor.map $ (unsafeAttribute <<< { key: "download", value: _ } <<< prop')

_download_ :: forall r. String -> Event (Attribute (Indexed (download :: String | r)))
_download_ = _download <<< Applicative.pure

_ping :: forall r. Event String -> Event (Attribute (Indexed (ping :: String | r)))
_ping = Functor.map $ (unsafeAttribute <<< { key: "ping", value: _ } <<< prop')

_ping_ :: forall r. String -> Event (Attribute (Indexed (ping :: String | r)))
_ping_ = _ping <<< Applicative.pure

_referrerPolicy
  :: forall r. Event String -> Event (Attribute (Indexed (referrerPolicy :: String | r)))
_referrerPolicy = Functor.map $ (unsafeAttribute <<< { key: "referrerPolicy", value: _ } <<< prop')

_referrerPolicy_ :: forall r. String -> Event (Attribute (Indexed (referrerPolicy :: String | r)))
_referrerPolicy_ = _referrerPolicy <<< Applicative.pure

_href :: forall r. Event String -> Event (Attribute (Indexed (href :: String | r)))
_href = Functor.map $ (unsafeAttribute <<< { key: "href", value: _ } <<< prop')

_href_ :: forall r. String -> Event (Attribute (Indexed (href :: String | r)))
_href_ = _href <<< Applicative.pure

_disabled :: forall r. Event Boolean -> Event (Attribute (Indexed (disabled :: Boolean | r)))
_disabled = Functor.map $
  (unsafeAttribute <<< { key: "disabled", value: _ } <<< boolAttributeValue)

_disabled_ :: forall r. Boolean -> Event (Attribute (Indexed (disabled :: Boolean | r)))
_disabled_ = _disabled <<< Applicative.pure

_formAction :: forall r. Event String -> Event (Attribute (Indexed (formAction :: String | r)))
_formAction = Functor.map $ (unsafeAttribute <<< { key: "formAction", value: _ } <<< prop')

_formAction_ :: forall r. String -> Event (Attribute (Indexed (formAction :: String | r)))
_formAction_ = _formAction <<< Applicative.pure

_formEnctype :: forall r. Event String -> Event (Attribute (Indexed (formEnctype :: String | r)))
_formEnctype = Functor.map $ (unsafeAttribute <<< { key: "formEnctype", value: _ } <<< prop')

_formEnctype_ :: forall r. String -> Event (Attribute (Indexed (formEnctype :: String | r)))
_formEnctype_ = _formEnctype <<< Applicative.pure

_formMethod :: forall r. Event String -> Event (Attribute (Indexed (formMethod :: String | r)))
_formMethod = Functor.map $ (unsafeAttribute <<< { key: "formMethod", value: _ } <<< prop')

_formMethod_ :: forall r. String -> Event (Attribute (Indexed (formMethod :: String | r)))
_formMethod_ = _formMethod <<< Applicative.pure

_formNoValidate
  :: forall r. Event Boolean -> Event (Attribute (Indexed (formNoValidate :: Boolean | r)))
_formNoValidate = Functor.map $
  (unsafeAttribute <<< { key: "formNoValidate", value: _ } <<< boolAttributeValue)

_formNoValidate_
  :: forall r. Boolean -> Event (Attribute (Indexed (formNoValidate :: Boolean | r)))
_formNoValidate_ = _formNoValidate <<< Applicative.pure

_formTarget :: forall r. Event String -> Event (Attribute (Indexed (formTarget :: String | r)))
_formTarget = Functor.map $ (unsafeAttribute <<< { key: "formTarget", value: _ } <<< prop')

_formTarget_ :: forall r. String -> Event (Attribute (Indexed (formTarget :: String | r)))
_formTarget_ = _formTarget <<< Applicative.pure

class IsValue (v :: Type) (a :: Type) | v -> a where
  isValue :: v -> AttributeValue

instance IsValue String String where
  isValue = prop'

instance IsValue Number Number where
  isValue = numberAttributeValue

instance IsValue Int Int where
  isValue = intAttributeValue

_value :: forall r v a. IsValue v a => Event v -> Event (Attribute (Indexed (value :: a | r)))
_value = Functor.map $ (unsafeAttribute <<< { key: "value", value: _ } <<< isValue)

_value_ :: forall r v a. IsValue v a => v -> Event (Attribute (Indexed (value :: a | r)))
_value_ = _value <<< Applicative.pure

class IsWidth (v :: Type) (a :: Type) | v -> a where
  isWidth :: v -> AttributeValue

instance IsWidth Int Int where
  isWidth = intAttributeValue

instance IsWidth String String where
  isWidth = prop'

_width :: forall r v a. IsWidth v a => Event v -> Event (Attribute (Indexed (width :: a | r)))
_width = Functor.map $ (unsafeAttribute <<< { key: "width", value: _ } <<< isWidth)

_width_ :: forall r v a. IsWidth v a => v -> Event (Attribute (Indexed (width :: a | r)))
_width_ = _width <<< Applicative.pure

class IsHeight (v :: Type) (a :: Type) | v -> a where
  isHeight :: v -> AttributeValue

instance IsHeight Int Int where
  isHeight = intAttributeValue

instance IsHeight String String where
  isHeight = prop'

_height :: forall r v a. IsHeight v a => Event v -> Event (Attribute (Indexed (height :: a | r)))
_height = Functor.map $ (unsafeAttribute <<< { key: "height", value: _ } <<< isHeight)

_height_ :: forall r v a. IsHeight v a => v -> Event (Attribute (Indexed (height :: a | r)))
_height_ = _height <<< Applicative.pure

_open :: forall r. Event Boolean -> Event (Attribute (Indexed (open :: Boolean | r)))
_open = Functor.map $ (unsafeAttribute <<< { key: "open", value: _ } <<< boolAttributeValue)

_open_ :: forall r. Boolean -> Event (Attribute (Indexed (open :: Boolean | r)))
_open_ = _open <<< Applicative.pure

_returnValue :: forall r. Event String -> Event (Attribute (Indexed (returnValue :: String | r)))
_returnValue = Functor.map $ (unsafeAttribute <<< { key: "returnValue", value: _ } <<< prop')

_returnValue_ :: forall r. String -> Event (Attribute (Indexed (returnValue :: String | r)))
_returnValue_ = _returnValue <<< Applicative.pure

_compact :: forall r. Event Boolean -> Event (Attribute (Indexed (compact :: Boolean | r)))
_compact = Functor.map $ (unsafeAttribute <<< { key: "compact", value: _ } <<< boolAttributeValue)

_compact_ :: forall r. Boolean -> Event (Attribute (Indexed (compact :: Boolean | r)))
_compact_ = _compact <<< Applicative.pure

_title :: forall r. Event String -> Event (Attribute (Indexed (title :: String | r)))
_title = Functor.map $ (unsafeAttribute <<< { key: "title", value: _ } <<< prop')

_title_ :: forall r. String -> Event (Attribute (Indexed (title :: String | r)))
_title_ = _title <<< Applicative.pure

_lang :: forall r. Event String -> Event (Attribute (Indexed (lang :: String | r)))
_lang = Functor.map $ (unsafeAttribute <<< { key: "lang", value: _ } <<< prop')

_lang_ :: forall r. String -> Event (Attribute (Indexed (lang :: String | r)))
_lang_ = _lang <<< Applicative.pure

_translate :: forall r. Event Boolean -> Event (Attribute (Indexed (translate :: Boolean | r)))
_translate = Functor.map $
  (unsafeAttribute <<< { key: "translate", value: _ } <<< boolAttributeValue)

_translate_ :: forall r. Boolean -> Event (Attribute (Indexed (translate :: Boolean | r)))
_translate_ = _translate <<< Applicative.pure

_inert :: forall r. Event Boolean -> Event (Attribute (Indexed (inert :: Boolean | r)))
_inert = Functor.map $ (unsafeAttribute <<< { key: "inert", value: _ } <<< boolAttributeValue)

_inert_ :: forall r. Boolean -> Event (Attribute (Indexed (inert :: Boolean | r)))
_inert_ = _inert <<< Applicative.pure

_accessKey :: forall r. Event String -> Event (Attribute (Indexed (accessKey :: String | r)))
_accessKey = Functor.map $ (unsafeAttribute <<< { key: "accessKey", value: _ } <<< prop')

_accessKey_ :: forall r. String -> Event (Attribute (Indexed (accessKey :: String | r)))
_accessKey_ = _accessKey <<< Applicative.pure

_draggable :: forall r. Event Boolean -> Event (Attribute (Indexed (draggable :: Boolean | r)))
_draggable = Functor.map $
  (unsafeAttribute <<< { key: "draggable", value: _ } <<< boolAttributeValue)

_draggable_ :: forall r. Boolean -> Event (Attribute (Indexed (draggable :: Boolean | r)))
_draggable_ = _draggable <<< Applicative.pure

_spellcheck :: forall r. Event Boolean -> Event (Attribute (Indexed (spellcheck :: Boolean | r)))
_spellcheck = Functor.map $
  (unsafeAttribute <<< { key: "spellcheck", value: _ } <<< boolAttributeValue)

_spellcheck_ :: forall r. Boolean -> Event (Attribute (Indexed (spellcheck :: Boolean | r)))
_spellcheck_ = _spellcheck <<< Applicative.pure

_innerText :: forall r. Event String -> Event (Attribute (Indexed (innerText :: String | r)))
_innerText = Functor.map $ (unsafeAttribute <<< { key: "innerText", value: _ } <<< prop')

_innerText_ :: forall r. String -> Event (Attribute (Indexed (innerText :: String | r)))
_innerText_ = _innerText <<< Applicative.pure

_outerText :: forall r. Event String -> Event (Attribute (Indexed (outerText :: String | r)))
_outerText = Functor.map $ (unsafeAttribute <<< { key: "outerText", value: _ } <<< prop')

_outerText_ :: forall r. String -> Event (Attribute (Indexed (outerText :: String | r)))
_outerText_ = _outerText <<< Applicative.pure

_src :: forall r. Event String -> Event (Attribute (Indexed (src :: String | r)))
_src = Functor.map $ (unsafeAttribute <<< { key: "src", value: _ } <<< prop')

_src_ :: forall r. String -> Event (Attribute (Indexed (src :: String | r)))
_src_ = _src <<< Applicative.pure

_color :: forall r. Event String -> Event (Attribute (Indexed (color :: String | r)))
_color = Functor.map $ (unsafeAttribute <<< { key: "color", value: _ } <<< prop')

_color_ :: forall r. String -> Event (Attribute (Indexed (color :: String | r)))
_color_ = _color <<< Applicative.pure

_face :: forall r. Event String -> Event (Attribute (Indexed (face :: String | r)))
_face = Functor.map $ (unsafeAttribute <<< { key: "face", value: _ } <<< prop')

_face_ :: forall r. String -> Event (Attribute (Indexed (face :: String | r)))
_face_ = _face <<< Applicative.pure

class IsSize (v :: Type) (a :: Type) | v -> a where
  isSize :: v -> AttributeValue

instance IsSize Int Int where
  isSize = intAttributeValue

instance IsSize String String where
  isSize = prop'

_size :: forall r v a. IsSize v a => Event v -> Event (Attribute (Indexed (size :: a | r)))
_size = Functor.map $ (unsafeAttribute <<< { key: "size", value: _ } <<< isSize)

_size_ :: forall r v a. IsSize v a => v -> Event (Attribute (Indexed (size :: a | r)))
_size_ = _size <<< Applicative.pure

_acceptCharset
  :: forall r. Event String -> Event (Attribute (Indexed (acceptCharset :: String | r)))
_acceptCharset = Functor.map $ (unsafeAttribute <<< { key: "acceptCharset", value: _ } <<< prop')

_acceptCharset_ :: forall r. String -> Event (Attribute (Indexed (acceptCharset :: String | r)))
_acceptCharset_ = _acceptCharset <<< Applicative.pure

_action :: forall r. Event String -> Event (Attribute (Indexed (action :: String | r)))
_action = Functor.map $ (unsafeAttribute <<< { key: "action", value: _ } <<< prop')

_action_ :: forall r. String -> Event (Attribute (Indexed (action :: String | r)))
_action_ = _action <<< Applicative.pure

_encoding :: forall r. Event String -> Event (Attribute (Indexed (encoding :: String | r)))
_encoding = Functor.map $ (unsafeAttribute <<< { key: "encoding", value: _ } <<< prop')

_encoding_ :: forall r. String -> Event (Attribute (Indexed (encoding :: String | r)))
_encoding_ = _encoding <<< Applicative.pure

_noValidate :: forall r. Event Boolean -> Event (Attribute (Indexed (noValidate :: Boolean | r)))
_noValidate = Functor.map $
  (unsafeAttribute <<< { key: "noValidate", value: _ } <<< boolAttributeValue)

_noValidate_ :: forall r. Boolean -> Event (Attribute (Indexed (noValidate :: Boolean | r)))
_noValidate_ = _noValidate <<< Applicative.pure

_scrolling :: forall r. Event String -> Event (Attribute (Indexed (scrolling :: String | r)))
_scrolling = Functor.map $ (unsafeAttribute <<< { key: "scrolling", value: _ } <<< prop')

_scrolling_ :: forall r. String -> Event (Attribute (Indexed (scrolling :: String | r)))
_scrolling_ = _scrolling <<< Applicative.pure

_frameBorder :: forall r. Event String -> Event (Attribute (Indexed (frameBorder :: String | r)))
_frameBorder = Functor.map $ (unsafeAttribute <<< { key: "frameBorder", value: _ } <<< prop')

_frameBorder_ :: forall r. String -> Event (Attribute (Indexed (frameBorder :: String | r)))
_frameBorder_ = _frameBorder <<< Applicative.pure

_longDesc :: forall r. Event String -> Event (Attribute (Indexed (longDesc :: String | r)))
_longDesc = Functor.map $ (unsafeAttribute <<< { key: "longDesc", value: _ } <<< prop')

_longDesc_ :: forall r. String -> Event (Attribute (Indexed (longDesc :: String | r)))
_longDesc_ = _longDesc <<< Applicative.pure

_noResize :: forall r. Event Boolean -> Event (Attribute (Indexed (noResize :: Boolean | r)))
_noResize = Functor.map $
  (unsafeAttribute <<< { key: "noResize", value: _ } <<< boolAttributeValue)

_noResize_ :: forall r. Boolean -> Event (Attribute (Indexed (noResize :: Boolean | r)))
_noResize_ = _noResize <<< Applicative.pure

_marginHeight :: forall r. Event String -> Event (Attribute (Indexed (marginHeight :: String | r)))
_marginHeight = Functor.map $ (unsafeAttribute <<< { key: "marginHeight", value: _ } <<< prop')

_marginHeight_ :: forall r. String -> Event (Attribute (Indexed (marginHeight :: String | r)))
_marginHeight_ = _marginHeight <<< Applicative.pure

_marginWidth :: forall r. Event String -> Event (Attribute (Indexed (marginWidth :: String | r)))
_marginWidth = Functor.map $ (unsafeAttribute <<< { key: "marginWidth", value: _ } <<< prop')

_marginWidth_ :: forall r. String -> Event (Attribute (Indexed (marginWidth :: String | r)))
_marginWidth_ = _marginWidth <<< Applicative.pure

class IsCols (v :: Type) (a :: Type) | v -> a where
  isCols :: v -> AttributeValue

instance IsCols Int Int where
  isCols = intAttributeValue

instance IsCols String String where
  isCols = prop'

_cols :: forall r v a. IsCols v a => Event v -> Event (Attribute (Indexed (cols :: a | r)))
_cols = Functor.map $ (unsafeAttribute <<< { key: "cols", value: _ } <<< isCols)

_cols_ :: forall r v a. IsCols v a => v -> Event (Attribute (Indexed (cols :: a | r)))
_cols_ = _cols <<< Applicative.pure

class IsRows (v :: Type) (a :: Type) | v -> a where
  isRows :: v -> AttributeValue

instance IsRows Int Int where
  isRows = intAttributeValue

instance IsRows String String where
  isRows = prop'

_rows :: forall r v a. IsRows v a => Event v -> Event (Attribute (Indexed (rows :: a | r)))
_rows = Functor.map $ (unsafeAttribute <<< { key: "rows", value: _ } <<< isRows)

_rows_ :: forall r v a. IsRows v a => v -> Event (Attribute (Indexed (rows :: a | r)))
_rows_ = _rows <<< Applicative.pure

_protocol :: forall r. Event String -> Event (Attribute (Indexed (protocol :: String | r)))
_protocol = Functor.map $ (unsafeAttribute <<< { key: "protocol", value: _ } <<< prop')

_protocol_ :: forall r. String -> Event (Attribute (Indexed (protocol :: String | r)))
_protocol_ = _protocol <<< Applicative.pure

_username :: forall r. Event String -> Event (Attribute (Indexed (username :: String | r)))
_username = Functor.map $ (unsafeAttribute <<< { key: "username", value: _ } <<< prop')

_username_ :: forall r. String -> Event (Attribute (Indexed (username :: String | r)))
_username_ = _username <<< Applicative.pure

_password :: forall r. Event String -> Event (Attribute (Indexed (password :: String | r)))
_password = Functor.map $ (unsafeAttribute <<< { key: "password", value: _ } <<< prop')

_password_ :: forall r. String -> Event (Attribute (Indexed (password :: String | r)))
_password_ = _password <<< Applicative.pure

_host :: forall r. Event String -> Event (Attribute (Indexed (host :: String | r)))
_host = Functor.map $ (unsafeAttribute <<< { key: "host", value: _ } <<< prop')

_host_ :: forall r. String -> Event (Attribute (Indexed (host :: String | r)))
_host_ = _host <<< Applicative.pure

_hostname :: forall r. Event String -> Event (Attribute (Indexed (hostname :: String | r)))
_hostname = Functor.map $ (unsafeAttribute <<< { key: "hostname", value: _ } <<< prop')

_hostname_ :: forall r. String -> Event (Attribute (Indexed (hostname :: String | r)))
_hostname_ = _hostname <<< Applicative.pure

_port :: forall r. Event String -> Event (Attribute (Indexed (port :: String | r)))
_port = Functor.map $ (unsafeAttribute <<< { key: "port", value: _ } <<< prop')

_port_ :: forall r. String -> Event (Attribute (Indexed (port :: String | r)))
_port_ = _port <<< Applicative.pure

_pathname :: forall r. Event String -> Event (Attribute (Indexed (pathname :: String | r)))
_pathname = Functor.map $ (unsafeAttribute <<< { key: "pathname", value: _ } <<< prop')

_pathname_ :: forall r. String -> Event (Attribute (Indexed (pathname :: String | r)))
_pathname_ = _pathname <<< Applicative.pure

_search :: forall r. Event String -> Event (Attribute (Indexed (search :: String | r)))
_search = Functor.map $ (unsafeAttribute <<< { key: "search", value: _ } <<< prop')

_search_ :: forall r. String -> Event (Attribute (Indexed (search :: String | r)))
_search_ = _search <<< Applicative.pure

_hash :: forall r. Event String -> Event (Attribute (Indexed (hash :: String | r)))
_hash = Functor.map $ (unsafeAttribute <<< { key: "hash", value: _ } <<< prop')

_hash_ :: forall r. String -> Event (Attribute (Indexed (hash :: String | r)))
_hash_ = _hash <<< Applicative.pure

_srcdoc :: forall r. Event String -> Event (Attribute (Indexed (srcdoc :: String | r)))
_srcdoc = Functor.map $ (unsafeAttribute <<< { key: "srcdoc", value: _ } <<< prop')

_srcdoc_ :: forall r. String -> Event (Attribute (Indexed (srcdoc :: String | r)))
_srcdoc_ = _srcdoc <<< Applicative.pure

_allow :: forall r. Event String -> Event (Attribute (Indexed (allow :: String | r)))
_allow = Functor.map $ (unsafeAttribute <<< { key: "allow", value: _ } <<< prop')

_allow_ :: forall r. String -> Event (Attribute (Indexed (allow :: String | r)))
_allow_ = _allow <<< Applicative.pure

_allowFullscreen
  :: forall r. Event Boolean -> Event (Attribute (Indexed (allowFullscreen :: Boolean | r)))
_allowFullscreen = Functor.map $
  (unsafeAttribute <<< { key: "allowFullscreen", value: _ } <<< boolAttributeValue)

_allowFullscreen_
  :: forall r. Boolean -> Event (Attribute (Indexed (allowFullscreen :: Boolean | r)))
_allowFullscreen_ = _allowFullscreen <<< Applicative.pure

_srcset :: forall r. Event String -> Event (Attribute (Indexed (srcset :: String | r)))
_srcset = Functor.map $ (unsafeAttribute <<< { key: "srcset", value: _ } <<< prop')

_srcset_ :: forall r. String -> Event (Attribute (Indexed (srcset :: String | r)))
_srcset_ = _srcset <<< Applicative.pure

_sizes :: forall r. Event String -> Event (Attribute (Indexed (sizes :: String | r)))
_sizes = Functor.map $ (unsafeAttribute <<< { key: "sizes", value: _ } <<< prop')

_sizes_ :: forall r. String -> Event (Attribute (Indexed (sizes :: String | r)))
_sizes_ = _sizes <<< Applicative.pure

_crossOrigin :: forall r. Event String -> Event (Attribute (Indexed (crossOrigin :: String | r)))
_crossOrigin = Functor.map $ (unsafeAttribute <<< { key: "crossOrigin", value: _ } <<< prop')

_crossOrigin_ :: forall r. String -> Event (Attribute (Indexed (crossOrigin :: String | r)))
_crossOrigin_ = _crossOrigin <<< Applicative.pure

_useMap :: forall r. Event String -> Event (Attribute (Indexed (useMap :: String | r)))
_useMap = Functor.map $ (unsafeAttribute <<< { key: "useMap", value: _ } <<< prop')

_useMap_ :: forall r. String -> Event (Attribute (Indexed (useMap :: String | r)))
_useMap_ = _useMap <<< Applicative.pure

_isMap :: forall r. Event Boolean -> Event (Attribute (Indexed (isMap :: Boolean | r)))
_isMap = Functor.map $ (unsafeAttribute <<< { key: "isMap", value: _ } <<< boolAttributeValue)

_isMap_ :: forall r. Boolean -> Event (Attribute (Indexed (isMap :: Boolean | r)))
_isMap_ = _isMap <<< Applicative.pure

_fetchPriority
  :: forall r. Event String -> Event (Attribute (Indexed (fetchPriority :: String | r)))
_fetchPriority = Functor.map $ (unsafeAttribute <<< { key: "fetchPriority", value: _ } <<< prop')

_fetchPriority_ :: forall r. String -> Event (Attribute (Indexed (fetchPriority :: String | r)))
_fetchPriority_ = _fetchPriority <<< Applicative.pure

_accept :: forall r. Event String -> Event (Attribute (Indexed (accept :: String | r)))
_accept = Functor.map $ (unsafeAttribute <<< { key: "accept", value: _ } <<< prop')

_accept_ :: forall r. String -> Event (Attribute (Indexed (accept :: String | r)))
_accept_ = _accept <<< Applicative.pure

_defaultChecked
  :: forall r. Event Boolean -> Event (Attribute (Indexed (defaultChecked :: Boolean | r)))
_defaultChecked = Functor.map $
  (unsafeAttribute <<< { key: "defaultChecked", value: _ } <<< boolAttributeValue)

_defaultChecked_
  :: forall r. Boolean -> Event (Attribute (Indexed (defaultChecked :: Boolean | r)))
_defaultChecked_ = _defaultChecked <<< Applicative.pure

_checked :: forall r. Event Boolean -> Event (Attribute (Indexed (checked :: Boolean | r)))
_checked = Functor.map $ (unsafeAttribute <<< { key: "checked", value: _ } <<< boolAttributeValue)

_checked_ :: forall r. Boolean -> Event (Attribute (Indexed (checked :: Boolean | r)))
_checked_ = _checked <<< Applicative.pure

_dirName :: forall r. Event String -> Event (Attribute (Indexed (dirName :: String | r)))
_dirName = Functor.map $ (unsafeAttribute <<< { key: "dirName", value: _ } <<< prop')

_dirName_ :: forall r. String -> Event (Attribute (Indexed (dirName :: String | r)))
_dirName_ = _dirName <<< Applicative.pure

_indeterminate
  :: forall r. Event Boolean -> Event (Attribute (Indexed (indeterminate :: Boolean | r)))
_indeterminate = Functor.map $
  (unsafeAttribute <<< { key: "indeterminate", value: _ } <<< boolAttributeValue)

_indeterminate_ :: forall r. Boolean -> Event (Attribute (Indexed (indeterminate :: Boolean | r)))
_indeterminate_ = _indeterminate <<< Applicative.pure

class IsMax (v :: Type) (a :: Type) | v -> a where
  isMax :: v -> AttributeValue

instance IsMax Number Number where
  isMax = numberAttributeValue

instance IsMax String String where
  isMax = prop'

_max :: forall r v a. IsMax v a => Event v -> Event (Attribute (Indexed (max :: a | r)))
_max = Functor.map $ (unsafeAttribute <<< { key: "max", value: _ } <<< isMax)

_max_ :: forall r v a. IsMax v a => v -> Event (Attribute (Indexed (max :: a | r)))
_max_ = _max <<< Applicative.pure

_maxLength :: forall r. Event Int -> Event (Attribute (Indexed (maxLength :: Int | r)))
_maxLength = Functor.map $
  (unsafeAttribute <<< { key: "maxLength", value: _ } <<< intAttributeValue)

_maxLength_ :: forall r. Int -> Event (Attribute (Indexed (maxLength :: Int | r)))
_maxLength_ = _maxLength <<< Applicative.pure

class IsMin (v :: Type) (a :: Type) | v -> a where
  isMin :: v -> AttributeValue

instance IsMin Number Number where
  isMin = numberAttributeValue

instance IsMin String String where
  isMin = prop'

_min :: forall r v a. IsMin v a => Event v -> Event (Attribute (Indexed (min :: a | r)))
_min = Functor.map $ (unsafeAttribute <<< { key: "min", value: _ } <<< isMin)

_min_ :: forall r v a. IsMin v a => v -> Event (Attribute (Indexed (min :: a | r)))
_min_ = _min <<< Applicative.pure

_minLength :: forall r. Event Int -> Event (Attribute (Indexed (minLength :: Int | r)))
_minLength = Functor.map $
  (unsafeAttribute <<< { key: "minLength", value: _ } <<< intAttributeValue)

_minLength_ :: forall r. Int -> Event (Attribute (Indexed (minLength :: Int | r)))
_minLength_ = _minLength <<< Applicative.pure

_multiple :: forall r. Event Boolean -> Event (Attribute (Indexed (multiple :: Boolean | r)))
_multiple = Functor.map $
  (unsafeAttribute <<< { key: "multiple", value: _ } <<< boolAttributeValue)

_multiple_ :: forall r. Boolean -> Event (Attribute (Indexed (multiple :: Boolean | r)))
_multiple_ = _multiple <<< Applicative.pure

_pattern :: forall r. Event String -> Event (Attribute (Indexed (pattern :: String | r)))
_pattern = Functor.map $ (unsafeAttribute <<< { key: "pattern", value: _ } <<< prop')

_pattern_ :: forall r. String -> Event (Attribute (Indexed (pattern :: String | r)))
_pattern_ = _pattern <<< Applicative.pure

_placeholder :: forall r. Event String -> Event (Attribute (Indexed (placeholder :: String | r)))
_placeholder = Functor.map $ (unsafeAttribute <<< { key: "placeholder", value: _ } <<< prop')

_placeholder_ :: forall r. String -> Event (Attribute (Indexed (placeholder :: String | r)))
_placeholder_ = _placeholder <<< Applicative.pure

_readOnly :: forall r. Event Boolean -> Event (Attribute (Indexed (readOnly :: Boolean | r)))
_readOnly = Functor.map $
  (unsafeAttribute <<< { key: "readOnly", value: _ } <<< boolAttributeValue)

_readOnly_ :: forall r. Boolean -> Event (Attribute (Indexed (readOnly :: Boolean | r)))
_readOnly_ = _readOnly <<< Applicative.pure

_required :: forall r. Event Boolean -> Event (Attribute (Indexed (required :: Boolean | r)))
_required = Functor.map $
  (unsafeAttribute <<< { key: "required", value: _ } <<< boolAttributeValue)

_required_ :: forall r. Boolean -> Event (Attribute (Indexed (required :: Boolean | r)))
_required_ = _required <<< Applicative.pure

_step :: forall r. Event String -> Event (Attribute (Indexed (step :: String | r)))
_step = Functor.map $ (unsafeAttribute <<< { key: "step", value: _ } <<< prop')

_step_ :: forall r. String -> Event (Attribute (Indexed (step :: String | r)))
_step_ = _step <<< Applicative.pure

_defaultValue :: forall r. Event String -> Event (Attribute (Indexed (defaultValue :: String | r)))
_defaultValue = Functor.map $ (unsafeAttribute <<< { key: "defaultValue", value: _ } <<< prop')

_defaultValue_ :: forall r. String -> Event (Attribute (Indexed (defaultValue :: String | r)))
_defaultValue_ = _defaultValue <<< Applicative.pure

_valueAsNumber
  :: forall r. Event Number -> Event (Attribute (Indexed (valueAsNumber :: Number | r)))
_valueAsNumber = Functor.map $
  (unsafeAttribute <<< { key: "valueAsNumber", value: _ } <<< numberAttributeValue)

_valueAsNumber_ :: forall r. Number -> Event (Attribute (Indexed (valueAsNumber :: Number | r)))
_valueAsNumber_ = _valueAsNumber <<< Applicative.pure

_selectionStart :: forall r. Event Int -> Event (Attribute (Indexed (selectionStart :: Int | r)))
_selectionStart = Functor.map $
  (unsafeAttribute <<< { key: "selectionStart", value: _ } <<< intAttributeValue)

_selectionStart_ :: forall r. Int -> Event (Attribute (Indexed (selectionStart :: Int | r)))
_selectionStart_ = _selectionStart <<< Applicative.pure

_selectionEnd :: forall r. Event Int -> Event (Attribute (Indexed (selectionEnd :: Int | r)))
_selectionEnd = Functor.map $
  (unsafeAttribute <<< { key: "selectionEnd", value: _ } <<< intAttributeValue)

_selectionEnd_ :: forall r. Int -> Event (Attribute (Indexed (selectionEnd :: Int | r)))
_selectionEnd_ = _selectionEnd <<< Applicative.pure

_selectionDirection
  :: forall r. Event String -> Event (Attribute (Indexed (selectionDirection :: String | r)))
_selectionDirection = Functor.map $
  (unsafeAttribute <<< { key: "selectionDirection", value: _ } <<< prop')

_selectionDirection_
  :: forall r. String -> Event (Attribute (Indexed (selectionDirection :: String | r)))
_selectionDirection_ = _selectionDirection <<< Applicative.pure

_htmlFor :: forall r. Event String -> Event (Attribute (Indexed (htmlFor :: String | r)))
_htmlFor = Functor.map $ (unsafeAttribute <<< { key: "htmlFor", value: _ } <<< prop')

_htmlFor_ :: forall r. String -> Event (Attribute (Indexed (htmlFor :: String | r)))
_htmlFor_ = _htmlFor <<< Applicative.pure

_as :: forall r. Event String -> Event (Attribute (Indexed (as :: String | r)))
_as = Functor.map $ (unsafeAttribute <<< { key: "as", value: _ } <<< prop')

_as_ :: forall r. String -> Event (Attribute (Indexed (as :: String | r)))
_as_ = _as <<< Applicative.pure

_media :: forall r. Event String -> Event (Attribute (Indexed (media :: String | r)))
_media = Functor.map $ (unsafeAttribute <<< { key: "media", value: _ } <<< prop')

_media_ :: forall r. String -> Event (Attribute (Indexed (media :: String | r)))
_media_ = _media <<< Applicative.pure

_integrity :: forall r. Event String -> Event (Attribute (Indexed (integrity :: String | r)))
_integrity = Functor.map $ (unsafeAttribute <<< { key: "integrity", value: _ } <<< prop')

_integrity_ :: forall r. String -> Event (Attribute (Indexed (integrity :: String | r)))
_integrity_ = _integrity <<< Applicative.pure

_hreflang :: forall r. Event String -> Event (Attribute (Indexed (hreflang :: String | r)))
_hreflang = Functor.map $ (unsafeAttribute <<< { key: "hreflang", value: _ } <<< prop')

_hreflang_ :: forall r. String -> Event (Attribute (Indexed (hreflang :: String | r)))
_hreflang_ = _hreflang <<< Applicative.pure

_imageSrcset :: forall r. Event String -> Event (Attribute (Indexed (imageSrcset :: String | r)))
_imageSrcset = Functor.map $ (unsafeAttribute <<< { key: "imageSrcset", value: _ } <<< prop')

_imageSrcset_ :: forall r. String -> Event (Attribute (Indexed (imageSrcset :: String | r)))
_imageSrcset_ = _imageSrcset <<< Applicative.pure

_imageSizes :: forall r. Event String -> Event (Attribute (Indexed (imageSizes :: String | r)))
_imageSizes = Functor.map $ (unsafeAttribute <<< { key: "imageSizes", value: _ } <<< prop')

_imageSizes_ :: forall r. String -> Event (Attribute (Indexed (imageSizes :: String | r)))
_imageSizes_ = _imageSizes <<< Applicative.pure

_behavior :: forall r. Event String -> Event (Attribute (Indexed (behavior :: String | r)))
_behavior = Functor.map $ (unsafeAttribute <<< { key: "behavior", value: _ } <<< prop')

_behavior_ :: forall r. String -> Event (Attribute (Indexed (behavior :: String | r)))
_behavior_ = _behavior <<< Applicative.pure

_bgColor :: forall r. Event String -> Event (Attribute (Indexed (bgColor :: String | r)))
_bgColor = Functor.map $ (unsafeAttribute <<< { key: "bgColor", value: _ } <<< prop')

_bgColor_ :: forall r. String -> Event (Attribute (Indexed (bgColor :: String | r)))
_bgColor_ = _bgColor <<< Applicative.pure

_direction :: forall r. Event String -> Event (Attribute (Indexed (direction :: String | r)))
_direction = Functor.map $ (unsafeAttribute <<< { key: "direction", value: _ } <<< prop')

_direction_ :: forall r. String -> Event (Attribute (Indexed (direction :: String | r)))
_direction_ = _direction <<< Applicative.pure

_hspace :: forall r. Event Int -> Event (Attribute (Indexed (hspace :: Int | r)))
_hspace = Functor.map $ (unsafeAttribute <<< { key: "hspace", value: _ } <<< intAttributeValue)

_hspace_ :: forall r. Int -> Event (Attribute (Indexed (hspace :: Int | r)))
_hspace_ = _hspace <<< Applicative.pure

class IsLoop (v :: Type) (a :: Type) | v -> a where
  isLoop :: v -> AttributeValue

instance IsLoop Boolean Boolean where
  isLoop = boolAttributeValue

instance IsLoop Int Int where
  isLoop = intAttributeValue

_loop :: forall r v a. IsLoop v a => Event v -> Event (Attribute (Indexed (loop :: a | r)))
_loop = Functor.map $ (unsafeAttribute <<< { key: "loop", value: _ } <<< isLoop)

_loop_ :: forall r v a. IsLoop v a => v -> Event (Attribute (Indexed (loop :: a | r)))
_loop_ = _loop <<< Applicative.pure

_scrollAmount :: forall r. Event Int -> Event (Attribute (Indexed (scrollAmount :: Int | r)))
_scrollAmount = Functor.map $
  (unsafeAttribute <<< { key: "scrollAmount", value: _ } <<< intAttributeValue)

_scrollAmount_ :: forall r. Int -> Event (Attribute (Indexed (scrollAmount :: Int | r)))
_scrollAmount_ = _scrollAmount <<< Applicative.pure

_scrollDelay :: forall r. Event Int -> Event (Attribute (Indexed (scrollDelay :: Int | r)))
_scrollDelay = Functor.map $
  (unsafeAttribute <<< { key: "scrollDelay", value: _ } <<< intAttributeValue)

_scrollDelay_ :: forall r. Int -> Event (Attribute (Indexed (scrollDelay :: Int | r)))
_scrollDelay_ = _scrollDelay <<< Applicative.pure

_trueSpeed :: forall r. Event Boolean -> Event (Attribute (Indexed (trueSpeed :: Boolean | r)))
_trueSpeed = Functor.map $
  (unsafeAttribute <<< { key: "trueSpeed", value: _ } <<< boolAttributeValue)

_trueSpeed_ :: forall r. Boolean -> Event (Attribute (Indexed (trueSpeed :: Boolean | r)))
_trueSpeed_ = _trueSpeed <<< Applicative.pure

_vspace :: forall r. Event Int -> Event (Attribute (Indexed (vspace :: Int | r)))
_vspace = Functor.map $ (unsafeAttribute <<< { key: "vspace", value: _ } <<< intAttributeValue)

_vspace_ :: forall r. Int -> Event (Attribute (Indexed (vspace :: Int | r)))
_vspace_ = _vspace <<< Applicative.pure

_currentTime :: forall r. Event Number -> Event (Attribute (Indexed (currentTime :: Number | r)))
_currentTime = Functor.map $
  (unsafeAttribute <<< { key: "currentTime", value: _ } <<< numberAttributeValue)

_currentTime_ :: forall r. Number -> Event (Attribute (Indexed (currentTime :: Number | r)))
_currentTime_ = _currentTime <<< Applicative.pure

_defaultPlaybackRate
  :: forall r. Event Number -> Event (Attribute (Indexed (defaultPlaybackRate :: Number | r)))
_defaultPlaybackRate = Functor.map $
  (unsafeAttribute <<< { key: "defaultPlaybackRate", value: _ } <<< numberAttributeValue)

_defaultPlaybackRate_
  :: forall r. Number -> Event (Attribute (Indexed (defaultPlaybackRate :: Number | r)))
_defaultPlaybackRate_ = _defaultPlaybackRate <<< Applicative.pure

_playbackRate :: forall r. Event Number -> Event (Attribute (Indexed (playbackRate :: Number | r)))
_playbackRate = Functor.map $
  (unsafeAttribute <<< { key: "playbackRate", value: _ } <<< numberAttributeValue)

_playbackRate_ :: forall r. Number -> Event (Attribute (Indexed (playbackRate :: Number | r)))
_playbackRate_ = _playbackRate <<< Applicative.pure

_preservesPitch
  :: forall r. Event Boolean -> Event (Attribute (Indexed (preservesPitch :: Boolean | r)))
_preservesPitch = Functor.map $
  (unsafeAttribute <<< { key: "preservesPitch", value: _ } <<< boolAttributeValue)

_preservesPitch_
  :: forall r. Boolean -> Event (Attribute (Indexed (preservesPitch :: Boolean | r)))
_preservesPitch_ = _preservesPitch <<< Applicative.pure

_autoplay :: forall r. Event Boolean -> Event (Attribute (Indexed (autoplay :: Boolean | r)))
_autoplay = Functor.map $
  (unsafeAttribute <<< { key: "autoplay", value: _ } <<< boolAttributeValue)

_autoplay_ :: forall r. Boolean -> Event (Attribute (Indexed (autoplay :: Boolean | r)))
_autoplay_ = _autoplay <<< Applicative.pure

_controls :: forall r. Event Boolean -> Event (Attribute (Indexed (controls :: Boolean | r)))
_controls = Functor.map $
  (unsafeAttribute <<< { key: "controls", value: _ } <<< boolAttributeValue)

_controls_ :: forall r. Boolean -> Event (Attribute (Indexed (controls :: Boolean | r)))
_controls_ = _controls <<< Applicative.pure

_volume :: forall r. Event Number -> Event (Attribute (Indexed (volume :: Number | r)))
_volume = Functor.map $ (unsafeAttribute <<< { key: "volume", value: _ } <<< numberAttributeValue)

_volume_ :: forall r. Number -> Event (Attribute (Indexed (volume :: Number | r)))
_volume_ = _volume <<< Applicative.pure

_muted :: forall r. Event Boolean -> Event (Attribute (Indexed (muted :: Boolean | r)))
_muted = Functor.map $ (unsafeAttribute <<< { key: "muted", value: _ } <<< boolAttributeValue)

_muted_ :: forall r. Boolean -> Event (Attribute (Indexed (muted :: Boolean | r)))
_muted_ = _muted <<< Applicative.pure

_defaultMuted
  :: forall r. Event Boolean -> Event (Attribute (Indexed (defaultMuted :: Boolean | r)))
_defaultMuted = Functor.map $
  (unsafeAttribute <<< { key: "defaultMuted", value: _ } <<< boolAttributeValue)

_defaultMuted_ :: forall r. Boolean -> Event (Attribute (Indexed (defaultMuted :: Boolean | r)))
_defaultMuted_ = _defaultMuted <<< Applicative.pure

_content :: forall r. Event String -> Event (Attribute (Indexed (content :: String | r)))
_content = Functor.map $ (unsafeAttribute <<< { key: "content", value: _ } <<< prop')

_content_ :: forall r. String -> Event (Attribute (Indexed (content :: String | r)))
_content_ = _content <<< Applicative.pure

_low :: forall r. Event Number -> Event (Attribute (Indexed (low :: Number | r)))
_low = Functor.map $ (unsafeAttribute <<< { key: "low", value: _ } <<< numberAttributeValue)

_low_ :: forall r. Number -> Event (Attribute (Indexed (low :: Number | r)))
_low_ = _low <<< Applicative.pure

_high :: forall r. Event Number -> Event (Attribute (Indexed (high :: Number | r)))
_high = Functor.map $ (unsafeAttribute <<< { key: "high", value: _ } <<< numberAttributeValue)

_high_ :: forall r. Number -> Event (Attribute (Indexed (high :: Number | r)))
_high_ = _high <<< Applicative.pure

_optimum :: forall r. Event Number -> Event (Attribute (Indexed (optimum :: Number | r)))
_optimum = Functor.map $
  (unsafeAttribute <<< { key: "optimum", value: _ } <<< numberAttributeValue)

_optimum_ :: forall r. Number -> Event (Attribute (Indexed (optimum :: Number | r)))
_optimum_ = _optimum <<< Applicative.pure

_cite :: forall r. Event String -> Event (Attribute (Indexed (cite :: String | r)))
_cite = Functor.map $ (unsafeAttribute <<< { key: "cite", value: _ } <<< prop')

_cite_ :: forall r. String -> Event (Attribute (Indexed (cite :: String | r)))
_cite_ = _cite <<< Applicative.pure

_dateTime :: forall r. Event String -> Event (Attribute (Indexed (dateTime :: String | r)))
_dateTime = Functor.map $ (unsafeAttribute <<< { key: "dateTime", value: _ } <<< prop')

_dateTime_ :: forall r. String -> Event (Attribute (Indexed (dateTime :: String | r)))
_dateTime_ = _dateTime <<< Applicative.pure

_reversed :: forall r. Event Boolean -> Event (Attribute (Indexed (reversed :: Boolean | r)))
_reversed = Functor.map $
  (unsafeAttribute <<< { key: "reversed", value: _ } <<< boolAttributeValue)

_reversed_ :: forall r. Boolean -> Event (Attribute (Indexed (reversed :: Boolean | r)))
_reversed_ = _reversed <<< Applicative.pure

_start :: forall r. Event Int -> Event (Attribute (Indexed (start :: Int | r)))
_start = Functor.map $ (unsafeAttribute <<< { key: "start", value: _ } <<< intAttributeValue)

_start_ :: forall r. Int -> Event (Attribute (Indexed (start :: Int | r)))
_start_ = _start <<< Applicative.pure

_xdata :: forall r. Event String -> Event (Attribute (Indexed (xdata :: String | r)))
_xdata = Functor.map $ (unsafeAttribute <<< { key: "data", value: _ } <<< prop')

_xdata_ :: forall r. String -> Event (Attribute (Indexed (xdata :: String | r)))
_xdata_ = _xdata <<< Applicative.pure

_label :: forall r. Event String -> Event (Attribute (Indexed (label :: String | r)))
_label = Functor.map $ (unsafeAttribute <<< { key: "label", value: _ } <<< prop')

_label_ :: forall r. String -> Event (Attribute (Indexed (label :: String | r)))
_label_ = _label <<< Applicative.pure

_defaultSelected
  :: forall r. Event Boolean -> Event (Attribute (Indexed (defaultSelected :: Boolean | r)))
_defaultSelected = Functor.map $
  (unsafeAttribute <<< { key: "defaultSelected", value: _ } <<< boolAttributeValue)

_defaultSelected_
  :: forall r. Boolean -> Event (Attribute (Indexed (defaultSelected :: Boolean | r)))
_defaultSelected_ = _defaultSelected <<< Applicative.pure

_selected :: forall r. Event Boolean -> Event (Attribute (Indexed (selected :: Boolean | r)))
_selected = Functor.map $
  (unsafeAttribute <<< { key: "selected", value: _ } <<< boolAttributeValue)

_selected_ :: forall r. Boolean -> Event (Attribute (Indexed (selected :: Boolean | r)))
_selected_ = _selected <<< Applicative.pure

_text :: forall r. Event String -> Event (Attribute (Indexed (text :: String | r)))
_text = Functor.map $ (unsafeAttribute <<< { key: "text", value: _ } <<< prop')

_text_ :: forall r. String -> Event (Attribute (Indexed (text :: String | r)))
_text_ = _text <<< Applicative.pure

_nonce :: forall r. Event String -> Event (Attribute (Indexed (nonce :: String | r)))
_nonce = Functor.map $ (unsafeAttribute <<< { key: "nonce", value: _ } <<< prop')

_nonce_ :: forall r. String -> Event (Attribute (Indexed (nonce :: String | r)))
_nonce_ = _nonce <<< Applicative.pure

_autofocus :: forall r. Event Boolean -> Event (Attribute (Indexed (autofocus :: Boolean | r)))
_autofocus = Functor.map $
  (unsafeAttribute <<< { key: "autofocus", value: _ } <<< boolAttributeValue)

_autofocus_ :: forall r. Boolean -> Event (Attribute (Indexed (autofocus :: Boolean | r)))
_autofocus_ = _autofocus <<< Applicative.pure

_tabIndex :: forall r. Event Int -> Event (Attribute (Indexed (tabIndex :: Int | r)))
_tabIndex = Functor.map $ (unsafeAttribute <<< { key: "tabIndex", value: _ } <<< intAttributeValue)

_tabIndex_ :: forall r. Int -> Event (Attribute (Indexed (tabIndex :: Int | r)))
_tabIndex_ = _tabIndex <<< Applicative.pure

_valueType :: forall r. Event String -> Event (Attribute (Indexed (valueType :: String | r)))
_valueType = Functor.map $ (unsafeAttribute <<< { key: "valueType", value: _ } <<< prop')

_valueType_ :: forall r. String -> Event (Attribute (Indexed (valueType :: String | r)))
_valueType_ = _valueType <<< Applicative.pure

_length :: forall r. Event Int -> Event (Attribute (Indexed (length :: Int | r)))
_length = Functor.map $ (unsafeAttribute <<< { key: "length", value: _ } <<< intAttributeValue)

_length_ :: forall r. Int -> Event (Attribute (Indexed (length :: Int | r)))
_length_ = _length <<< Applicative.pure

_selectedIndex :: forall r. Event Int -> Event (Attribute (Indexed (selectedIndex :: Int | r)))
_selectedIndex = Functor.map $
  (unsafeAttribute <<< { key: "selectedIndex", value: _ } <<< intAttributeValue)

_selectedIndex_ :: forall r. Int -> Event (Attribute (Indexed (selectedIndex :: Int | r)))
_selectedIndex_ = _selectedIndex <<< Applicative.pure

_colSpan :: forall r. Event Int -> Event (Attribute (Indexed (colSpan :: Int | r)))
_colSpan = Functor.map $ (unsafeAttribute <<< { key: "colSpan", value: _ } <<< intAttributeValue)

_colSpan_ :: forall r. Int -> Event (Attribute (Indexed (colSpan :: Int | r)))
_colSpan_ = _colSpan <<< Applicative.pure

_rowSpan :: forall r. Event Int -> Event (Attribute (Indexed (rowSpan :: Int | r)))
_rowSpan = Functor.map $ (unsafeAttribute <<< { key: "rowSpan", value: _ } <<< intAttributeValue)

_rowSpan_ :: forall r. Int -> Event (Attribute (Indexed (rowSpan :: Int | r)))
_rowSpan_ = _rowSpan <<< Applicative.pure

_headers :: forall r. Event String -> Event (Attribute (Indexed (headers :: String | r)))
_headers = Functor.map $ (unsafeAttribute <<< { key: "headers", value: _ } <<< prop')

_headers_ :: forall r. String -> Event (Attribute (Indexed (headers :: String | r)))
_headers_ = _headers <<< Applicative.pure

_abbr :: forall r. Event String -> Event (Attribute (Indexed (abbr :: String | r)))
_abbr = Functor.map $ (unsafeAttribute <<< { key: "abbr", value: _ } <<< prop')

_abbr_ :: forall r. String -> Event (Attribute (Indexed (abbr :: String | r)))
_abbr_ = _abbr <<< Applicative.pure

_span :: forall r. Event Int -> Event (Attribute (Indexed (span :: Int | r)))
_span = Functor.map $ (unsafeAttribute <<< { key: "span", value: _ } <<< intAttributeValue)

_span_ :: forall r. Int -> Event (Attribute (Indexed (span :: Int | r)))
_span_ = _span <<< Applicative.pure

_srclang :: forall r. Event String -> Event (Attribute (Indexed (srclang :: String | r)))
_srclang = Functor.map $ (unsafeAttribute <<< { key: "srclang", value: _ } <<< prop')

_srclang_ :: forall r. String -> Event (Attribute (Indexed (srclang :: String | r)))
_srclang_ = _srclang <<< Applicative.pure

_default :: forall r. Event Boolean -> Event (Attribute (Indexed (default :: Boolean | r)))
_default = Functor.map $ (unsafeAttribute <<< { key: "default", value: _ } <<< boolAttributeValue)

_default_ :: forall r. Boolean -> Event (Attribute (Indexed (default :: Boolean | r)))
_default_ = _default <<< Applicative.pure

_poster :: forall r. Event String -> Event (Attribute (Indexed (poster :: String | r)))
_poster = Functor.map $ (unsafeAttribute <<< { key: "poster", value: _ } <<< prop')

_poster_ :: forall r. String -> Event (Attribute (Indexed (poster :: String | r)))
_poster_ = _poster <<< Applicative.pure

_playsInline :: forall r. Event Boolean -> Event (Attribute (Indexed (playsInline :: Boolean | r)))
_playsInline = Functor.map $
  (unsafeAttribute <<< { key: "playsInline", value: _ } <<< boolAttributeValue)

_playsInline_ :: forall r. Boolean -> Event (Attribute (Indexed (playsInline :: Boolean | r)))
_playsInline_ = _playsInline <<< Applicative.pure

_popoverTargetAction
  :: forall r. Event String -> Event (Attribute (Indexed (popoverTargetAction :: String | r)))
_popoverTargetAction = Functor.map $
  (unsafeAttribute <<< { key: "popoverTargetAction", value: _ } <<< prop')

_popoverTargetAction_
  :: forall r. String -> Event (Attribute (Indexed (popoverTargetAction :: String | r)))
_popoverTargetAction_ = _popoverTargetAction <<< Applicative.pure

_orient :: forall r. Event String -> Event (Attribute (Indexed (orient :: String | r)))
_orient = Functor.map $ (unsafeAttribute <<< { key: "orient", value: _ } <<< prop')

_orient_ :: forall r. String -> Event (Attribute (Indexed (orient :: String | r)))
_orient_ = _orient <<< Applicative.pure

_onafterprint :: forall r. Event Cb -> Event (Attribute (Indexed (onafterprint :: Cb | r)))
_onafterprint = Functor.map $ (unsafeAttribute <<< { key: "onafterprint", value: _ } <<< cb')

_onafterprint_ :: forall r. Cb -> Event (Attribute (Indexed (onafterprint :: Cb | r)))
_onafterprint_ = _onafterprint <<< Applicative.pure

_onbeforeprint :: forall r. Event Cb -> Event (Attribute (Indexed (onbeforeprint :: Cb | r)))
_onbeforeprint = Functor.map $ (unsafeAttribute <<< { key: "onbeforeprint", value: _ } <<< cb')

_onbeforeprint_ :: forall r. Cb -> Event (Attribute (Indexed (onbeforeprint :: Cb | r)))
_onbeforeprint_ = _onbeforeprint <<< Applicative.pure

_onhashchange :: forall r. Event Cb -> Event (Attribute (Indexed (onhashchange :: Cb | r)))
_onhashchange = Functor.map $ (unsafeAttribute <<< { key: "onhashchange", value: _ } <<< cb')

_onhashchange_ :: forall r. Cb -> Event (Attribute (Indexed (onhashchange :: Cb | r)))
_onhashchange_ = _onhashchange <<< Applicative.pure

_onlanguagechange :: forall r. Event Cb -> Event (Attribute (Indexed (onlanguagechange :: Cb | r)))
_onlanguagechange = Functor.map $
  (unsafeAttribute <<< { key: "onlanguagechange", value: _ } <<< cb')

_onlanguagechange_ :: forall r. Cb -> Event (Attribute (Indexed (onlanguagechange :: Cb | r)))
_onlanguagechange_ = _onlanguagechange <<< Applicative.pure

_onmessage :: forall r. Event Cb -> Event (Attribute (Indexed (onmessage :: Cb | r)))
_onmessage = Functor.map $ (unsafeAttribute <<< { key: "onmessage", value: _ } <<< cb')

_onmessage_ :: forall r. Cb -> Event (Attribute (Indexed (onmessage :: Cb | r)))
_onmessage_ = _onmessage <<< Applicative.pure

_onmessageerror :: forall r. Event Cb -> Event (Attribute (Indexed (onmessageerror :: Cb | r)))
_onmessageerror = Functor.map $ (unsafeAttribute <<< { key: "onmessageerror", value: _ } <<< cb')

_onmessageerror_ :: forall r. Cb -> Event (Attribute (Indexed (onmessageerror :: Cb | r)))
_onmessageerror_ = _onmessageerror <<< Applicative.pure

_onoffline :: forall r. Event Cb -> Event (Attribute (Indexed (onoffline :: Cb | r)))
_onoffline = Functor.map $ (unsafeAttribute <<< { key: "onoffline", value: _ } <<< cb')

_onoffline_ :: forall r. Cb -> Event (Attribute (Indexed (onoffline :: Cb | r)))
_onoffline_ = _onoffline <<< Applicative.pure

_ononline :: forall r. Event Cb -> Event (Attribute (Indexed (ononline :: Cb | r)))
_ononline = Functor.map $ (unsafeAttribute <<< { key: "ononline", value: _ } <<< cb')

_ononline_ :: forall r. Cb -> Event (Attribute (Indexed (ononline :: Cb | r)))
_ononline_ = _ononline <<< Applicative.pure

_onpagehide :: forall r. Event Cb -> Event (Attribute (Indexed (onpagehide :: Cb | r)))
_onpagehide = Functor.map $ (unsafeAttribute <<< { key: "onpagehide", value: _ } <<< cb')

_onpagehide_ :: forall r. Cb -> Event (Attribute (Indexed (onpagehide :: Cb | r)))
_onpagehide_ = _onpagehide <<< Applicative.pure

_onpageshow :: forall r. Event Cb -> Event (Attribute (Indexed (onpageshow :: Cb | r)))
_onpageshow = Functor.map $ (unsafeAttribute <<< { key: "onpageshow", value: _ } <<< cb')

_onpageshow_ :: forall r. Cb -> Event (Attribute (Indexed (onpageshow :: Cb | r)))
_onpageshow_ = _onpageshow <<< Applicative.pure

_onpopstate :: forall r. Event Cb -> Event (Attribute (Indexed (onpopstate :: Cb | r)))
_onpopstate = Functor.map $ (unsafeAttribute <<< { key: "onpopstate", value: _ } <<< cb')

_onpopstate_ :: forall r. Cb -> Event (Attribute (Indexed (onpopstate :: Cb | r)))
_onpopstate_ = _onpopstate <<< Applicative.pure

_onrejectionhandled
  :: forall r. Event Cb -> Event (Attribute (Indexed (onrejectionhandled :: Cb | r)))
_onrejectionhandled = Functor.map $
  (unsafeAttribute <<< { key: "onrejectionhandled", value: _ } <<< cb')

_onrejectionhandled_ :: forall r. Cb -> Event (Attribute (Indexed (onrejectionhandled :: Cb | r)))
_onrejectionhandled_ = _onrejectionhandled <<< Applicative.pure

_onstorage :: forall r. Event Cb -> Event (Attribute (Indexed (onstorage :: Cb | r)))
_onstorage = Functor.map $ (unsafeAttribute <<< { key: "onstorage", value: _ } <<< cb')

_onstorage_ :: forall r. Cb -> Event (Attribute (Indexed (onstorage :: Cb | r)))
_onstorage_ = _onstorage <<< Applicative.pure

_onunhandledrejection
  :: forall r. Event Cb -> Event (Attribute (Indexed (onunhandledrejection :: Cb | r)))
_onunhandledrejection = Functor.map $
  (unsafeAttribute <<< { key: "onunhandledrejection", value: _ } <<< cb')

_onunhandledrejection_
  :: forall r. Cb -> Event (Attribute (Indexed (onunhandledrejection :: Cb | r)))
_onunhandledrejection_ = _onunhandledrejection <<< Applicative.pure

_onunload :: forall r. Event Cb -> Event (Attribute (Indexed (onunload :: Cb | r)))
_onunload = Functor.map $ (unsafeAttribute <<< { key: "onunload", value: _ } <<< cb')

_onunload_ :: forall r. Cb -> Event (Attribute (Indexed (onunload :: Cb | r)))
_onunload_ = _onunload <<< Applicative.pure

newtype Keyword (v :: Symbol) = Keyword String

type role Keyword phantom

derive instance Newtype.Newtype (Keyword v) _

__anonymous :: Keyword "anonymous"
__anonymous = Keyword "anonymous"

__useCredentials :: Keyword "use-credentials"
__useCredentials = Keyword "use-credentials"

__lazy :: Keyword "lazy"
__lazy = Keyword "lazy"

__eager :: Keyword "eager"
__eager = Keyword "eager"

__high :: Keyword "high"
__high = Keyword "high"

__low :: Keyword "low"
__low = Keyword "low"

__auto :: Keyword "auto"
__auto = Keyword "auto"

__ltr :: Keyword "ltr"
__ltr = Keyword "ltr"

__rtl :: Keyword "rtl"
__rtl = Keyword "rtl"

__applicationName :: Keyword "application-name"
__applicationName = Keyword "application-name"

__author :: Keyword "author"
__author = Keyword "author"

__description :: Keyword "description"
__description = Keyword "description"

__generator :: Keyword "generator"
__generator = Keyword "generator"

__keywords :: Keyword "keywords"
__keywords = Keyword "keywords"

__referrer :: Keyword "referrer"
__referrer = Keyword "referrer"

__themeColor :: Keyword "theme-color"
__themeColor = Keyword "theme-color"

__colorScheme :: Keyword "color-scheme"
__colorScheme = Keyword "color-scheme"

__contentLanguage :: Keyword "content-language"
__contentLanguage = Keyword "content-language"

__contentType :: Keyword "content-type"
__contentType = Keyword "content-type"

__defaultStyle :: Keyword "default-style"
__defaultStyle = Keyword "default-style"

__refresh :: Keyword "refresh"
__refresh = Keyword "refresh"

__setCookie :: Keyword "set-cookie"
__setCookie = Keyword "set-cookie"

__xUaCompatible :: Keyword "x-ua-compatible"
__xUaCompatible = Keyword "x-ua-compatible"

__contentSecurityPolicy :: Keyword "content-security-policy"
__contentSecurityPolicy = Keyword "content-security-policy"

__x1 :: Keyword "1"
__x1 = Keyword "1"

__a :: Keyword "a"
__a = Keyword "a"

__xA :: Keyword "A"
__xA = Keyword "A"

__i :: Keyword "i"
__i = Keyword "i"

__xI :: Keyword "I"
__xI = Keyword "I"

__alternate :: Keyword "alternate"
__alternate = Keyword "alternate"

__bookmark :: Keyword "bookmark"
__bookmark = Keyword "bookmark"

__canonical :: Keyword "canonical"
__canonical = Keyword "canonical"

__dnsPrefetch :: Keyword "dns-prefetch"
__dnsPrefetch = Keyword "dns-prefetch"

__external :: Keyword "external"
__external = Keyword "external"

__help :: Keyword "help"
__help = Keyword "help"

__icon :: Keyword "icon"
__icon = Keyword "icon"

__license :: Keyword "license"
__license = Keyword "license"

__manifest :: Keyword "manifest"
__manifest = Keyword "manifest"

__modulepreload :: Keyword "modulepreload"
__modulepreload = Keyword "modulepreload"

__nofollow :: Keyword "nofollow"
__nofollow = Keyword "nofollow"

__noopener :: Keyword "noopener"
__noopener = Keyword "noopener"

__noreferrer :: Keyword "noreferrer"
__noreferrer = Keyword "noreferrer"

__opener :: Keyword "opener"
__opener = Keyword "opener"

__pingback :: Keyword "pingback"
__pingback = Keyword "pingback"

__preconnect :: Keyword "preconnect"
__preconnect = Keyword "preconnect"

__prefetch :: Keyword "prefetch"
__prefetch = Keyword "prefetch"

__preload :: Keyword "preload"
__preload = Keyword "preload"

__search :: Keyword "search"
__search = Keyword "search"

__stylesheet :: Keyword "stylesheet"
__stylesheet = Keyword "stylesheet"

__tag :: Keyword "tag"
__tag = Keyword "tag"

__next :: Keyword "next"
__next = Keyword "next"

__prev :: Keyword "prev"
__prev = Keyword "prev"

__sync :: Keyword "sync"
__sync = Keyword "sync"

__async :: Keyword "async"
__async = Keyword "async"

__subtitles :: Keyword "subtitles"
__subtitles = Keyword "subtitles"

__captions :: Keyword "captions"
__captions = Keyword "captions"

__descriptions :: Keyword "descriptions"
__descriptions = Keyword "descriptions"

__chapters :: Keyword "chapters"
__chapters = Keyword "chapters"

__metadata :: Keyword "metadata"
__metadata = Keyword "metadata"

__none :: Keyword "none"
__none = Keyword "none"

__circleState :: Keyword "circle state"
__circleState = Keyword "circle state"

__defaultState :: Keyword "default state"
__defaultState = Keyword "default state"

__polygonState :: Keyword "polygon state"
__polygonState = Keyword "polygon state"

__rectangleState :: Keyword "rectangle state"
__rectangleState = Keyword "rectangle state"

__row :: Keyword "row"
__row = Keyword "row"

__col :: Keyword "col"
__col = Keyword "col"

__rowgroup :: Keyword "rowgroup"
__rowgroup = Keyword "rowgroup"

__colgroup :: Keyword "colgroup"
__colgroup = Keyword "colgroup"

__hidden :: Keyword "hidden"
__hidden = Keyword "hidden"

__text :: Keyword "text"
__text = Keyword "text"

__tel :: Keyword "tel"
__tel = Keyword "tel"

__url :: Keyword "url"
__url = Keyword "url"

__email :: Keyword "email"
__email = Keyword "email"

__password :: Keyword "password"
__password = Keyword "password"

__date :: Keyword "date"
__date = Keyword "date"

__month :: Keyword "month"
__month = Keyword "month"

__week :: Keyword "week"
__week = Keyword "week"

__time :: Keyword "time"
__time = Keyword "time"

__datetimeLocal :: Keyword "datetime-local"
__datetimeLocal = Keyword "datetime-local"

__number :: Keyword "number"
__number = Keyword "number"

__range :: Keyword "range"
__range = Keyword "range"

__color :: Keyword "color"
__color = Keyword "color"

__checkbox :: Keyword "checkbox"
__checkbox = Keyword "checkbox"

__radio :: Keyword "radio"
__radio = Keyword "radio"

__file :: Keyword "file"
__file = Keyword "file"

__submit :: Keyword "submit"
__submit = Keyword "submit"

__image :: Keyword "image"
__image = Keyword "image"

__reset :: Keyword "reset"
__reset = Keyword "reset"

__button :: Keyword "button"
__button = Keyword "button"

__soft :: Keyword "soft"
__soft = Keyword "soft"

__hard :: Keyword "hard"
__hard = Keyword "hard"

__get :: Keyword "get"
__get = Keyword "get"

__post :: Keyword "post"
__post = Keyword "post"

__dialog :: Keyword "dialog"
__dialog = Keyword "dialog"

__applicationXWwwFormUrlencoded :: Keyword "application/x-www-form-urlencoded"
__applicationXWwwFormUrlencoded = Keyword "application/x-www-form-urlencoded"

__multipartFormData :: Keyword "multipart/form-data"
__multipartFormData = Keyword "multipart/form-data"

__textPlain :: Keyword "text/plain"
__textPlain = Keyword "text/plain"

__shipping :: Keyword "shipping"
__shipping = Keyword "shipping"

__billing :: Keyword "billing"
__billing = Keyword "billing"

__home :: Keyword "home"
__home = Keyword "home"

__work :: Keyword "work"
__work = Keyword "work"

__mobile :: Keyword "mobile"
__mobile = Keyword "mobile"

__fax :: Keyword "fax"
__fax = Keyword "fax"

__pager :: Keyword "pager"
__pager = Keyword "pager"

__off :: Keyword "off"
__off = Keyword "off"

__on :: Keyword "on"
__on = Keyword "on"

__name :: Keyword "name"
__name = Keyword "name"

__honorificPrefix :: Keyword "honorific-prefix"
__honorificPrefix = Keyword "honorific-prefix"

__givenName :: Keyword "given-name"
__givenName = Keyword "given-name"

__additionalName :: Keyword "additional-name"
__additionalName = Keyword "additional-name"

__familyName :: Keyword "family-name"
__familyName = Keyword "family-name"

__honorificSuffix :: Keyword "honorific-suffix"
__honorificSuffix = Keyword "honorific-suffix"

__nickname :: Keyword "nickname"
__nickname = Keyword "nickname"

__organizationTitle :: Keyword "organization-title"
__organizationTitle = Keyword "organization-title"

__username :: Keyword "username"
__username = Keyword "username"

__newPassword :: Keyword "new-password"
__newPassword = Keyword "new-password"

__currentPassword :: Keyword "current-password"
__currentPassword = Keyword "current-password"

__oneTimeCode :: Keyword "one-time-code"
__oneTimeCode = Keyword "one-time-code"

__organization :: Keyword "organization"
__organization = Keyword "organization"

__streetAddress :: Keyword "street-address"
__streetAddress = Keyword "street-address"

__addressLine1 :: Keyword "address-line1"
__addressLine1 = Keyword "address-line1"

__addressLine2 :: Keyword "address-line2"
__addressLine2 = Keyword "address-line2"

__addressLine3 :: Keyword "address-line3"
__addressLine3 = Keyword "address-line3"

__addressLevel4 :: Keyword "address-level4"
__addressLevel4 = Keyword "address-level4"

__addressLevel3 :: Keyword "address-level3"
__addressLevel3 = Keyword "address-level3"

__addressLevel2 :: Keyword "address-level2"
__addressLevel2 = Keyword "address-level2"

__addressLevel1 :: Keyword "address-level1"
__addressLevel1 = Keyword "address-level1"

__country :: Keyword "country"
__country = Keyword "country"

__countryName :: Keyword "country-name"
__countryName = Keyword "country-name"

__postalCode :: Keyword "postal-code"
__postalCode = Keyword "postal-code"

__ccName :: Keyword "cc-name"
__ccName = Keyword "cc-name"

__ccGivenName :: Keyword "cc-given-name"
__ccGivenName = Keyword "cc-given-name"

__ccAdditionalName :: Keyword "cc-additional-name"
__ccAdditionalName = Keyword "cc-additional-name"

__ccFamilyName :: Keyword "cc-family-name"
__ccFamilyName = Keyword "cc-family-name"

__ccNumber :: Keyword "cc-number"
__ccNumber = Keyword "cc-number"

__ccExp :: Keyword "cc-exp"
__ccExp = Keyword "cc-exp"

__ccExpMonth :: Keyword "cc-exp-month"
__ccExpMonth = Keyword "cc-exp-month"

__ccExpYear :: Keyword "cc-exp-year"
__ccExpYear = Keyword "cc-exp-year"

__ccCsc :: Keyword "cc-csc"
__ccCsc = Keyword "cc-csc"

__ccType :: Keyword "cc-type"
__ccType = Keyword "cc-type"

__transactionCurrency :: Keyword "transaction-currency"
__transactionCurrency = Keyword "transaction-currency"

__transactionAmount :: Keyword "transaction-amount"
__transactionAmount = Keyword "transaction-amount"

__language :: Keyword "language"
__language = Keyword "language"

__bday :: Keyword "bday"
__bday = Keyword "bday"

__bdayDay :: Keyword "bday-day"
__bdayDay = Keyword "bday-day"

__bdayMonth :: Keyword "bday-month"
__bdayMonth = Keyword "bday-month"

__bdayYear :: Keyword "bday-year"
__bdayYear = Keyword "bday-year"

__sex :: Keyword "sex"
__sex = Keyword "sex"

__photo :: Keyword "photo"
__photo = Keyword "photo"

__telCountryCode :: Keyword "tel-country-code"
__telCountryCode = Keyword "tel-country-code"

__telNational :: Keyword "tel-national"
__telNational = Keyword "tel-national"

__telAreaCode :: Keyword "tel-area-code"
__telAreaCode = Keyword "tel-area-code"

__telLocal :: Keyword "tel-local"
__telLocal = Keyword "tel-local"

__telLocalPrefix :: Keyword "tel-local-prefix"
__telLocalPrefix = Keyword "tel-local-prefix"

__telLocalSuffix :: Keyword "tel-local-suffix"
__telLocalSuffix = Keyword "tel-local-suffix"

__telExtension :: Keyword "tel-extension"
__telExtension = Keyword "tel-extension"

__impp :: Keyword "impp"
__impp = Keyword "impp"

__value :: Keyword "value"
__value = Keyword "value"

__untilFound :: Keyword "until-found"
__untilFound = Keyword "until-found"

__sentences :: Keyword "sentences"
__sentences = Keyword "sentences"

__words :: Keyword "words"
__words = Keyword "words"

__characters :: Keyword "characters"
__characters = Keyword "characters"

__numeric :: Keyword "numeric"
__numeric = Keyword "numeric"

__decimal :: Keyword "decimal"
__decimal = Keyword "decimal"

__enter :: Keyword "enter"
__enter = Keyword "enter"

__done :: Keyword "done"
__done = Keyword "done"

__go :: Keyword "go"
__go = Keyword "go"

__previous :: Keyword "previous"
__previous = Keyword "previous"

__send :: Keyword "send"
__send = Keyword "send"

__manual :: Keyword "manual"
__manual = Keyword "manual"

__toggle :: Keyword "toggle"
__toggle = Keyword "toggle"

__show :: Keyword "show"
__show = Keyword "show"

__hide :: Keyword "hide"
__hide = Keyword "hide"

__allowPopups :: Keyword "allow-popups"
__allowPopups = Keyword "allow-popups"

__allowTopNavigation :: Keyword "allow-top-navigation"
__allowTopNavigation = Keyword "allow-top-navigation"

__allowTopNavigationByUserActivation :: Keyword "allow-top-navigation-by-user-activation"
__allowTopNavigationByUserActivation = Keyword "allow-top-navigation-by-user-activation"

__allowSameOrigin :: Keyword "allow-same-origin"
__allowSameOrigin = Keyword "allow-same-origin"

__allowForms :: Keyword "allow-forms"
__allowForms = Keyword "allow-forms"

__allowPointerLock :: Keyword "allow-pointer-lock"
__allowPointerLock = Keyword "allow-pointer-lock"

__allowScripts :: Keyword "allow-scripts"
__allowScripts = Keyword "allow-scripts"

__allowPopupsToEscapeSandbox :: Keyword "allow-popups-to-escape-sandbox"
__allowPopupsToEscapeSandbox = Keyword "allow-popups-to-escape-sandbox"

__allowModals :: Keyword "allow-modals"
__allowModals = Keyword "allow-modals"

__allowOrientationLock :: Keyword "allow-orientation-lock"
__allowOrientationLock = Keyword "allow-orientation-lock"

__allowPresentation :: Keyword "allow-presentation"
__allowPresentation = Keyword "allow-presentation"

__allowDownloads :: Keyword "allow-downloads"
__allowDownloads = Keyword "allow-downloads"

__allowTopNavigationToCustomProtocols :: Keyword "allow-top-navigation-to-custom-protocols"
__allowTopNavigationToCustomProtocols = Keyword "allow-top-navigation-to-custom-protocols"
