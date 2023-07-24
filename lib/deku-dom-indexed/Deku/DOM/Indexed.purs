module Deku.DOM.Indexed where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import FRP.Event as FRP.Event
import Deku.Control (elementify2)
import Deku.Core (Nut)
import Type.Proxy (Proxy)
import Deku.DOM.Indexed.Index as Index
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import Data.Newtype as Data.Newtype

type HTMLHtmlElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHtmlElement"
  , version :: String
  , manifest :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLHeadElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHeadElement"
  , profile :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTitleElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTitleElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBaseElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBaseElement"
  , target :: String
  , href :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLLinkElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLLinkElement"
  , target :: String
  , urn :: String
  , rev :: String
  , methods :: String
  , charset :: String
  , fetchpriority :: String
  , disabled :: String
  , color :: String
  , blocking :: String
  , as :: String
  , sizes :: String
  , imagesizes :: String
  , imagesrcset :: String
  , title :: String
  , referrerpolicy :: String
  , type :: String
  , hreflang :: String
  , integrity :: String
  , media :: String
  , crossorigin :: String
  , rel :: String
  , href :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMetaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMetaElement"
  , scheme :: String
  , httpEquiv :: String
  , media :: String
  , name :: String
  , content :: String
  , charset :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLStyleElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLStyleElement"
  , type :: String
  , title :: String
  , blocking :: String
  , media :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBodyElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBodyElement"
  , vlink :: String
  , topmargin :: String
  , text :: String
  , rightmargin :: String
  , marginwidth :: String
  , marginheight :: String
  , link :: String
  , leftmargin :: String
  , bottommargin :: String
  , bgcolor :: String
  , alink :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLArticleElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLArticleElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSectionElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSectionElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNavElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNavElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAsideElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAsideElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH1Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH1Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH2Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH2Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH3Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH3Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH4Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH4Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH5Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH5Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLH6Element (r :: Row Type) =
  ( __nominal :: Proxy "HTMLH6Element"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLHgroupElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHgroupElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLHeaderElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHeaderElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFooterElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFooterElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAddressElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAddressElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLPElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLPElement"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLHrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLHrElement"
  , width :: String
  , size :: String
  , noshade :: String
  , color :: String
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLPreElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLPreElement"
  , width :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBlockquoteElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBlockquoteElement"
  , cite :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLOlElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOlElement"
  , compact :: String
  , type :: String
  , start :: String
  , reversed :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLUlElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLUlElement"
  , type :: String
  , compact :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMenuElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMenuElement"
  , compact :: String
  , label :: String
  , type :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLLiElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLLiElement"
  , type :: String
  , value :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDlElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDlElement"
  , compact :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDtElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDtElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDdElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDdElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFigureElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFigureElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFigcaptionElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFigcaptionElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMainElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMainElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSearchElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSearchElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDivElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDivElement"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAElement"
  , urn :: String
  , rev :: String
  , name :: String
  , methods :: String
  , shape :: String
  , coords :: String
  , charset :: String
  , referrerpolicy :: String
  , type :: String
  , hreflang :: String
  , rel :: String
  , ping :: String
  , download :: String
  , target :: String
  , href :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLEmElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLEmElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLStrongElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLStrongElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSmallElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSmallElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLCiteElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLCiteElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLQElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLQElement"
  , cite :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDfnElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDfnElement"
  , title :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAbbrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAbbrElement"
  , title :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLRubyElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLRubyElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLRtElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLRtElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLRpElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLRpElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDataElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDataElement"
  , value :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTimeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTimeElement"
  , datetime :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLCodeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLCodeElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLVarElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLVarElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSampElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSampElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLKbdElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLKbdElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSubElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSubElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSupElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSupElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLIElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLIElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLUElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLUElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMarkElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMarkElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBdiElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBdiElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBdoElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBdoElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSpanElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSpanElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBrElement"
  , clear :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLWbrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLWbrElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLInsElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLInsElement"
  , datetime :: String
  , cite :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDelElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDelElement"
  , datetime :: String
  , cite :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLPictureElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLPictureElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSourceElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSourceElement"
  , height :: String
  , width :: String
  , src :: String
  , sizes :: String
  , srcset :: String
  , media :: String
  , type :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLImgElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLImgElement"
  , vspace :: String
  , hspace :: String
  , border :: String
  , align :: String
  , lowsrc :: String
  , longdesc :: String
  , name :: String
  , height :: String
  , width :: String
  , usemap :: String
  , ismap :: String
  , loading :: String
  , fetchpriority :: String
  , decoding :: String
  , referrerpolicy :: String
  , crossorigin :: String
  , sizes :: String
  , alt :: String
  , srcset :: String
  , src :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLIframeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLIframeElement"
  , vspace :: String
  , scrolling :: String
  , marginwidth :: String
  , marginheight :: String
  , hspace :: String
  , framespacing :: String
  , frameborder :: String
  , allowtransparency :: String
  , align :: String
  , longdesc :: String
  , height :: String
  , width :: String
  , loading :: String
  , referrerpolicy :: String
  , allowfullscreen :: String
  , allow :: String
  , sandbox :: String
  , name :: String
  , srcdoc :: String
  , src :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLEmbedElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLEmbedElement"
  , vspace :: String
  , hspace :: String
  , align :: String
  , name :: String
  , height :: String
  , width :: String
  , type :: String
  , src :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLObjectElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLObjectElement"
  , vspace :: String
  , hspace :: String
  , border :: String
  , align :: String
  , typemustmatch :: String
  , standby :: String
  , declare :: String
  , codetype :: String
  , codebase :: String
  , code :: String
  , classid :: String
  , archive :: String
  , usemap :: String
  , autocomplete :: String
  , disabled :: String
  , dirname :: String
  , form :: String
  , height :: String
  , width :: String
  , name :: String
  , type :: String
  , data :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLVideoElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLVideoElement"
  , height :: String
  , width :: String
  , muted :: String
  , controls :: String
  , autoplay :: String
  , loop :: String
  , preload :: String
  , crossorigin :: String
  , src :: String
  , playsinline :: String
  , poster :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAudioElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAudioElement"
  , muted :: String
  , controls :: String
  , autoplay :: String
  , loop :: String
  , preload :: String
  , crossorigin :: String
  , src :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTrackElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTrackElement"
  , default :: String
  , label :: String
  , srclang :: String
  , src :: String
  , kind :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMapElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMapElement"
  , name :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAreaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAreaElement"
  , nohref :: String
  , type :: String
  , hreflang :: String
  , coords :: String
  , shape :: String
  , alt :: String
  , referrerpolicy :: String
  , rel :: String
  , ping :: String
  , download :: String
  , target :: String
  , href :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTableElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTableElement"
  , width :: String
  , rules :: String
  , height :: String
  , frame :: String
  , cellspacing :: String
  , cellpadding :: String
  , bordercolor :: String
  , border :: String
  , bgcolor :: String
  , align :: String
  , summary :: String
  , datapagesize :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLCaptionElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLCaptionElement"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLColgroupElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLColgroupElement"
  , span :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLColElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLColElement"
  , width :: String
  , valign :: String
  , charoff :: String
  , char :: String
  , align :: String
  , span :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTbodyElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTbodyElement"
  , valign :: String
  , height :: String
  , charoff :: String
  , char :: String
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTheadElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTheadElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTfootElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTfootElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTrElement"
  , valign :: String
  , height :: String
  , charoff :: String
  , char :: String
  , bgcolor :: String
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTdElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTdElement"
  , width :: String
  , valign :: String
  , nowrap :: String
  , height :: String
  , charoff :: String
  , char :: String
  , bgcolor :: String
  , align :: String
  , scope :: String
  , axis :: String
  , abbr :: String
  , headers :: String
  , rowspan :: String
  , colspan :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLThElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLThElement"
  , width :: String
  , valign :: String
  , nowrap :: String
  , height :: String
  , charoff :: String
  , char :: String
  , bgcolor :: String
  , align :: String
  , axis :: String
  , headers :: String
  , rowspan :: String
  , colspan :: String
  , abbr :: String
  , scope :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFormElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFormElement"
  , accept :: String
  , formnovalidate :: String
  , novalidate :: String
  , formtarget :: String
  , target :: String
  , formenctype :: String
  , enctype :: String
  , formmethod :: String
  , method :: String
  , formaction :: String
  , action :: String
  , rel :: String
  , autocomplete :: String
  , name :: String
  , acceptCharset :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLLabelElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLLabelElement"
  , for :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLInputElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLInputElement"
  , capture :: String
  , vspace :: String
  , hspace :: String
  , border :: String
  , align :: String
  , usemap :: String
  , ismap :: String
  , autocomplete :: String
  , disabled :: String
  , minlength :: String
  , maxlength :: String
  , dirname :: String
  , name :: String
  , form :: String
  , placeholder :: String
  , list :: String
  , step :: String
  , max :: String
  , min :: String
  , title :: String
  , pattern :: String
  , multiple :: String
  , required :: String
  , readonly :: String
  , size :: String
  , alt :: String
  , src :: String
  , accept :: String
  , checked :: String
  , value :: String
  , type :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLButtonElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLButtonElement"
  , autocomplete :: String
  , formnovalidate :: String
  , novalidate :: String
  , formtarget :: String
  , target :: String
  , formenctype :: String
  , enctype :: String
  , formmethod :: String
  , method :: String
  , formaction :: String
  , action :: String
  , disabled :: String
  , dirname :: String
  , name :: String
  , form :: String
  , value :: String
  , type :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSelectElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSelectElement"
  , autocomplete :: String
  , disabled :: String
  , dirname :: String
  , name :: String
  , form :: String
  , required :: String
  , size :: String
  , multiple :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDatalistElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDatalistElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLOptgroupElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOptgroupElement"
  , label :: String
  , disabled :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLOptionElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOptionElement"
  , name :: String
  , selected :: String
  , value :: String
  , label :: String
  , disabled :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTextareaElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTextareaElement"
  , autocomplete :: String
  , disabled :: String
  , minlength :: String
  , maxlength :: String
  , dirname :: String
  , name :: String
  , form :: String
  , placeholder :: String
  , required :: String
  , wrap :: String
  , rows :: String
  , cols :: String
  , readonly :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLOutputElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLOutputElement"
  , autocomplete :: String
  , disabled :: String
  , dirname :: String
  , name :: String
  , form :: String
  , for :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLProgressElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLProgressElement"
  , max :: String
  , value :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMeterElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMeterElement"
  , optimum :: String
  , high :: String
  , low :: String
  , value :: String
  , max :: String
  , min :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFieldsetElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFieldsetElement"
  , autocomplete :: String
  , disabled :: String
  , dirname :: String
  , name :: String
  , form :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLLegendElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLLegendElement"
  , align :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDetailsElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDetailsElement"
  , open :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSummaryElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSummaryElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDialogElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDialogElement"
  , open :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLScriptElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLScriptElement"
  , for :: String
  , event :: String
  , language :: String
  , charset :: String
  , fetchpriority :: String
  , blocking :: String
  , referrerpolicy :: String
  , integrity :: String
  , crossorigin :: String
  , defer :: String
  , async :: String
  , nomodule :: String
  , src :: String
  , type :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNoscriptElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNoscriptElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTemplateElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTemplateElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSlotElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSlotElement"
  , name :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLCanvasElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLCanvasElement"
  , height :: String
  , width :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAppletElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAppletElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLAcronymElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLAcronymElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBgsoundElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBgsoundElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLDirElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLDirElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNoframesElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNoframesElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLIsindexElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLIsindexElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLKeygenElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLKeygenElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLListingElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLListingElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMenuitemElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMenuitemElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNextidElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNextidElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNoembedElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNoembedElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLParamElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLParamElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLPlaintextElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLPlaintextElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLRbElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLRbElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLRtcElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLRtcElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLStrikeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLStrikeElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLXmpElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLXmpElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBasefontElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBasefontElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBigElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBigElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLBlinkElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLBlinkElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLCenterElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLCenterElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFontElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFontElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMulticolElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMulticolElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLNobrElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLNobrElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLSpacerElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLSpacerElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLTtElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLTtElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLMarqueeElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLMarqueeElement"
  , loop :: String
  , truespeed :: String
  , direction :: String
  , behavior :: String
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFramesetElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFramesetElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HTMLFrameElement (r :: Row Type) =
  ( __nominal :: Proxy "HTMLFrameElement"
  | ARIAMixin (GlobalEventHandlers (Global (HtmlGlobal (HtmlsvgGlobal r))))
  )

type HtmlsvgGlobal (r :: Row Type) =
  (__nominal :: Proxy "HtmlsvgGlobal", tabindex :: String, nonce :: String | r)

type Global (r :: Row Type) =
  (__nominal :: Proxy "Global", slot :: String, id :: String, class :: String | r)

type HtmlGlobal (r :: Row Type) =
  ( __nominal :: Proxy "HtmlGlobal"
  , popovertargetaction :: String
  , popovertarget :: String
  , popover :: String
  , draggable :: String
  , enterkeyhint :: String
  , inputmode :: String
  , autocapitalize :: String
  , spellcheck :: String
  , contenteditable :: String
  , accesskey :: String
  , autofocus :: String
  , hidden :: String
  , itemprop :: String
  , itemref :: String
  , itemid :: String
  , itemtype :: String
  , itemscope :: String
  , is :: String
  , style :: String
  , dir :: String
  , translate :: String
  , lang :: String
  , title :: String
  | r
  )

type GlobalEventHandlers (r :: Row Type) =
  ( __nominal :: Proxy "GlobalEventHandlers"
  , onAnimationcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onAnimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onAnimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onAnimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTransitioncancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTransitionstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTransitionrun :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSelectionchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSelectstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTouchcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTouchmove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTouchend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTouchstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onLostpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onGotpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointercancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerrawupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointermove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerdown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPointerover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onScrollend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onScroll :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onResize :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onLoad :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onFocus :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onError :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onBlur :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWheel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWebkittransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWebkitanimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWebkitanimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWebkitanimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onWaiting :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onVolumechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onToggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onTimeupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSuspend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSubmit :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onStalled :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSlotchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSelect :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSeeking :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSeeked :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onSecuritypolicyviolation :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onReset :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onRatechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onProgress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPlaying :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPlay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPause :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onPaste :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMouseup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMouseover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMouseout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMousemove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMouseleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMouseenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onMousedown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onLoadstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onLoadedmetadata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onLoadeddata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onKeyup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onKeypress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onKeydown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onInvalid :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onInput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onFormdata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onEnded :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onEmptied :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDurationchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDrop :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDragstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDragover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDragleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDragenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDragend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDrag :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onDblclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCut :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCuechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCopy :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onContextrestored :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onContextmenu :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onContextlost :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onClose :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onClick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onChange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCanplaythrough :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCanplay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onCancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onBeforetoggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onBeforematch :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onBeforeinput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onAuxclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  , onAbort :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
  | r
  )

type ARIAMixin (r :: Row Type) =
  ( __nominal :: Proxy "ARIAMixin"
  , ariaValuetext :: String
  , ariaValuenow :: String
  , ariaValuemin :: String
  , ariaValuemax :: String
  , ariaSort :: String
  , ariaSetsize :: String
  , ariaSelected :: String
  , ariaRowspan :: String
  , ariaRowindextext :: String
  , ariaRowindex :: String
  , ariaRowcount :: String
  , ariaRoledescription :: String
  , ariaRequired :: String
  , ariaReadonly :: String
  , ariaPressed :: String
  , ariaPosinset :: String
  , ariaPlaceholder :: String
  , ariaOwns :: String
  , ariaOrientation :: String
  , ariaMultiselectable :: String
  , ariaMultiline :: String
  , ariaModal :: String
  , ariaLive :: String
  , ariaLevel :: String
  , ariaLabelledby :: String
  , ariaLabel :: String
  , ariaKeyshortcuts :: String
  , ariaInvalid :: String
  , ariaHidden :: String
  , ariaHaspopup :: String
  , ariaFlowto :: String
  , ariaExpanded :: String
  , ariaErrormessage :: String
  , ariaDisabled :: String
  , ariaDetails :: String
  , ariaDescription :: String
  , ariaDescribedby :: String
  , ariaCurrent :: String
  , ariaControls :: String
  , ariaColspan :: String
  , ariaColindextext :: String
  , ariaColindex :: String
  , ariaColcount :: String
  , ariaChecked :: String
  , ariaBusy :: String
  , ariaAutocomplete :: String
  , ariaAtomic :: String
  , ariaActivedescendant :: String
  , role :: String
  | r
  )

html
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLHtmlElement ()))))
  -> Array Nut
  -> Nut
html = elementify2 {-  -} "html"

html_ :: Array Nut -> Nut
html_ = elementify2 {-  -} "html" []

head
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLHeadElement ()))))
  -> Array Nut
  -> Nut
head = elementify2 {-  -} "head"

head_ :: Array Nut -> Nut
head_ = elementify2 {-  -} "head" []

title
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTitleElement ()))))
  -> Array Nut
  -> Nut
title = elementify2 {-  -} "title"

title_ :: Array Nut -> Nut
title_ = elementify2 {-  -} "title" []

base
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBaseElement ()))))
  -> Array Nut
  -> Nut
base = elementify2 {-  -} "base"

base_ :: Array Nut -> Nut
base_ = elementify2 {-  -} "base" []

link
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLLinkElement ()))))
  -> Array Nut
  -> Nut
link = elementify2 {-  -} "link"

link_ :: Array Nut -> Nut
link_ = elementify2 {-  -} "link" []

meta
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMetaElement ()))))
  -> Array Nut
  -> Nut
meta = elementify2 {-  -} "meta"

meta_ :: Array Nut -> Nut
meta_ = elementify2 {-  -} "meta" []

style
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLStyleElement ()))))
  -> Array Nut
  -> Nut
style = elementify2 {-  -} "style"

style_ :: Array Nut -> Nut
style_ = elementify2 {-  -} "style" []

body
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBodyElement ()))))
  -> Array Nut
  -> Nut
body = elementify2 {-  -} "body"

body_ :: Array Nut -> Nut
body_ = elementify2 {-  -} "body" []

article
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLArticleElement ()))))
  -> Array Nut
  -> Nut
article = elementify2 {-  -} "article"

article_ :: Array Nut -> Nut
article_ = elementify2 {-  -} "article" []

section
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSectionElement ()))))
  -> Array Nut
  -> Nut
section = elementify2 {-  -} "section"

section_ :: Array Nut -> Nut
section_ = elementify2 {-  -} "section" []

nav
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNavElement ()))))
  -> Array Nut
  -> Nut
nav = elementify2 {-  -} "nav"

nav_ :: Array Nut -> Nut
nav_ = elementify2 {-  -} "nav" []

aside
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAsideElement ()))))
  -> Array Nut
  -> Nut
aside = elementify2 {-  -} "aside"

aside_ :: Array Nut -> Nut
aside_ = elementify2 {-  -} "aside" []

h1
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH1Element ()))))
  -> Array Nut
  -> Nut
h1 = elementify2 {-  -} "h1"

h1_ :: Array Nut -> Nut
h1_ = elementify2 {-  -} "h1" []

h2
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH2Element ()))))
  -> Array Nut
  -> Nut
h2 = elementify2 {-  -} "h2"

h2_ :: Array Nut -> Nut
h2_ = elementify2 {-  -} "h2" []

h3
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH3Element ()))))
  -> Array Nut
  -> Nut
h3 = elementify2 {-  -} "h3"

h3_ :: Array Nut -> Nut
h3_ = elementify2 {-  -} "h3" []

h4
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH4Element ()))))
  -> Array Nut
  -> Nut
h4 = elementify2 {-  -} "h4"

h4_ :: Array Nut -> Nut
h4_ = elementify2 {-  -} "h4" []

h5
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH5Element ()))))
  -> Array Nut
  -> Nut
h5 = elementify2 {-  -} "h5"

h5_ :: Array Nut -> Nut
h5_ = elementify2 {-  -} "h5" []

h6
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLH6Element ()))))
  -> Array Nut
  -> Nut
h6 = elementify2 {-  -} "h6"

h6_ :: Array Nut -> Nut
h6_ = elementify2 {-  -} "h6" []

hgroup
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLHgroupElement ()))))
  -> Array Nut
  -> Nut
hgroup = elementify2 {-  -} "hgroup"

hgroup_ :: Array Nut -> Nut
hgroup_ = elementify2 {-  -} "hgroup" []

header
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLHeaderElement ()))))
  -> Array Nut
  -> Nut
header = elementify2 {-  -} "header"

header_ :: Array Nut -> Nut
header_ = elementify2 {-  -} "header" []

footer
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFooterElement ()))))
  -> Array Nut
  -> Nut
footer = elementify2 {-  -} "footer"

footer_ :: Array Nut -> Nut
footer_ = elementify2 {-  -} "footer" []

address
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAddressElement ()))))
  -> Array Nut
  -> Nut
address = elementify2 {-  -} "address"

address_ :: Array Nut -> Nut
address_ = elementify2 {-  -} "address" []

p
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLPElement ()))))
  -> Array Nut
  -> Nut
p = elementify2 {-  -} "p"

p_ :: Array Nut -> Nut
p_ = elementify2 {-  -} "p" []

hr
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLHrElement ()))))
  -> Array Nut
  -> Nut
hr = elementify2 {-  -} "hr"

hr_ :: Array Nut -> Nut
hr_ = elementify2 {-  -} "hr" []

pre
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLPreElement ()))))
  -> Array Nut
  -> Nut
pre = elementify2 {-  -} "pre"

pre_ :: Array Nut -> Nut
pre_ = elementify2 {-  -} "pre" []

blockquote
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBlockquoteElement ()))))
  -> Array Nut
  -> Nut
blockquote = elementify2 {-  -} "blockquote"

blockquote_ :: Array Nut -> Nut
blockquote_ = elementify2 {-  -} "blockquote" []

ol
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLOlElement ()))))
  -> Array Nut
  -> Nut
ol = elementify2 {-  -} "ol"

ol_ :: Array Nut -> Nut
ol_ = elementify2 {-  -} "ol" []

ul
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLUlElement ()))))
  -> Array Nut
  -> Nut
ul = elementify2 {-  -} "ul"

ul_ :: Array Nut -> Nut
ul_ = elementify2 {-  -} "ul" []

menu
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMenuElement ()))))
  -> Array Nut
  -> Nut
menu = elementify2 {-  -} "menu"

menu_ :: Array Nut -> Nut
menu_ = elementify2 {-  -} "menu" []

li
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLLiElement ()))))
  -> Array Nut
  -> Nut
li = elementify2 {-  -} "li"

li_ :: Array Nut -> Nut
li_ = elementify2 {-  -} "li" []

dl
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDlElement ()))))
  -> Array Nut
  -> Nut
dl = elementify2 {-  -} "dl"

dl_ :: Array Nut -> Nut
dl_ = elementify2 {-  -} "dl" []

dt
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDtElement ()))))
  -> Array Nut
  -> Nut
dt = elementify2 {-  -} "dt"

dt_ :: Array Nut -> Nut
dt_ = elementify2 {-  -} "dt" []

dd
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDdElement ()))))
  -> Array Nut
  -> Nut
dd = elementify2 {-  -} "dd"

dd_ :: Array Nut -> Nut
dd_ = elementify2 {-  -} "dd" []

figure
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFigureElement ()))))
  -> Array Nut
  -> Nut
figure = elementify2 {-  -} "figure"

figure_ :: Array Nut -> Nut
figure_ = elementify2 {-  -} "figure" []

figcaption
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFigcaptionElement ()))))
  -> Array Nut
  -> Nut
figcaption = elementify2 {-  -} "figcaption"

figcaption_ :: Array Nut -> Nut
figcaption_ = elementify2 {-  -} "figcaption" []

main
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMainElement ()))))
  -> Array Nut
  -> Nut
main = elementify2 {-  -} "main"

main_ :: Array Nut -> Nut
main_ = elementify2 {-  -} "main" []

search
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSearchElement ()))))
  -> Array Nut
  -> Nut
search = elementify2 {-  -} "search"

search_ :: Array Nut -> Nut
search_ = elementify2 {-  -} "search" []

div
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDivElement ()))))
  -> Array Nut
  -> Nut
div = elementify2 {-  -} "div"

div_ :: Array Nut -> Nut
div_ = elementify2 {-  -} "div" []

a
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAElement ()))))
  -> Array Nut
  -> Nut
a = elementify2 {-  -} "a"

a_ :: Array Nut -> Nut
a_ = elementify2 {-  -} "a" []

em
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLEmElement ()))))
  -> Array Nut
  -> Nut
em = elementify2 {-  -} "em"

em_ :: Array Nut -> Nut
em_ = elementify2 {-  -} "em" []

strong
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLStrongElement ()))))
  -> Array Nut
  -> Nut
strong = elementify2 {-  -} "strong"

strong_ :: Array Nut -> Nut
strong_ = elementify2 {-  -} "strong" []

small
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSmallElement ()))))
  -> Array Nut
  -> Nut
small = elementify2 {-  -} "small"

small_ :: Array Nut -> Nut
small_ = elementify2 {-  -} "small" []

s
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSElement ()))))
  -> Array Nut
  -> Nut
s = elementify2 {-  -} "s"

s_ :: Array Nut -> Nut
s_ = elementify2 {-  -} "s" []

cite
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLCiteElement ()))))
  -> Array Nut
  -> Nut
cite = elementify2 {-  -} "cite"

cite_ :: Array Nut -> Nut
cite_ = elementify2 {-  -} "cite" []

q
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLQElement ()))))
  -> Array Nut
  -> Nut
q = elementify2 {-  -} "q"

q_ :: Array Nut -> Nut
q_ = elementify2 {-  -} "q" []

dfn
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDfnElement ()))))
  -> Array Nut
  -> Nut
dfn = elementify2 {-  -} "dfn"

dfn_ :: Array Nut -> Nut
dfn_ = elementify2 {-  -} "dfn" []

abbr
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAbbrElement ()))))
  -> Array Nut
  -> Nut
abbr = elementify2 {-  -} "abbr"

abbr_ :: Array Nut -> Nut
abbr_ = elementify2 {-  -} "abbr" []

ruby
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLRubyElement ()))))
  -> Array Nut
  -> Nut
ruby = elementify2 {-  -} "ruby"

ruby_ :: Array Nut -> Nut
ruby_ = elementify2 {-  -} "ruby" []

rt
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLRtElement ()))))
  -> Array Nut
  -> Nut
rt = elementify2 {-  -} "rt"

rt_ :: Array Nut -> Nut
rt_ = elementify2 {-  -} "rt" []

rp
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLRpElement ()))))
  -> Array Nut
  -> Nut
rp = elementify2 {-  -} "rp"

rp_ :: Array Nut -> Nut
rp_ = elementify2 {-  -} "rp" []

xdata
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDataElement ()))))
  -> Array Nut
  -> Nut
xdata = elementify2 {-  -} "data"

xdata_ :: Array Nut -> Nut
xdata_ = elementify2 {-  -} "data" []

time
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTimeElement ()))))
  -> Array Nut
  -> Nut
time = elementify2 {-  -} "time"

time_ :: Array Nut -> Nut
time_ = elementify2 {-  -} "time" []

code
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLCodeElement ()))))
  -> Array Nut
  -> Nut
code = elementify2 {-  -} "code"

code_ :: Array Nut -> Nut
code_ = elementify2 {-  -} "code" []

var
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLVarElement ()))))
  -> Array Nut
  -> Nut
var = elementify2 {-  -} "var"

var_ :: Array Nut -> Nut
var_ = elementify2 {-  -} "var" []

samp
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSampElement ()))))
  -> Array Nut
  -> Nut
samp = elementify2 {-  -} "samp"

samp_ :: Array Nut -> Nut
samp_ = elementify2 {-  -} "samp" []

kbd
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLKbdElement ()))))
  -> Array Nut
  -> Nut
kbd = elementify2 {-  -} "kbd"

kbd_ :: Array Nut -> Nut
kbd_ = elementify2 {-  -} "kbd" []

sub
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSubElement ()))))
  -> Array Nut
  -> Nut
sub = elementify2 {-  -} "sub"

sub_ :: Array Nut -> Nut
sub_ = elementify2 {-  -} "sub" []

sup
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSupElement ()))))
  -> Array Nut
  -> Nut
sup = elementify2 {-  -} "sup"

sup_ :: Array Nut -> Nut
sup_ = elementify2 {-  -} "sup" []

i
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLIElement ()))))
  -> Array Nut
  -> Nut
i = elementify2 {-  -} "i"

i_ :: Array Nut -> Nut
i_ = elementify2 {-  -} "i" []

b
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBElement ()))))
  -> Array Nut
  -> Nut
b = elementify2 {-  -} "b"

b_ :: Array Nut -> Nut
b_ = elementify2 {-  -} "b" []

u
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLUElement ()))))
  -> Array Nut
  -> Nut
u = elementify2 {-  -} "u"

u_ :: Array Nut -> Nut
u_ = elementify2 {-  -} "u" []

mark
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMarkElement ()))))
  -> Array Nut
  -> Nut
mark = elementify2 {-  -} "mark"

mark_ :: Array Nut -> Nut
mark_ = elementify2 {-  -} "mark" []

bdi
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBdiElement ()))))
  -> Array Nut
  -> Nut
bdi = elementify2 {-  -} "bdi"

bdi_ :: Array Nut -> Nut
bdi_ = elementify2 {-  -} "bdi" []

bdo
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBdoElement ()))))
  -> Array Nut
  -> Nut
bdo = elementify2 {-  -} "bdo"

bdo_ :: Array Nut -> Nut
bdo_ = elementify2 {-  -} "bdo" []

span
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSpanElement ()))))
  -> Array Nut
  -> Nut
span = elementify2 {-  -} "span"

span_ :: Array Nut -> Nut
span_ = elementify2 {-  -} "span" []

br
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBrElement ()))))
  -> Array Nut
  -> Nut
br = elementify2 {-  -} "br"

br_ :: Array Nut -> Nut
br_ = elementify2 {-  -} "br" []

wbr
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLWbrElement ()))))
  -> Array Nut
  -> Nut
wbr = elementify2 {-  -} "wbr"

wbr_ :: Array Nut -> Nut
wbr_ = elementify2 {-  -} "wbr" []

ins
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLInsElement ()))))
  -> Array Nut
  -> Nut
ins = elementify2 {-  -} "ins"

ins_ :: Array Nut -> Nut
ins_ = elementify2 {-  -} "ins" []

del
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDelElement ()))))
  -> Array Nut
  -> Nut
del = elementify2 {-  -} "del"

del_ :: Array Nut -> Nut
del_ = elementify2 {-  -} "del" []

picture
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLPictureElement ()))))
  -> Array Nut
  -> Nut
picture = elementify2 {-  -} "picture"

picture_ :: Array Nut -> Nut
picture_ = elementify2 {-  -} "picture" []

source
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSourceElement ()))))
  -> Array Nut
  -> Nut
source = elementify2 {-  -} "source"

source_ :: Array Nut -> Nut
source_ = elementify2 {-  -} "source" []

img
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLImgElement ()))))
  -> Array Nut
  -> Nut
img = elementify2 {-  -} "img"

img_ :: Array Nut -> Nut
img_ = elementify2 {-  -} "img" []

iframe
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLIframeElement ()))))
  -> Array Nut
  -> Nut
iframe = elementify2 {-  -} "iframe"

iframe_ :: Array Nut -> Nut
iframe_ = elementify2 {-  -} "iframe" []

embed
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLEmbedElement ()))))
  -> Array Nut
  -> Nut
embed = elementify2 {-  -} "embed"

embed_ :: Array Nut -> Nut
embed_ = elementify2 {-  -} "embed" []

object
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLObjectElement ()))))
  -> Array Nut
  -> Nut
object = elementify2 {-  -} "object"

object_ :: Array Nut -> Nut
object_ = elementify2 {-  -} "object" []

video
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLVideoElement ()))))
  -> Array Nut
  -> Nut
video = elementify2 {-  -} "video"

video_ :: Array Nut -> Nut
video_ = elementify2 {-  -} "video" []

audio
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAudioElement ()))))
  -> Array Nut
  -> Nut
audio = elementify2 {-  -} "audio"

audio_ :: Array Nut -> Nut
audio_ = elementify2 {-  -} "audio" []

track
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTrackElement ()))))
  -> Array Nut
  -> Nut
track = elementify2 {-  -} "track"

track_ :: Array Nut -> Nut
track_ = elementify2 {-  -} "track" []

map
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMapElement ()))))
  -> Array Nut
  -> Nut
map = elementify2 {-  -} "map"

map_ :: Array Nut -> Nut
map_ = elementify2 {-  -} "map" []

area
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAreaElement ()))))
  -> Array Nut
  -> Nut
area = elementify2 {-  -} "area"

area_ :: Array Nut -> Nut
area_ = elementify2 {-  -} "area" []

table
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTableElement ()))))
  -> Array Nut
  -> Nut
table = elementify2 {-  -} "table"

table_ :: Array Nut -> Nut
table_ = elementify2 {-  -} "table" []

caption
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLCaptionElement ()))))
  -> Array Nut
  -> Nut
caption = elementify2 {-  -} "caption"

caption_ :: Array Nut -> Nut
caption_ = elementify2 {-  -} "caption" []

colgroup
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLColgroupElement ()))))
  -> Array Nut
  -> Nut
colgroup = elementify2 {-  -} "colgroup"

colgroup_ :: Array Nut -> Nut
colgroup_ = elementify2 {-  -} "colgroup" []

col
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLColElement ()))))
  -> Array Nut
  -> Nut
col = elementify2 {-  -} "col"

col_ :: Array Nut -> Nut
col_ = elementify2 {-  -} "col" []

tbody
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTbodyElement ()))))
  -> Array Nut
  -> Nut
tbody = elementify2 {-  -} "tbody"

tbody_ :: Array Nut -> Nut
tbody_ = elementify2 {-  -} "tbody" []

thead
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTheadElement ()))))
  -> Array Nut
  -> Nut
thead = elementify2 {-  -} "thead"

thead_ :: Array Nut -> Nut
thead_ = elementify2 {-  -} "thead" []

tfoot
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTfootElement ()))))
  -> Array Nut
  -> Nut
tfoot = elementify2 {-  -} "tfoot"

tfoot_ :: Array Nut -> Nut
tfoot_ = elementify2 {-  -} "tfoot" []

tr
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTrElement ()))))
  -> Array Nut
  -> Nut
tr = elementify2 {-  -} "tr"

tr_ :: Array Nut -> Nut
tr_ = elementify2 {-  -} "tr" []

td
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTdElement ()))))
  -> Array Nut
  -> Nut
td = elementify2 {-  -} "td"

td_ :: Array Nut -> Nut
td_ = elementify2 {-  -} "td" []

th
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLThElement ()))))
  -> Array Nut
  -> Nut
th = elementify2 {-  -} "th"

th_ :: Array Nut -> Nut
th_ = elementify2 {-  -} "th" []

form
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFormElement ()))))
  -> Array Nut
  -> Nut
form = elementify2 {-  -} "form"

form_ :: Array Nut -> Nut
form_ = elementify2 {-  -} "form" []

label
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLLabelElement ()))))
  -> Array Nut
  -> Nut
label = elementify2 {-  -} "label"

label_ :: Array Nut -> Nut
label_ = elementify2 {-  -} "label" []

input
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLInputElement ()))))
  -> Array Nut
  -> Nut
input = elementify2 {-  -} "input"

input_ :: Array Nut -> Nut
input_ = elementify2 {-  -} "input" []

button
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLButtonElement ()))))
  -> Array Nut
  -> Nut
button = elementify2 {-  -} "button"

button_ :: Array Nut -> Nut
button_ = elementify2 {-  -} "button" []

select
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSelectElement ()))))
  -> Array Nut
  -> Nut
select = elementify2 {-  -} "select"

select_ :: Array Nut -> Nut
select_ = elementify2 {-  -} "select" []

datalist
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDatalistElement ()))))
  -> Array Nut
  -> Nut
datalist = elementify2 {-  -} "datalist"

datalist_ :: Array Nut -> Nut
datalist_ = elementify2 {-  -} "datalist" []

optgroup
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLOptgroupElement ()))))
  -> Array Nut
  -> Nut
optgroup = elementify2 {-  -} "optgroup"

optgroup_ :: Array Nut -> Nut
optgroup_ = elementify2 {-  -} "optgroup" []

option
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLOptionElement ()))))
  -> Array Nut
  -> Nut
option = elementify2 {-  -} "option"

option_ :: Array Nut -> Nut
option_ = elementify2 {-  -} "option" []

textarea
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTextareaElement ()))))
  -> Array Nut
  -> Nut
textarea = elementify2 {-  -} "textarea"

textarea_ :: Array Nut -> Nut
textarea_ = elementify2 {-  -} "textarea" []

output
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLOutputElement ()))))
  -> Array Nut
  -> Nut
output = elementify2 {-  -} "output"

output_ :: Array Nut -> Nut
output_ = elementify2 {-  -} "output" []

progress
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLProgressElement ()))))
  -> Array Nut
  -> Nut
progress = elementify2 {-  -} "progress"

progress_ :: Array Nut -> Nut
progress_ = elementify2 {-  -} "progress" []

meter
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMeterElement ()))))
  -> Array Nut
  -> Nut
meter = elementify2 {-  -} "meter"

meter_ :: Array Nut -> Nut
meter_ = elementify2 {-  -} "meter" []

fieldset
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFieldsetElement ()))))
  -> Array Nut
  -> Nut
fieldset = elementify2 {-  -} "fieldset"

fieldset_ :: Array Nut -> Nut
fieldset_ = elementify2 {-  -} "fieldset" []

legend
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLLegendElement ()))))
  -> Array Nut
  -> Nut
legend = elementify2 {-  -} "legend"

legend_ :: Array Nut -> Nut
legend_ = elementify2 {-  -} "legend" []

details
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDetailsElement ()))))
  -> Array Nut
  -> Nut
details = elementify2 {-  -} "details"

details_ :: Array Nut -> Nut
details_ = elementify2 {-  -} "details" []

summary
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSummaryElement ()))))
  -> Array Nut
  -> Nut
summary = elementify2 {-  -} "summary"

summary_ :: Array Nut -> Nut
summary_ = elementify2 {-  -} "summary" []

dialog
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDialogElement ()))))
  -> Array Nut
  -> Nut
dialog = elementify2 {-  -} "dialog"

dialog_ :: Array Nut -> Nut
dialog_ = elementify2 {-  -} "dialog" []

script
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLScriptElement ()))))
  -> Array Nut
  -> Nut
script = elementify2 {-  -} "script"

script_ :: Array Nut -> Nut
script_ = elementify2 {-  -} "script" []

noscript
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNoscriptElement ()))))
  -> Array Nut
  -> Nut
noscript = elementify2 {-  -} "noscript"

noscript_ :: Array Nut -> Nut
noscript_ = elementify2 {-  -} "noscript" []

template
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTemplateElement ()))))
  -> Array Nut
  -> Nut
template = elementify2 {-  -} "template"

template_ :: Array Nut -> Nut
template_ = elementify2 {-  -} "template" []

slot
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSlotElement ()))))
  -> Array Nut
  -> Nut
slot = elementify2 {-  -} "slot"

slot_ :: Array Nut -> Nut
slot_ = elementify2 {-  -} "slot" []

canvas
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLCanvasElement ()))))
  -> Array Nut
  -> Nut
canvas = elementify2 {-  -} "canvas"

canvas_ :: Array Nut -> Nut
canvas_ = elementify2 {-  -} "canvas" []

applet
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAppletElement ()))))
  -> Array Nut
  -> Nut
applet = elementify2 {-  -} "applet"

applet_ :: Array Nut -> Nut
applet_ = elementify2 {-  -} "applet" []

acronym
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLAcronymElement ()))))
  -> Array Nut
  -> Nut
acronym = elementify2 {-  -} "acronym"

acronym_ :: Array Nut -> Nut
acronym_ = elementify2 {-  -} "acronym" []

bgsound
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBgsoundElement ()))))
  -> Array Nut
  -> Nut
bgsound = elementify2 {-  -} "bgsound"

bgsound_ :: Array Nut -> Nut
bgsound_ = elementify2 {-  -} "bgsound" []

dir
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLDirElement ()))))
  -> Array Nut
  -> Nut
dir = elementify2 {-  -} "dir"

dir_ :: Array Nut -> Nut
dir_ = elementify2 {-  -} "dir" []

noframes
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNoframesElement ()))))
  -> Array Nut
  -> Nut
noframes = elementify2 {-  -} "noframes"

noframes_ :: Array Nut -> Nut
noframes_ = elementify2 {-  -} "noframes" []

isindex
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLIsindexElement ()))))
  -> Array Nut
  -> Nut
isindex = elementify2 {-  -} "isindex"

isindex_ :: Array Nut -> Nut
isindex_ = elementify2 {-  -} "isindex" []

keygen
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLKeygenElement ()))))
  -> Array Nut
  -> Nut
keygen = elementify2 {-  -} "keygen"

keygen_ :: Array Nut -> Nut
keygen_ = elementify2 {-  -} "keygen" []

listing
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLListingElement ()))))
  -> Array Nut
  -> Nut
listing = elementify2 {-  -} "listing"

listing_ :: Array Nut -> Nut
listing_ = elementify2 {-  -} "listing" []

menuitem
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMenuitemElement ()))))
  -> Array Nut
  -> Nut
menuitem = elementify2 {-  -} "menuitem"

menuitem_ :: Array Nut -> Nut
menuitem_ = elementify2 {-  -} "menuitem" []

nextid
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNextidElement ()))))
  -> Array Nut
  -> Nut
nextid = elementify2 {-  -} "nextid"

nextid_ :: Array Nut -> Nut
nextid_ = elementify2 {-  -} "nextid" []

noembed
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNoembedElement ()))))
  -> Array Nut
  -> Nut
noembed = elementify2 {-  -} "noembed"

noembed_ :: Array Nut -> Nut
noembed_ = elementify2 {-  -} "noembed" []

param
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLParamElement ()))))
  -> Array Nut
  -> Nut
param = elementify2 {-  -} "param"

param_ :: Array Nut -> Nut
param_ = elementify2 {-  -} "param" []

plaintext
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLPlaintextElement ()))))
  -> Array Nut
  -> Nut
plaintext = elementify2 {-  -} "plaintext"

plaintext_ :: Array Nut -> Nut
plaintext_ = elementify2 {-  -} "plaintext" []

rb
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLRbElement ()))))
  -> Array Nut
  -> Nut
rb = elementify2 {-  -} "rb"

rb_ :: Array Nut -> Nut
rb_ = elementify2 {-  -} "rb" []

rtc
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLRtcElement ()))))
  -> Array Nut
  -> Nut
rtc = elementify2 {-  -} "rtc"

rtc_ :: Array Nut -> Nut
rtc_ = elementify2 {-  -} "rtc" []

strike
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLStrikeElement ()))))
  -> Array Nut
  -> Nut
strike = elementify2 {-  -} "strike"

strike_ :: Array Nut -> Nut
strike_ = elementify2 {-  -} "strike" []

xmp
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLXmpElement ()))))
  -> Array Nut
  -> Nut
xmp = elementify2 {-  -} "xmp"

xmp_ :: Array Nut -> Nut
xmp_ = elementify2 {-  -} "xmp" []

basefont
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBasefontElement ()))))
  -> Array Nut
  -> Nut
basefont = elementify2 {-  -} "basefont"

basefont_ :: Array Nut -> Nut
basefont_ = elementify2 {-  -} "basefont" []

big
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBigElement ()))))
  -> Array Nut
  -> Nut
big = elementify2 {-  -} "big"

big_ :: Array Nut -> Nut
big_ = elementify2 {-  -} "big" []

blink
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLBlinkElement ()))))
  -> Array Nut
  -> Nut
blink = elementify2 {-  -} "blink"

blink_ :: Array Nut -> Nut
blink_ = elementify2 {-  -} "blink" []

center
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLCenterElement ()))))
  -> Array Nut
  -> Nut
center = elementify2 {-  -} "center"

center_ :: Array Nut -> Nut
center_ = elementify2 {-  -} "center" []

font
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFontElement ()))))
  -> Array Nut
  -> Nut
font = elementify2 {-  -} "font"

font_ :: Array Nut -> Nut
font_ = elementify2 {-  -} "font" []

multicol
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMulticolElement ()))))
  -> Array Nut
  -> Nut
multicol = elementify2 {-  -} "multicol"

multicol_ :: Array Nut -> Nut
multicol_ = elementify2 {-  -} "multicol" []

nobr
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLNobrElement ()))))
  -> Array Nut
  -> Nut
nobr = elementify2 {-  -} "nobr"

nobr_ :: Array Nut -> Nut
nobr_ = elementify2 {-  -} "nobr" []

spacer
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLSpacerElement ()))))
  -> Array Nut
  -> Nut
spacer = elementify2 {-  -} "spacer"

spacer_ :: Array Nut -> Nut
spacer_ = elementify2 {-  -} "spacer" []

tt
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLTtElement ()))))
  -> Array Nut
  -> Nut
tt = elementify2 {-  -} "tt"

tt_ :: Array Nut -> Nut
tt_ = elementify2 {-  -} "tt" []

marquee
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLMarqueeElement ()))))
  -> Array Nut
  -> Nut
marquee = elementify2 {-  -} "marquee"

marquee_ :: Array Nut -> Nut
marquee_ = elementify2 {-  -} "marquee" []

frameset
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFramesetElement ()))))
  -> Array Nut
  -> Nut
frameset = elementify2 {-  -} "frameset"

frameset_ :: Array Nut -> Nut
frameset_ = elementify2 {-  -} "frameset" []

frame
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (HTMLFrameElement ()))))
  -> Array Nut
  -> Nut
frame = elementify2 {-  -} "frame"

frame_ :: Array Nut -> Nut
frame_ = elementify2 {-  -} "frame" []

class Iscrossorigin (v :: Type) (a :: Type) | v -> a where
  iscrossorigin :: v -> Deku.Attribute.AttributeValue

instance Iscrossorigin String String where
  iscrossorigin = Deku.Attribute.prop'

instance Iscrossorigin (Index.Keyword "use-credentials") String where
  iscrossorigin = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iscrossorigin (Index.Keyword "anonymous") String where
  iscrossorigin = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_crossorigin
  :: forall r v a
   . Iscrossorigin v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (crossorigin :: a | r)))
_crossorigin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "crossorigin", value: _ } <<< iscrossorigin)

_crossorigin_
  :: forall r v a
   . Iscrossorigin v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (crossorigin :: a | r)))
_crossorigin_ = _crossorigin <<< Applicative.pure

class Isloading (v :: Type) (a :: Type) | v -> a where
  isloading :: v -> Deku.Attribute.AttributeValue

instance Isloading String String where
  isloading = Deku.Attribute.prop'

instance Isloading (Index.Keyword "eager") String where
  isloading = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isloading (Index.Keyword "lazy") String where
  isloading = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_loading
  :: forall r v a
   . Isloading v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (loading :: a | r)))
_loading = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "loading", value: _ } <<< isloading)

_loading_
  :: forall r v a
   . Isloading v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (loading :: a | r)))
_loading_ = _loading <<< Applicative.pure

class Isfetchpriority (v :: Type) (a :: Type) | v -> a where
  isfetchpriority :: v -> Deku.Attribute.AttributeValue

instance Isfetchpriority String String where
  isfetchpriority = Deku.Attribute.prop'

instance Isfetchpriority (Index.Keyword "auto") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isfetchpriority (Index.Keyword "low") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isfetchpriority (Index.Keyword "high") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_fetchpriority
  :: forall r v a
   . Isfetchpriority v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (fetchpriority :: a | r)))
_fetchpriority = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "fetchpriority", value: _ } <<< isfetchpriority)

_fetchpriority_
  :: forall r v a
   . Isfetchpriority v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (fetchpriority :: a | r)))
_fetchpriority_ = _fetchpriority <<< Applicative.pure

class Isdir (v :: Type) (a :: Type) | v -> a where
  isdir :: v -> Deku.Attribute.AttributeValue

instance Isdir String String where
  isdir = Deku.Attribute.prop'

instance Isdir (Index.Keyword "auto") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdir (Index.Keyword "rtl") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdir (Index.Keyword "ltr") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_dir
  :: forall r v a
   . Isdir v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (dir :: a | r)))
_dir = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "dir", value: _ } <<< isdir)

_dir_
  :: forall r v a
   . Isdir v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (dir :: a | r)))
_dir_ = _dir <<< Applicative.pure

class Isname (v :: Type) (a :: Type) | v -> a where
  isname :: v -> Deku.Attribute.AttributeValue

instance Isname String String where
  isname = Deku.Attribute.prop'

instance Isname (Index.Keyword "color-scheme") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "theme-color") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "referrer") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "keywords") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "generator") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "description") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "author") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Index.Keyword "application-name") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_name
  :: forall r v a
   . Isname v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (name :: a | r)))
_name = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "name", value: _ } <<< isname)

_name_
  :: forall r v a
   . Isname v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (name :: a | r)))
_name_ = _name <<< Applicative.pure

class IshttpEquiv (v :: Type) (a :: Type) | v -> a where
  ishttpEquiv :: v -> Deku.Attribute.AttributeValue

instance IshttpEquiv String String where
  ishttpEquiv = Deku.Attribute.prop'

instance IshttpEquiv (Index.Keyword "content-security-policy") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "x-ua-compatible") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "set-cookie") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "refresh") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "default-style") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "content-type") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Index.Keyword "content-language") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_httpEquiv
  :: forall r v a
   . IshttpEquiv v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (httpEquiv :: a | r)))
_httpEquiv = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "http-equiv", value: _ } <<< ishttpEquiv)

_httpEquiv_
  :: forall r v a
   . IshttpEquiv v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (httpEquiv :: a | r)))
_httpEquiv_ = _httpEquiv <<< Applicative.pure

class Istype (v :: Type) (a :: Type) | v -> a where
  istype :: v -> Deku.Attribute.AttributeValue

instance Istype String String where
  istype = Deku.Attribute.prop'

instance Istype (Index.Keyword "button") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "reset") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "submit") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "image") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "file") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "radio") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "checkbox") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "color") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "range") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "number") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "datetime-local") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "time") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "week") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "month") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "date") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "password") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "email") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "url") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "tel") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "search") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "text") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "hidden") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "I") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "i") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "A") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "a") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Index.Keyword "1") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_type
  :: forall r v a
   . Istype v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (type :: a | r)))
_type = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "type", value: _ } <<< istype)

_type_
  :: forall r v a
   . Istype v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (type :: a | r)))
_type_ = _type <<< Applicative.pure

class Isrel (v :: Type) (a :: Type) | v -> a where
  isrel :: v -> Deku.Attribute.AttributeValue

instance Isrel String String where
  isrel = Deku.Attribute.prop'

instance Isrel (Index.Keyword "prev") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "next") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "tag") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "stylesheet") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "search") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "preload") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "prefetch") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "preconnect") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "pingback") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "opener") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "noreferrer") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "noopener") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "nofollow") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "modulepreload") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "manifest") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "license") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "icon") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "help") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "external") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "dns-prefetch") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "canonical") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "bookmark") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "author") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Index.Keyword "alternate") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_rel
  :: forall r v a
   . Isrel v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rel :: a | r)))
_rel = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "rel", value: _ } <<< isrel)

_rel_
  :: forall r v a
   . Isrel v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rel :: a | r)))
_rel_ = _rel <<< Applicative.pure

class Isdecoding (v :: Type) (a :: Type) | v -> a where
  isdecoding :: v -> Deku.Attribute.AttributeValue

instance Isdecoding String String where
  isdecoding = Deku.Attribute.prop'

instance Isdecoding (Index.Keyword "auto") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdecoding (Index.Keyword "async") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdecoding (Index.Keyword "sync") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_decoding
  :: forall r v a
   . Isdecoding v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (decoding :: a | r)))
_decoding = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "decoding", value: _ } <<< isdecoding)

_decoding_
  :: forall r v a
   . Isdecoding v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (decoding :: a | r)))
_decoding_ = _decoding <<< Applicative.pure

class Iskind (v :: Type) (a :: Type) | v -> a where
  iskind :: v -> Deku.Attribute.AttributeValue

instance Iskind String String where
  iskind = Deku.Attribute.prop'

instance Iskind (Index.Keyword "metadata") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Index.Keyword "chapters") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Index.Keyword "descriptions") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Index.Keyword "captions") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Index.Keyword "subtitles") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_kind
  :: forall r v a
   . Iskind v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (kind :: a | r)))
_kind = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "kind", value: _ } <<< iskind)

_kind_
  :: forall r v a
   . Iskind v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (kind :: a | r)))
_kind_ = _kind <<< Applicative.pure

class Ispreload (v :: Type) (a :: Type) | v -> a where
  ispreload :: v -> Deku.Attribute.AttributeValue

instance Ispreload String String where
  ispreload = Deku.Attribute.prop'

instance Ispreload (Index.Keyword "auto") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispreload (Index.Keyword "metadata") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispreload (Index.Keyword "none") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_preload
  :: forall r v a
   . Ispreload v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (preload :: a | r)))
_preload = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "preload", value: _ } <<< ispreload)

_preload_
  :: forall r v a
   . Ispreload v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (preload :: a | r)))
_preload_ = _preload <<< Applicative.pure

class Isshape (v :: Type) (a :: Type) | v -> a where
  isshape :: v -> Deku.Attribute.AttributeValue

instance Isshape String String where
  isshape = Deku.Attribute.prop'

instance Isshape (Index.Keyword "rectangle state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Index.Keyword "polygon state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Index.Keyword "default state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Index.Keyword "circle state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_shape
  :: forall r v a
   . Isshape v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (shape :: a | r)))
_shape = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "shape", value: _ } <<< isshape)

_shape_
  :: forall r v a
   . Isshape v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (shape :: a | r)))
_shape_ = _shape <<< Applicative.pure

class Isscope (v :: Type) (a :: Type) | v -> a where
  isscope :: v -> Deku.Attribute.AttributeValue

instance Isscope String String where
  isscope = Deku.Attribute.prop'

instance Isscope (Index.Keyword "auto") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Index.Keyword "colgroup") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Index.Keyword "rowgroup") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Index.Keyword "col") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Index.Keyword "row") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_scope
  :: forall r v a
   . Isscope v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scope :: a | r)))
_scope = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "scope", value: _ } <<< isscope)

_scope_
  :: forall r v a
   . Isscope v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scope :: a | r)))
_scope_ = _scope <<< Applicative.pure

class Iswrap (v :: Type) (a :: Type) | v -> a where
  iswrap :: v -> Deku.Attribute.AttributeValue

instance Iswrap String String where
  iswrap = Deku.Attribute.prop'

instance Iswrap (Index.Keyword "hard") String where
  iswrap = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iswrap (Index.Keyword "soft") String where
  iswrap = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_wrap
  :: forall r v a
   . Iswrap v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (wrap :: a | r)))
_wrap = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "wrap", value: _ } <<< iswrap)

_wrap_
  :: forall r v a
   . Iswrap v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (wrap :: a | r)))
_wrap_ = _wrap <<< Applicative.pure

class Ismethod (v :: Type) (a :: Type) | v -> a where
  ismethod :: v -> Deku.Attribute.AttributeValue

instance Ismethod String String where
  ismethod = Deku.Attribute.prop'

instance Ismethod (Index.Keyword "dialog") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ismethod (Index.Keyword "post") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ismethod (Index.Keyword "get") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_method
  :: forall r v a
   . Ismethod v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (method :: a | r)))
_method = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "method", value: _ } <<< ismethod)

_method_
  :: forall r v a
   . Ismethod v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (method :: a | r)))
_method_ = _method <<< Applicative.pure

class Isenctype (v :: Type) (a :: Type) | v -> a where
  isenctype :: v -> Deku.Attribute.AttributeValue

instance Isenctype String String where
  isenctype = Deku.Attribute.prop'

instance Isenctype (Index.Keyword "text/plain") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenctype (Index.Keyword "multipart/form-data") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenctype (Index.Keyword "application/x-www-form-urlencoded") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_enctype
  :: forall r v a
   . Isenctype v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (enctype :: a | r)))
_enctype = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "enctype", value: _ } <<< isenctype)

_enctype_
  :: forall r v a
   . Isenctype v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (enctype :: a | r)))
_enctype_ = _enctype <<< Applicative.pure

class Isautocomplete (v :: Type) (a :: Type) | v -> a where
  isautocomplete :: v -> Deku.Attribute.AttributeValue

instance Isautocomplete String String where
  isautocomplete = Deku.Attribute.prop'

instance Isautocomplete (Index.Keyword "impp") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "email") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-extension") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-local-suffix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-local-prefix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-local") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-area-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-national") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel-country-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "tel") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "photo") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "url") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "sex") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "bday-year") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "bday-month") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "bday-day") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "bday") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "language") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "transaction-amount") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "transaction-currency") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-type") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-csc") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-exp-year") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-exp-month") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-exp") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-number") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-family-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-additional-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-given-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "cc-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "postal-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "country-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "country") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-level1") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-level2") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-level3") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-level4") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-line3") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-line2") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "address-line1") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "street-address") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "organization") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "one-time-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "current-password") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "new-password") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "username") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "organization-title") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "nickname") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "honorific-suffix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "family-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "additional-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "given-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "honorific-prefix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "on") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "off") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "pager") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "fax") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "mobile") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "work") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "home") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "billing") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Index.Keyword "shipping") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_autocomplete
  :: forall r v a
   . Isautocomplete v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autocomplete :: a | r)))
_autocomplete = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "autocomplete", value: _ } <<< isautocomplete)

_autocomplete_
  :: forall r v a
   . Isautocomplete v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autocomplete :: a | r)))
_autocomplete_ = _autocomplete <<< Applicative.pure

class Isentry (v :: Type) (a :: Type) | v -> a where
  isentry :: v -> Deku.Attribute.AttributeValue

instance Isentry (Index.Keyword "value") String where
  isentry = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isentry (Index.Keyword "name") String where
  isentry = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_entry
  :: forall r v a
   . Isentry v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (entry :: a | r)))
_entry = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "entry", value: _ } <<< isentry)

_entry_
  :: forall r v a
   . Isentry v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (entry :: a | r)))
_entry_ = _entry <<< Applicative.pure

class Ishidden (v :: Type) (a :: Type) | v -> a where
  ishidden :: v -> Deku.Attribute.AttributeValue

instance Ishidden String String where
  ishidden = Deku.Attribute.prop'

instance Ishidden (Index.Keyword "hidden") String where
  ishidden = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ishidden (Index.Keyword "until-found") String where
  ishidden = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_hidden
  :: forall r v a
   . Ishidden v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hidden :: a | r)))
_hidden = Functor.map (Deku.Attribute.unsafeAttribute <<< { key: "hidden", value: _ } <<< ishidden)

_hidden_
  :: forall r v a
   . Ishidden v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hidden :: a | r)))
_hidden_ = _hidden <<< Applicative.pure

class Isautocapitalize (v :: Type) (a :: Type) | v -> a where
  isautocapitalize :: v -> Deku.Attribute.AttributeValue

instance Isautocapitalize String String where
  isautocapitalize = Deku.Attribute.prop'

instance Isautocapitalize (Index.Keyword "characters") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Index.Keyword "words") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Index.Keyword "sentences") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Index.Keyword "on") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Index.Keyword "none") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Index.Keyword "off") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_autocapitalize
  :: forall r v a
   . Isautocapitalize v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autocapitalize :: a | r)))
_autocapitalize = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "autocapitalize", value: _ } <<< isautocapitalize)

_autocapitalize_
  :: forall r v a
   . Isautocapitalize v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autocapitalize :: a | r)))
_autocapitalize_ = _autocapitalize <<< Applicative.pure

class Isinputmode (v :: Type) (a :: Type) | v -> a where
  isinputmode :: v -> Deku.Attribute.AttributeValue

instance Isinputmode String String where
  isinputmode = Deku.Attribute.prop'

instance Isinputmode (Index.Keyword "search") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "decimal") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "numeric") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "email") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "url") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "tel") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "text") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Index.Keyword "none") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_inputmode
  :: forall r v a
   . Isinputmode v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (inputmode :: a | r)))
_inputmode = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "inputmode", value: _ } <<< isinputmode)

_inputmode_
  :: forall r v a
   . Isinputmode v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (inputmode :: a | r)))
_inputmode_ = _inputmode <<< Applicative.pure

class Isenterkeyhint (v :: Type) (a :: Type) | v -> a where
  isenterkeyhint :: v -> Deku.Attribute.AttributeValue

instance Isenterkeyhint String String where
  isenterkeyhint = Deku.Attribute.prop'

instance Isenterkeyhint (Index.Keyword "send") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "search") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "previous") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "next") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "go") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "done") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Index.Keyword "enter") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_enterkeyhint
  :: forall r v a
   . Isenterkeyhint v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (enterkeyhint :: a | r)))
_enterkeyhint = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "enterkeyhint", value: _ } <<< isenterkeyhint)

_enterkeyhint_
  :: forall r v a
   . Isenterkeyhint v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (enterkeyhint :: a | r)))
_enterkeyhint_ = _enterkeyhint <<< Applicative.pure

class Ispopover (v :: Type) (a :: Type) | v -> a where
  ispopover :: v -> Deku.Attribute.AttributeValue

instance Ispopover String String where
  ispopover = Deku.Attribute.prop'

instance Ispopover (Index.Keyword "manual") String where
  ispopover = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopover (Index.Keyword "auto") String where
  ispopover = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_popover
  :: forall r v a
   . Ispopover v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popover :: a | r)))
_popover = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "popover", value: _ } <<< ispopover)

_popover_
  :: forall r v a
   . Ispopover v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popover :: a | r)))
_popover_ = _popover <<< Applicative.pure

class Ispopovertargetaction (v :: Type) (a :: Type) | v -> a where
  ispopovertargetaction :: v -> Deku.Attribute.AttributeValue

instance Ispopovertargetaction String String where
  ispopovertargetaction = Deku.Attribute.prop'

instance Ispopovertargetaction (Index.Keyword "hide") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopovertargetaction (Index.Keyword "show") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopovertargetaction (Index.Keyword "toggle") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_popovertargetaction
  :: forall r v a
   . Ispopovertargetaction v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popovertargetaction :: a | r)))
_popovertargetaction = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "popovertargetaction", value: _ } <<<
      ispopovertargetaction
  )

_popovertargetaction_
  :: forall r v a
   . Ispopovertargetaction v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popovertargetaction :: a | r)))
_popovertargetaction_ = _popovertargetaction <<< Applicative.pure

class Issandbox (v :: Type) (a :: Type) | v -> a where
  issandbox :: v -> Deku.Attribute.AttributeValue

instance Issandbox String String where
  issandbox = Deku.Attribute.prop'

instance Issandbox (Index.Keyword "allow-top-navigation-to-custom-protocols") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-downloads") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-presentation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-orientation-lock") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-modals") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-popups-to-escape-sandbox") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-scripts") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-pointer-lock") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-forms") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-same-origin") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-top-navigation-by-user-activation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-top-navigation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Index.Keyword "allow-popups") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_sandbox
  :: forall r v a
   . Issandbox v a
  => FRP.Event.Event v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (sandbox :: a | r)))
_sandbox = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "sandbox", value: _ } <<< issandbox)

_sandbox_
  :: forall r v a
   . Issandbox v a
  => v
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (sandbox :: a | r)))
_sandbox_ = _sandbox <<< Applicative.pure

_version
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (version :: String | r)))
_version = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "version", value: _ } <<< Deku.Attribute.prop')

_version_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (version :: String | r)))
_version_ = _version <<< Applicative.pure

_manifest
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (manifest :: String | r)))
_manifest = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "manifest", value: _ } <<< Deku.Attribute.prop')

_manifest_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (manifest :: String | r)))
_manifest_ = _manifest <<< Applicative.pure

_profile
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (profile :: String | r)))
_profile = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "profile", value: _ } <<< Deku.Attribute.prop')

_profile_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (profile :: String | r)))
_profile_ = _profile <<< Applicative.pure

_target
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (target :: String | r)))
_target = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop')

_target_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (target :: String | r)))
_target_ = _target <<< Applicative.pure

_href
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (href :: String | r)))
_href = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop')

_href_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (href :: String | r)))
_href_ = _href <<< Applicative.pure

_urn
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (urn :: String | r)))
_urn = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "urn", value: _ } <<< Deku.Attribute.prop')

_urn_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (urn :: String | r)))
_urn_ = _urn <<< Applicative.pure

_rev
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rev :: String | r)))
_rev = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rev", value: _ } <<< Deku.Attribute.prop')

_rev_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rev :: String | r)))
_rev_ = _rev <<< Applicative.pure

_methods
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (methods :: String | r)))
_methods = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "methods", value: _ } <<< Deku.Attribute.prop')

_methods_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (methods :: String | r)))
_methods_ = _methods <<< Applicative.pure

_charset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (charset :: String | r)))
_charset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "charset", value: _ } <<< Deku.Attribute.prop')

_charset_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (charset :: String | r)))
_charset_ = _charset <<< Applicative.pure

_disabled
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (disabled :: String | r)))
_disabled = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop')

_disabled_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (disabled :: String | r)))
_disabled_ = _disabled <<< Applicative.pure

_color
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (color :: String | r)))
_color = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "color", value: _ } <<< Deku.Attribute.prop')

_color_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (color :: String | r)))
_color_ = _color <<< Applicative.pure

_blocking
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (blocking :: String | r)))
_blocking = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "blocking", value: _ } <<< Deku.Attribute.prop')

_blocking_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (blocking :: String | r)))
_blocking_ = _blocking <<< Applicative.pure

_as
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (as :: String | r)))
_as = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "as", value: _ } <<< Deku.Attribute.prop')

_as_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (as :: String | r)))
_as_ = _as <<< Applicative.pure

_sizes
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (sizes :: String | r)))
_sizes = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "sizes", value: _ } <<< Deku.Attribute.prop')

_sizes_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (sizes :: String | r)))
_sizes_ = _sizes <<< Applicative.pure

_imagesizes
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (imagesizes :: String | r)))
_imagesizes = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "imagesizes", value: _ } <<< Deku.Attribute.prop')

_imagesizes_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (imagesizes :: String | r)))
_imagesizes_ = _imagesizes <<< Applicative.pure

_imagesrcset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (imagesrcset :: String | r)))
_imagesrcset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "imagesrcset", value: _ } <<< Deku.Attribute.prop')

_imagesrcset_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (imagesrcset :: String | r)))
_imagesrcset_ = _imagesrcset <<< Applicative.pure

_title
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (title :: String | r)))
_title = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "title", value: _ } <<< Deku.Attribute.prop')

_title_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (title :: String | r)))
_title_ = _title <<< Applicative.pure

_referrerpolicy
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (referrerpolicy :: String | r)))
_referrerpolicy = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "referrerpolicy", value: _ } <<< Deku.Attribute.prop')

_referrerpolicy_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (referrerpolicy :: String | r)))
_referrerpolicy_ = _referrerpolicy <<< Applicative.pure

_hreflang
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hreflang :: String | r)))
_hreflang = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "hreflang", value: _ } <<< Deku.Attribute.prop')

_hreflang_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hreflang :: String | r)))
_hreflang_ = _hreflang <<< Applicative.pure

_integrity
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (integrity :: String | r)))
_integrity = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "integrity", value: _ } <<< Deku.Attribute.prop')

_integrity_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (integrity :: String | r)))
_integrity_ = _integrity <<< Applicative.pure

_media
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (media :: String | r)))
_media = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop')

_media_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (media :: String | r)))
_media_ = _media <<< Applicative.pure

_scheme
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scheme :: String | r)))
_scheme = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "scheme", value: _ } <<< Deku.Attribute.prop')

_scheme_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scheme :: String | r)))
_scheme_ = _scheme <<< Applicative.pure

_content
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (content :: String | r)))
_content = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "content", value: _ } <<< Deku.Attribute.prop')

_content_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (content :: String | r)))
_content_ = _content <<< Applicative.pure

_vlink
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (vlink :: String | r)))
_vlink = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "vlink", value: _ } <<< Deku.Attribute.prop')

_vlink_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (vlink :: String | r)))
_vlink_ = _vlink <<< Applicative.pure

_topmargin
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (topmargin :: String | r)))
_topmargin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "topmargin", value: _ } <<< Deku.Attribute.prop')

_topmargin_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (topmargin :: String | r)))
_topmargin_ = _topmargin <<< Applicative.pure

_text
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (text :: String | r)))
_text = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "text", value: _ } <<< Deku.Attribute.prop')

_text_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (text :: String | r)))
_text_ = _text <<< Applicative.pure

_rightmargin
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rightmargin :: String | r)))
_rightmargin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rightmargin", value: _ } <<< Deku.Attribute.prop')

_rightmargin_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rightmargin :: String | r)))
_rightmargin_ = _rightmargin <<< Applicative.pure

_marginwidth
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (marginwidth :: String | r)))
_marginwidth = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "marginwidth", value: _ } <<< Deku.Attribute.prop')

_marginwidth_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (marginwidth :: String | r)))
_marginwidth_ = _marginwidth <<< Applicative.pure

_marginheight
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (marginheight :: String | r)))
_marginheight = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "marginheight", value: _ } <<< Deku.Attribute.prop')

_marginheight_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (marginheight :: String | r)))
_marginheight_ = _marginheight <<< Applicative.pure

_link
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (link :: String | r)))
_link = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "link", value: _ } <<< Deku.Attribute.prop')

_link_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (link :: String | r)))
_link_ = _link <<< Applicative.pure

_leftmargin
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (leftmargin :: String | r)))
_leftmargin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "leftmargin", value: _ } <<< Deku.Attribute.prop')

_leftmargin_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (leftmargin :: String | r)))
_leftmargin_ = _leftmargin <<< Applicative.pure

_bottommargin
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bottommargin :: String | r)))
_bottommargin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "bottommargin", value: _ } <<< Deku.Attribute.prop')

_bottommargin_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bottommargin :: String | r)))
_bottommargin_ = _bottommargin <<< Applicative.pure

_bgcolor
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bgcolor :: String | r)))
_bgcolor = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop')

_bgcolor_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bgcolor :: String | r)))
_bgcolor_ = _bgcolor <<< Applicative.pure

_alink
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (alink :: String | r)))
_alink = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "alink", value: _ } <<< Deku.Attribute.prop')

_alink_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (alink :: String | r)))
_alink_ = _alink <<< Applicative.pure

_align
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (align :: String | r)))
_align = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop')

_align_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (align :: String | r)))
_align_ = _align <<< Applicative.pure

_width
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (width :: String | r)))
_width = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop')

_width_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (width :: String | r)))
_width_ = _width <<< Applicative.pure

_size
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (size :: String | r)))
_size = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "size", value: _ } <<< Deku.Attribute.prop')

_size_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (size :: String | r)))
_size_ = _size <<< Applicative.pure

_noshade
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (noshade :: String | r)))
_noshade = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "noshade", value: _ } <<< Deku.Attribute.prop')

_noshade_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (noshade :: String | r)))
_noshade_ = _noshade <<< Applicative.pure

_cite
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cite :: String | r)))
_cite = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop')

_cite_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cite :: String | r)))
_cite_ = _cite <<< Applicative.pure

_compact
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (compact :: String | r)))
_compact = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop')

_compact_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (compact :: String | r)))
_compact_ = _compact <<< Applicative.pure

_start
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (start :: String | r)))
_start = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "start", value: _ } <<< Deku.Attribute.prop')

_start_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (start :: String | r)))
_start_ = _start <<< Applicative.pure

_reversed
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (reversed :: String | r)))
_reversed = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "reversed", value: _ } <<< Deku.Attribute.prop')

_reversed_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (reversed :: String | r)))
_reversed_ = _reversed <<< Applicative.pure

_label
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (label :: String | r)))
_label = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop')

_label_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (label :: String | r)))
_label_ = _label <<< Applicative.pure

_value
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (value :: String | r)))
_value = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop')

_value_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (value :: String | r)))
_value_ = _value <<< Applicative.pure

_coords
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (coords :: String | r)))
_coords = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "coords", value: _ } <<< Deku.Attribute.prop')

_coords_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (coords :: String | r)))
_coords_ = _coords <<< Applicative.pure

_ping
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ping :: String | r)))
_ping = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "ping", value: _ } <<< Deku.Attribute.prop')

_ping_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ping :: String | r)))
_ping_ = _ping <<< Applicative.pure

_download
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (download :: String | r)))
_download = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "download", value: _ } <<< Deku.Attribute.prop')

_download_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (download :: String | r)))
_download_ = _download <<< Applicative.pure

_datetime
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (datetime :: String | r)))
_datetime = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "datetime", value: _ } <<< Deku.Attribute.prop')

_datetime_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (datetime :: String | r)))
_datetime_ = _datetime <<< Applicative.pure

_clear
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (clear :: String | r)))
_clear = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "clear", value: _ } <<< Deku.Attribute.prop')

_clear_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (clear :: String | r)))
_clear_ = _clear <<< Applicative.pure

_height
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (height :: String | r)))
_height = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop')

_height_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (height :: String | r)))
_height_ = _height <<< Applicative.pure

_src
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (src :: String | r)))
_src = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop')

_src_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (src :: String | r)))
_src_ = _src <<< Applicative.pure

_srcset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srcset :: String | r)))
_srcset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "srcset", value: _ } <<< Deku.Attribute.prop')

_srcset_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srcset :: String | r)))
_srcset_ = _srcset <<< Applicative.pure

_vspace
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (vspace :: String | r)))
_vspace = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop')

_vspace_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (vspace :: String | r)))
_vspace_ = _vspace <<< Applicative.pure

_hspace
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hspace :: String | r)))
_hspace = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop')

_hspace_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (hspace :: String | r)))
_hspace_ = _hspace <<< Applicative.pure

_border
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (border :: String | r)))
_border = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop')

_border_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (border :: String | r)))
_border_ = _border <<< Applicative.pure

_lowsrc
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (lowsrc :: String | r)))
_lowsrc = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "lowsrc", value: _ } <<< Deku.Attribute.prop')

_lowsrc_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (lowsrc :: String | r)))
_lowsrc_ = _lowsrc <<< Applicative.pure

_longdesc
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (longdesc :: String | r)))
_longdesc = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "longdesc", value: _ } <<< Deku.Attribute.prop')

_longdesc_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (longdesc :: String | r)))
_longdesc_ = _longdesc <<< Applicative.pure

_usemap
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (usemap :: String | r)))
_usemap = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "usemap", value: _ } <<< Deku.Attribute.prop')

_usemap_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (usemap :: String | r)))
_usemap_ = _usemap <<< Applicative.pure

_ismap
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ismap :: String | r)))
_ismap = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "ismap", value: _ } <<< Deku.Attribute.prop')

_ismap_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ismap :: String | r)))
_ismap_ = _ismap <<< Applicative.pure

_alt
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (alt :: String | r)))
_alt = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "alt", value: _ } <<< Deku.Attribute.prop')

_alt_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (alt :: String | r)))
_alt_ = _alt <<< Applicative.pure

_scrolling
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scrolling :: String | r)))
_scrolling = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "scrolling", value: _ } <<< Deku.Attribute.prop')

_scrolling_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (scrolling :: String | r)))
_scrolling_ = _scrolling <<< Applicative.pure

_framespacing
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (framespacing :: String | r)))
_framespacing = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "framespacing", value: _ } <<< Deku.Attribute.prop')

_framespacing_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (framespacing :: String | r)))
_framespacing_ = _framespacing <<< Applicative.pure

_frameborder
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (frameborder :: String | r)))
_frameborder = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "frameborder", value: _ } <<< Deku.Attribute.prop')

_frameborder_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (frameborder :: String | r)))
_frameborder_ = _frameborder <<< Applicative.pure

_allowtransparency
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allowtransparency :: String | r)))
_allowtransparency = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "allowtransparency", value: _ } <<<
      Deku.Attribute.prop'
  )

_allowtransparency_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allowtransparency :: String | r)))
_allowtransparency_ = _allowtransparency <<< Applicative.pure

_allowfullscreen
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allowfullscreen :: String | r)))
_allowfullscreen = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "allowfullscreen", value: _ } <<< Deku.Attribute.prop')

_allowfullscreen_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allowfullscreen :: String | r)))
_allowfullscreen_ = _allowfullscreen <<< Applicative.pure

_allow
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allow :: String | r)))
_allow = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "allow", value: _ } <<< Deku.Attribute.prop')

_allow_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (allow :: String | r)))
_allow_ = _allow <<< Applicative.pure

_srcdoc
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srcdoc :: String | r)))
_srcdoc = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "srcdoc", value: _ } <<< Deku.Attribute.prop')

_srcdoc_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srcdoc :: String | r)))
_srcdoc_ = _srcdoc <<< Applicative.pure

_typemustmatch
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (typemustmatch :: String | r)))
_typemustmatch = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "typemustmatch", value: _ } <<< Deku.Attribute.prop')

_typemustmatch_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (typemustmatch :: String | r)))
_typemustmatch_ = _typemustmatch <<< Applicative.pure

_standby
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (standby :: String | r)))
_standby = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "standby", value: _ } <<< Deku.Attribute.prop')

_standby_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (standby :: String | r)))
_standby_ = _standby <<< Applicative.pure

_declare
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (declare :: String | r)))
_declare = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "declare", value: _ } <<< Deku.Attribute.prop')

_declare_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (declare :: String | r)))
_declare_ = _declare <<< Applicative.pure

_codetype
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (codetype :: String | r)))
_codetype = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "codetype", value: _ } <<< Deku.Attribute.prop')

_codetype_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (codetype :: String | r)))
_codetype_ = _codetype <<< Applicative.pure

_codebase
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (codebase :: String | r)))
_codebase = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "codebase", value: _ } <<< Deku.Attribute.prop')

_codebase_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (codebase :: String | r)))
_codebase_ = _codebase <<< Applicative.pure

_code
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (code :: String | r)))
_code = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "code", value: _ } <<< Deku.Attribute.prop')

_code_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (code :: String | r)))
_code_ = _code <<< Applicative.pure

_classid
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (classid :: String | r)))
_classid = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "classid", value: _ } <<< Deku.Attribute.prop')

_classid_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (classid :: String | r)))
_classid_ = _classid <<< Applicative.pure

_archive
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (archive :: String | r)))
_archive = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "archive", value: _ } <<< Deku.Attribute.prop')

_archive_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (archive :: String | r)))
_archive_ = _archive <<< Applicative.pure

_dirname
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (dirname :: String | r)))
_dirname = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop')

_dirname_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (dirname :: String | r)))
_dirname_ = _dirname <<< Applicative.pure

_form
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (form :: String | r)))
_form = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop')

_form_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (form :: String | r)))
_form_ = _form <<< Applicative.pure

_data
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (data :: String | r)))
_data = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "data", value: _ } <<< Deku.Attribute.prop')

_data_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (data :: String | r)))
_data_ = _data <<< Applicative.pure

_muted
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (muted :: String | r)))
_muted = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "muted", value: _ } <<< Deku.Attribute.prop')

_muted_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (muted :: String | r)))
_muted_ = _muted <<< Applicative.pure

_controls
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (controls :: String | r)))
_controls = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "controls", value: _ } <<< Deku.Attribute.prop')

_controls_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (controls :: String | r)))
_controls_ = _controls <<< Applicative.pure

_autoplay
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autoplay :: String | r)))
_autoplay = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "autoplay", value: _ } <<< Deku.Attribute.prop')

_autoplay_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autoplay :: String | r)))
_autoplay_ = _autoplay <<< Applicative.pure

_loop
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (loop :: String | r)))
_loop = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "loop", value: _ } <<< Deku.Attribute.prop')

_loop_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (loop :: String | r)))
_loop_ = _loop <<< Applicative.pure

_playsinline
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (playsinline :: String | r)))
_playsinline = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "playsinline", value: _ } <<< Deku.Attribute.prop')

_playsinline_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (playsinline :: String | r)))
_playsinline_ = _playsinline <<< Applicative.pure

_poster
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (poster :: String | r)))
_poster = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "poster", value: _ } <<< Deku.Attribute.prop')

_poster_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (poster :: String | r)))
_poster_ = _poster <<< Applicative.pure

_default
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (default :: String | r)))
_default = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "default", value: _ } <<< Deku.Attribute.prop')

_default_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (default :: String | r)))
_default_ = _default <<< Applicative.pure

_srclang
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srclang :: String | r)))
_srclang = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "srclang", value: _ } <<< Deku.Attribute.prop')

_srclang_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (srclang :: String | r)))
_srclang_ = _srclang <<< Applicative.pure

_nohref
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nohref :: String | r)))
_nohref = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "nohref", value: _ } <<< Deku.Attribute.prop')

_nohref_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nohref :: String | r)))
_nohref_ = _nohref <<< Applicative.pure

_rules
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rules :: String | r)))
_rules = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rules", value: _ } <<< Deku.Attribute.prop')

_rules_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rules :: String | r)))
_rules_ = _rules <<< Applicative.pure

_frame
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (frame :: String | r)))
_frame = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "frame", value: _ } <<< Deku.Attribute.prop')

_frame_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (frame :: String | r)))
_frame_ = _frame <<< Applicative.pure

_cellspacing
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cellspacing :: String | r)))
_cellspacing = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "cellspacing", value: _ } <<< Deku.Attribute.prop')

_cellspacing_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cellspacing :: String | r)))
_cellspacing_ = _cellspacing <<< Applicative.pure

_cellpadding
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cellpadding :: String | r)))
_cellpadding = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "cellpadding", value: _ } <<< Deku.Attribute.prop')

_cellpadding_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cellpadding :: String | r)))
_cellpadding_ = _cellpadding <<< Applicative.pure

_bordercolor
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bordercolor :: String | r)))
_bordercolor = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "bordercolor", value: _ } <<< Deku.Attribute.prop')

_bordercolor_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (bordercolor :: String | r)))
_bordercolor_ = _bordercolor <<< Applicative.pure

_summary
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (summary :: String | r)))
_summary = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "summary", value: _ } <<< Deku.Attribute.prop')

_summary_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (summary :: String | r)))
_summary_ = _summary <<< Applicative.pure

_datapagesize
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (datapagesize :: String | r)))
_datapagesize = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "datapagesize", value: _ } <<< Deku.Attribute.prop')

_datapagesize_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (datapagesize :: String | r)))
_datapagesize_ = _datapagesize <<< Applicative.pure

_span
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (span :: String | r)))
_span = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "span", value: _ } <<< Deku.Attribute.prop')

_span_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (span :: String | r)))
_span_ = _span <<< Applicative.pure

_valign
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (valign :: String | r)))
_valign = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop')

_valign_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (valign :: String | r)))
_valign_ = _valign <<< Applicative.pure

_charoff
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (charoff :: String | r)))
_charoff = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop')

_charoff_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (charoff :: String | r)))
_charoff_ = _charoff <<< Applicative.pure

_char
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (char :: String | r)))
_char = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop')

_char_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (char :: String | r)))
_char_ = _char <<< Applicative.pure

_nowrap
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nowrap :: String | r)))
_nowrap = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "nowrap", value: _ } <<< Deku.Attribute.prop')

_nowrap_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nowrap :: String | r)))
_nowrap_ = _nowrap <<< Applicative.pure

_axis
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (axis :: String | r)))
_axis = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "axis", value: _ } <<< Deku.Attribute.prop')

_axis_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (axis :: String | r)))
_axis_ = _axis <<< Applicative.pure

_abbr
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (abbr :: String | r)))
_abbr = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "abbr", value: _ } <<< Deku.Attribute.prop')

_abbr_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (abbr :: String | r)))
_abbr_ = _abbr <<< Applicative.pure

_headers
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (headers :: String | r)))
_headers = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "headers", value: _ } <<< Deku.Attribute.prop')

_headers_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (headers :: String | r)))
_headers_ = _headers <<< Applicative.pure

_rowspan
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rowspan :: String | r)))
_rowspan = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rowspan", value: _ } <<< Deku.Attribute.prop')

_rowspan_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rowspan :: String | r)))
_rowspan_ = _rowspan <<< Applicative.pure

_colspan
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (colspan :: String | r)))
_colspan = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "colspan", value: _ } <<< Deku.Attribute.prop')

_colspan_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (colspan :: String | r)))
_colspan_ = _colspan <<< Applicative.pure

_accept
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (accept :: String | r)))
_accept = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "accept", value: _ } <<< Deku.Attribute.prop')

_accept_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (accept :: String | r)))
_accept_ = _accept <<< Applicative.pure

_formnovalidate
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formnovalidate :: String | r)))
_formnovalidate = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "formnovalidate", value: _ } <<< Deku.Attribute.prop')

_formnovalidate_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formnovalidate :: String | r)))
_formnovalidate_ = _formnovalidate <<< Applicative.pure

_novalidate
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (novalidate :: String | r)))
_novalidate = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "novalidate", value: _ } <<< Deku.Attribute.prop')

_novalidate_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (novalidate :: String | r)))
_novalidate_ = _novalidate <<< Applicative.pure

_formtarget
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formtarget :: String | r)))
_formtarget = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "formtarget", value: _ } <<< Deku.Attribute.prop')

_formtarget_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formtarget :: String | r)))
_formtarget_ = _formtarget <<< Applicative.pure

_formenctype
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formenctype :: String | r)))
_formenctype = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "formenctype", value: _ } <<< Deku.Attribute.prop')

_formenctype_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formenctype :: String | r)))
_formenctype_ = _formenctype <<< Applicative.pure

_formmethod
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formmethod :: String | r)))
_formmethod = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "formmethod", value: _ } <<< Deku.Attribute.prop')

_formmethod_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formmethod :: String | r)))
_formmethod_ = _formmethod <<< Applicative.pure

_formaction
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formaction :: String | r)))
_formaction = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "formaction", value: _ } <<< Deku.Attribute.prop')

_formaction_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (formaction :: String | r)))
_formaction_ = _formaction <<< Applicative.pure

_action
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (action :: String | r)))
_action = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "action", value: _ } <<< Deku.Attribute.prop')

_action_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (action :: String | r)))
_action_ = _action <<< Applicative.pure

_acceptCharset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (acceptCharset :: String | r)))
_acceptCharset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "accept-charset", value: _ } <<< Deku.Attribute.prop')

_acceptCharset_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (acceptCharset :: String | r)))
_acceptCharset_ = _acceptCharset <<< Applicative.pure

_for
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (for :: String | r)))
_for = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "for", value: _ } <<< Deku.Attribute.prop')

_for_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (for :: String | r)))
_for_ = _for <<< Applicative.pure

_capture
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (capture :: String | r)))
_capture = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "capture", value: _ } <<< Deku.Attribute.prop')

_capture_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (capture :: String | r)))
_capture_ = _capture <<< Applicative.pure

_minlength
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (minlength :: String | r)))
_minlength = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "minlength", value: _ } <<< Deku.Attribute.prop')

_minlength_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (minlength :: String | r)))
_minlength_ = _minlength <<< Applicative.pure

_maxlength
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (maxlength :: String | r)))
_maxlength = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "maxlength", value: _ } <<< Deku.Attribute.prop')

_maxlength_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (maxlength :: String | r)))
_maxlength_ = _maxlength <<< Applicative.pure

_placeholder
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (placeholder :: String | r)))
_placeholder = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "placeholder", value: _ } <<< Deku.Attribute.prop')

_placeholder_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (placeholder :: String | r)))
_placeholder_ = _placeholder <<< Applicative.pure

_list
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (list :: String | r)))
_list = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "list", value: _ } <<< Deku.Attribute.prop')

_list_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (list :: String | r)))
_list_ = _list <<< Applicative.pure

_step
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (step :: String | r)))
_step = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "step", value: _ } <<< Deku.Attribute.prop')

_step_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (step :: String | r)))
_step_ = _step <<< Applicative.pure

_max
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (max :: String | r)))
_max = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop')

_max_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (max :: String | r)))
_max_ = _max <<< Applicative.pure

_min
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (min :: String | r)))
_min = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop')

_min_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (min :: String | r)))
_min_ = _min <<< Applicative.pure

_pattern
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (pattern :: String | r)))
_pattern = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "pattern", value: _ } <<< Deku.Attribute.prop')

_pattern_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (pattern :: String | r)))
_pattern_ = _pattern <<< Applicative.pure

_multiple
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (multiple :: String | r)))
_multiple = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "multiple", value: _ } <<< Deku.Attribute.prop')

_multiple_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (multiple :: String | r)))
_multiple_ = _multiple <<< Applicative.pure

_required
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (required :: String | r)))
_required = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "required", value: _ } <<< Deku.Attribute.prop')

_required_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (required :: String | r)))
_required_ = _required <<< Applicative.pure

_readonly
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (readonly :: String | r)))
_readonly = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "readonly", value: _ } <<< Deku.Attribute.prop')

_readonly_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (readonly :: String | r)))
_readonly_ = _readonly <<< Applicative.pure

_checked
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (checked :: String | r)))
_checked = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "checked", value: _ } <<< Deku.Attribute.prop')

_checked_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (checked :: String | r)))
_checked_ = _checked <<< Applicative.pure

_selected
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (selected :: String | r)))
_selected = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "selected", value: _ } <<< Deku.Attribute.prop')

_selected_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (selected :: String | r)))
_selected_ = _selected <<< Applicative.pure

_rows
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rows :: String | r)))
_rows = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "rows", value: _ } <<< Deku.Attribute.prop')

_rows_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (rows :: String | r)))
_rows_ = _rows <<< Applicative.pure

_cols
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cols :: String | r)))
_cols = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "cols", value: _ } <<< Deku.Attribute.prop')

_cols_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (cols :: String | r)))
_cols_ = _cols <<< Applicative.pure

_optimum
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (optimum :: String | r)))
_optimum = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "optimum", value: _ } <<< Deku.Attribute.prop')

_optimum_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (optimum :: String | r)))
_optimum_ = _optimum <<< Applicative.pure

_high
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (high :: String | r)))
_high = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "high", value: _ } <<< Deku.Attribute.prop')

_high_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (high :: String | r)))
_high_ = _high <<< Applicative.pure

_low
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (low :: String | r)))
_low = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "low", value: _ } <<< Deku.Attribute.prop')

_low_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (low :: String | r)))
_low_ = _low <<< Applicative.pure

_open
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (open :: String | r)))
_open = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "open", value: _ } <<< Deku.Attribute.prop')

_open_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (open :: String | r)))
_open_ = _open <<< Applicative.pure

_event
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (event :: String | r)))
_event = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "event", value: _ } <<< Deku.Attribute.prop')

_event_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (event :: String | r)))
_event_ = _event <<< Applicative.pure

_language
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (language :: String | r)))
_language = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "language", value: _ } <<< Deku.Attribute.prop')

_language_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (language :: String | r)))
_language_ = _language <<< Applicative.pure

_defer
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (defer :: String | r)))
_defer = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "defer", value: _ } <<< Deku.Attribute.prop')

_defer_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (defer :: String | r)))
_defer_ = _defer <<< Applicative.pure

_async
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (async :: String | r)))
_async = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "async", value: _ } <<< Deku.Attribute.prop')

_async_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (async :: String | r)))
_async_ = _async <<< Applicative.pure

_nomodule
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nomodule :: String | r)))
_nomodule = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "nomodule", value: _ } <<< Deku.Attribute.prop')

_nomodule_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nomodule :: String | r)))
_nomodule_ = _nomodule <<< Applicative.pure

_truespeed
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (truespeed :: String | r)))
_truespeed = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "truespeed", value: _ } <<< Deku.Attribute.prop')

_truespeed_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (truespeed :: String | r)))
_truespeed_ = _truespeed <<< Applicative.pure

_direction
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (direction :: String | r)))
_direction = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "direction", value: _ } <<< Deku.Attribute.prop')

_direction_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (direction :: String | r)))
_direction_ = _direction <<< Applicative.pure

_behavior
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (behavior :: String | r)))
_behavior = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "behavior", value: _ } <<< Deku.Attribute.prop')

_behavior_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (behavior :: String | r)))
_behavior_ = _behavior <<< Applicative.pure

_tabindex
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (tabindex :: String | r)))
_tabindex = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "tabindex", value: _ } <<< Deku.Attribute.prop')

_tabindex_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (tabindex :: String | r)))
_tabindex_ = _tabindex <<< Applicative.pure

_nonce
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nonce :: String | r)))
_nonce = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "nonce", value: _ } <<< Deku.Attribute.prop')

_nonce_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (nonce :: String | r)))
_nonce_ = _nonce <<< Applicative.pure

_slot
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (slot :: String | r)))
_slot = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "slot", value: _ } <<< Deku.Attribute.prop')

_slot_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (slot :: String | r)))
_slot_ = _slot <<< Applicative.pure

_id
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (id :: String | r)))
_id = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "id", value: _ } <<< Deku.Attribute.prop')

_id_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (id :: String | r)))
_id_ = _id <<< Applicative.pure

_class
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (class :: String | r)))
_class = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "class", value: _ } <<< Deku.Attribute.prop')

_class_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (class :: String | r)))
_class_ = _class <<< Applicative.pure

_popovertarget
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popovertarget :: String | r)))
_popovertarget = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "popovertarget", value: _ } <<< Deku.Attribute.prop')

_popovertarget_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (popovertarget :: String | r)))
_popovertarget_ = _popovertarget <<< Applicative.pure

_draggable
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (draggable :: String | r)))
_draggable = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "draggable", value: _ } <<< Deku.Attribute.prop')

_draggable_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (draggable :: String | r)))
_draggable_ = _draggable <<< Applicative.pure

_spellcheck
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (spellcheck :: String | r)))
_spellcheck = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "spellcheck", value: _ } <<< Deku.Attribute.prop')

_spellcheck_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (spellcheck :: String | r)))
_spellcheck_ = _spellcheck <<< Applicative.pure

_contenteditable
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (contenteditable :: String | r)))
_contenteditable = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "contenteditable", value: _ } <<< Deku.Attribute.prop')

_contenteditable_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (contenteditable :: String | r)))
_contenteditable_ = _contenteditable <<< Applicative.pure

_accesskey
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (accesskey :: String | r)))
_accesskey = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "accesskey", value: _ } <<< Deku.Attribute.prop')

_accesskey_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (accesskey :: String | r)))
_accesskey_ = _accesskey <<< Applicative.pure

_autofocus
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autofocus :: String | r)))
_autofocus = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "autofocus", value: _ } <<< Deku.Attribute.prop')

_autofocus_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (autofocus :: String | r)))
_autofocus_ = _autofocus <<< Applicative.pure

_itemprop
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemprop :: String | r)))
_itemprop = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "itemprop", value: _ } <<< Deku.Attribute.prop')

_itemprop_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemprop :: String | r)))
_itemprop_ = _itemprop <<< Applicative.pure

_itemref
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemref :: String | r)))
_itemref = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "itemref", value: _ } <<< Deku.Attribute.prop')

_itemref_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemref :: String | r)))
_itemref_ = _itemref <<< Applicative.pure

_itemid
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemid :: String | r)))
_itemid = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "itemid", value: _ } <<< Deku.Attribute.prop')

_itemid_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemid :: String | r)))
_itemid_ = _itemid <<< Applicative.pure

_itemtype
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemtype :: String | r)))
_itemtype = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "itemtype", value: _ } <<< Deku.Attribute.prop')

_itemtype_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemtype :: String | r)))
_itemtype_ = _itemtype <<< Applicative.pure

_itemscope
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemscope :: String | r)))
_itemscope = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "itemscope", value: _ } <<< Deku.Attribute.prop')

_itemscope_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (itemscope :: String | r)))
_itemscope_ = _itemscope <<< Applicative.pure

_is
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (is :: String | r)))
_is = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "is", value: _ } <<< Deku.Attribute.prop')

_is_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (is :: String | r)))
_is_ = _is <<< Applicative.pure

_style
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (style :: String | r)))
_style = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "style", value: _ } <<< Deku.Attribute.prop')

_style_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (style :: String | r)))
_style_ = _style <<< Applicative.pure

_translate
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (translate :: String | r)))
_translate = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "translate", value: _ } <<< Deku.Attribute.prop')

_translate_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (translate :: String | r)))
_translate_ = _translate <<< Applicative.pure

_lang
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (lang :: String | r)))
_lang = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "lang", value: _ } <<< Deku.Attribute.prop')

_lang_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (lang :: String | r)))
_lang_ = _lang <<< Applicative.pure

_onAnimationcancel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationcancel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAnimationcancel", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onAnimationcancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationcancel_ = _onAnimationcancel <<< Applicative.pure

_onAnimationend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAnimationend", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onAnimationend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationend_ = _onAnimationend <<< Applicative.pure

_onAnimationiteration
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onAnimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onAnimationiteration = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAnimationiteration", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onAnimationiteration_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onAnimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onAnimationiteration_ = _onAnimationiteration <<< Applicative.pure

_onAnimationstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAnimationstart", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onAnimationstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAnimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationstart_ = _onAnimationstart <<< Applicative.pure

_onTransitioncancel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitioncancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitioncancel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTransitioncancel", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onTransitioncancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitioncancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitioncancel_ = _onTransitioncancel <<< Applicative.pure

_onTransitionend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTransitionend", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onTransitionend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionend_ = _onTransitionend <<< Applicative.pure

_onTransitionstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTransitionstart", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onTransitionstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionstart_ = _onTransitionstart <<< Applicative.pure

_onTransitionrun
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionrun :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionrun = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTransitionrun", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onTransitionrun_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTransitionrun :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionrun_ = _onTransitionrun <<< Applicative.pure

_onSelectionchange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelectionchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectionchange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSelectionchange", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onSelectionchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelectionchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectionchange_ = _onSelectionchange <<< Applicative.pure

_onSelectstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelectstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSelectstart", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSelectstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelectstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectstart_ = _onSelectstart <<< Applicative.pure

_onTouchcancel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchcancel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTouchcancel", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onTouchcancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchcancel_ = _onTouchcancel <<< Applicative.pure

_onTouchmove
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchmove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchmove = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTouchmove", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onTouchmove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchmove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchmove_ = _onTouchmove <<< Applicative.pure

_onTouchend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTouchend", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onTouchend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchend_ = _onTouchend <<< Applicative.pure

_onTouchstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTouchstart", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onTouchstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTouchstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchstart_ = _onTouchstart <<< Applicative.pure

_onLostpointercapture
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onLostpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onLostpointercapture = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onLostpointercapture", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onLostpointercapture_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onLostpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onLostpointercapture_ = _onLostpointercapture <<< Applicative.pure

_onGotpointercapture
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onGotpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onGotpointercapture = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onGotpointercapture", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onGotpointercapture_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onGotpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onGotpointercapture_ = _onGotpointercapture <<< Applicative.pure

_onPointerleave
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerleave = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerleave", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onPointerleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerleave_ = _onPointerleave <<< Applicative.pure

_onPointerout
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerout = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerout", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPointerout_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerout_ = _onPointerout <<< Applicative.pure

_onPointercancel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointercancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointercancel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointercancel", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onPointercancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointercancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointercancel_ = _onPointercancel <<< Applicative.pure

_onPointerup
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerup = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerup", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPointerup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerup_ = _onPointerup <<< Applicative.pure

_onPointerrawupdate
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerrawupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerrawupdate = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerrawupdate", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onPointerrawupdate_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerrawupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerrawupdate_ = _onPointerrawupdate <<< Applicative.pure

_onPointermove
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointermove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointermove = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointermove", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPointermove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointermove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointermove_ = _onPointermove <<< Applicative.pure

_onPointerdown
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerdown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerdown = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerdown", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPointerdown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerdown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerdown_ = _onPointerdown <<< Applicative.pure

_onPointerenter
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerenter = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerenter", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onPointerenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerenter_ = _onPointerenter <<< Applicative.pure

_onPointerover
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerover = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPointerover", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPointerover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPointerover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerover_ = _onPointerover <<< Applicative.pure

_onScrollend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onScrollend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onScrollend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onScrollend", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onScrollend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onScrollend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onScrollend_ = _onScrollend <<< Applicative.pure

_onScroll
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onScroll :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onScroll = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onScroll", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onScroll_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onScroll :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onScroll_ = _onScroll <<< Applicative.pure

_onResize
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onResize :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onResize = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onResize", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onResize_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onResize :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onResize_ = _onResize <<< Applicative.pure

_onLoad
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoad :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoad = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onLoad", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onLoad_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoad :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoad_ = _onLoad <<< Applicative.pure

_onFocus
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onFocus :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onFocus = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onFocus", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onFocus_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onFocus :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onFocus_ = _onFocus <<< Applicative.pure

_onError
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onError :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onError = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onError", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onError_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onError :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onError_ = _onError <<< Applicative.pure

_onBlur
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBlur :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBlur = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onBlur", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onBlur_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBlur :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBlur_ = _onBlur <<< Applicative.pure

_onWheel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onWheel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onWheel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWheel", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onWheel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onWheel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onWheel_ = _onWheel <<< Applicative.pure

_onWebkittransitionend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkittransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkittransitionend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWebkittransitionend", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onWebkittransitionend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkittransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkittransitionend_ = _onWebkittransitionend <<< Applicative.pure

_onWebkitanimationstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWebkitanimationstart", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onWebkitanimationstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationstart_ = _onWebkitanimationstart <<< Applicative.pure

_onWebkitanimationiteration
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationiteration ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationiteration = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWebkitanimationiteration", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onWebkitanimationiteration_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationiteration ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationiteration_ = _onWebkitanimationiteration <<< Applicative.pure

_onWebkitanimationend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWebkitanimationend", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onWebkitanimationend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onWebkitanimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationend_ = _onWebkitanimationend <<< Applicative.pure

_onWaiting
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onWaiting :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onWaiting = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onWaiting", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onWaiting_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onWaiting :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onWaiting_ = _onWaiting <<< Applicative.pure

_onVolumechange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onVolumechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onVolumechange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onVolumechange", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onVolumechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onVolumechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onVolumechange_ = _onVolumechange <<< Applicative.pure

_onToggle
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onToggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onToggle = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onToggle", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onToggle_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onToggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onToggle_ = _onToggle <<< Applicative.pure

_onTimeupdate
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTimeupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTimeupdate = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onTimeupdate", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onTimeupdate_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onTimeupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTimeupdate_ = _onTimeupdate <<< Applicative.pure

_onSuspend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSuspend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSuspend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSuspend", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSuspend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSuspend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSuspend_ = _onSuspend <<< Applicative.pure

_onSubmit
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSubmit :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSubmit = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSubmit", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSubmit_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSubmit :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSubmit_ = _onSubmit <<< Applicative.pure

_onStalled
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onStalled :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onStalled = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onStalled", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onStalled_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onStalled :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onStalled_ = _onStalled <<< Applicative.pure

_onSlotchange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSlotchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSlotchange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSlotchange", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSlotchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSlotchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSlotchange_ = _onSlotchange <<< Applicative.pure

_onSelect
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelect :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelect = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSelect", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSelect_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSelect :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelect_ = _onSelect <<< Applicative.pure

_onSeeking
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSeeking :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSeeking = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSeeking", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSeeking_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSeeking :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSeeking_ = _onSeeking <<< Applicative.pure

_onSeeked
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSeeked :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSeeked = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSeeked", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onSeeked_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onSeeked :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSeeked_ = _onSeeked <<< Applicative.pure

_onSecuritypolicyviolation
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onSecuritypolicyviolation ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onSecuritypolicyviolation = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onSecuritypolicyviolation", value: _ }
      <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onSecuritypolicyviolation_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               ( onSecuritypolicyviolation ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onSecuritypolicyviolation_ = _onSecuritypolicyviolation <<< Applicative.pure

_onReset
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onReset :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onReset = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onReset", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onReset_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onReset :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onReset_ = _onReset <<< Applicative.pure

_onRatechange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onRatechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onRatechange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onRatechange", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onRatechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onRatechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onRatechange_ = _onRatechange <<< Applicative.pure

_onProgress
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onProgress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onProgress = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onProgress", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onProgress_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onProgress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onProgress_ = _onProgress <<< Applicative.pure

_onPlaying
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPlaying :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPlaying = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPlaying", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPlaying_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPlaying :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPlaying_ = _onPlaying <<< Applicative.pure

_onPlay
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPlay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPlay = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPlay", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPlay_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPlay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPlay_ = _onPlay <<< Applicative.pure

_onPause
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPause :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPause = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPause", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPause_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPause :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPause_ = _onPause <<< Applicative.pure

_onPaste
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPaste :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPaste = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onPaste", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onPaste_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onPaste :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPaste_ = _onPaste <<< Applicative.pure

_onMouseup
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseup = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMouseup", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMouseup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseup_ = _onMouseup <<< Applicative.pure

_onMouseover
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseover = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMouseover", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMouseover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseover_ = _onMouseover <<< Applicative.pure

_onMouseout
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseout = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMouseout", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMouseout_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseout_ = _onMouseout <<< Applicative.pure

_onMousemove
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMousemove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMousemove = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMousemove", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMousemove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMousemove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMousemove_ = _onMousemove <<< Applicative.pure

_onMouseleave
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseleave = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMouseleave", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMouseleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseleave_ = _onMouseleave <<< Applicative.pure

_onMouseenter
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseenter = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMouseenter", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMouseenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMouseenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseenter_ = _onMouseenter <<< Applicative.pure

_onMousedown
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMousedown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMousedown = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onMousedown", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onMousedown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onMousedown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMousedown_ = _onMousedown <<< Applicative.pure

_onLoadstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onLoadstart", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onLoadstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadstart_ = _onLoadstart <<< Applicative.pure

_onLoadedmetadata
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadedmetadata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadedmetadata = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onLoadedmetadata", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onLoadedmetadata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadedmetadata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadedmetadata_ = _onLoadedmetadata <<< Applicative.pure

_onLoadeddata
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadeddata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadeddata = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onLoadeddata", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onLoadeddata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onLoadeddata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadeddata_ = _onLoadeddata <<< Applicative.pure

_onKeyup
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeyup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeyup = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onKeyup", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onKeyup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeyup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeyup_ = _onKeyup <<< Applicative.pure

_onKeypress
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeypress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeypress = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onKeypress", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onKeypress_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeypress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeypress_ = _onKeypress <<< Applicative.pure

_onKeydown
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeydown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeydown = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onKeydown", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onKeydown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onKeydown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onKeydown_ = _onKeydown <<< Applicative.pure

_onInvalid
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onInvalid :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onInvalid = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onInvalid", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onInvalid_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onInvalid :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onInvalid_ = _onInvalid <<< Applicative.pure

_onInput
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onInput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onInput = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onInput", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onInput_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onInput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onInput_ = _onInput <<< Applicative.pure

_onFormdata
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onFormdata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onFormdata = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onFormdata", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onFormdata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onFormdata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onFormdata_ = _onFormdata <<< Applicative.pure

_onEnded
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onEnded :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onEnded = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onEnded", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onEnded_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onEnded :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onEnded_ = _onEnded <<< Applicative.pure

_onEmptied
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onEmptied :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onEmptied = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onEmptied", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onEmptied_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onEmptied :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onEmptied_ = _onEmptied <<< Applicative.pure

_onDurationchange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDurationchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDurationchange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDurationchange", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onDurationchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDurationchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDurationchange_ = _onDurationchange <<< Applicative.pure

_onDrop
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDrop :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDrop = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDrop", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDrop_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDrop :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDrop_ = _onDrop <<< Applicative.pure

_onDragstart
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragstart = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDragstart", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDragstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragstart_ = _onDragstart <<< Applicative.pure

_onDragover
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragover = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDragover", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDragover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragover_ = _onDragover <<< Applicative.pure

_onDragleave
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragleave = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDragleave", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDragleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragleave_ = _onDragleave <<< Applicative.pure

_onDragenter
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragenter = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDragenter", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDragenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragenter_ = _onDragenter <<< Applicative.pure

_onDragend
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragend = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDragend", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDragend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDragend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDragend_ = _onDragend <<< Applicative.pure

_onDrag
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDrag :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDrag = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDrag", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDrag_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDrag :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDrag_ = _onDrag <<< Applicative.pure

_onDblclick
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDblclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDblclick = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onDblclick", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onDblclick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onDblclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDblclick_ = _onDblclick <<< Applicative.pure

_onCut
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           (Index.Indexed (onCut :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCut = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCut", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onCut_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           (Index.Indexed (onCut :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCut_ = _onCut <<< Applicative.pure

_onCuechange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCuechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCuechange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCuechange", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onCuechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCuechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCuechange_ = _onCuechange <<< Applicative.pure

_onCopy
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCopy :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCopy = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCopy", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onCopy_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCopy :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCopy_ = _onCopy <<< Applicative.pure

_onContextrestored
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextrestored :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextrestored = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onContextrestored", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onContextrestored_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextrestored :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextrestored_ = _onContextrestored <<< Applicative.pure

_onContextmenu
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextmenu :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextmenu = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onContextmenu", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onContextmenu_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextmenu :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextmenu_ = _onContextmenu <<< Applicative.pure

_onContextlost
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextlost :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextlost = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onContextlost", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onContextlost_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onContextlost :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextlost_ = _onContextlost <<< Applicative.pure

_onClose
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onClose :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onClose = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onClose", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onClose_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onClose :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onClose_ = _onClose <<< Applicative.pure

_onClick
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onClick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onClick = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onClick", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onClick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onClick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onClick_ = _onClick <<< Applicative.pure

_onChange
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onChange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onChange = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onChange", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onChange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onChange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onChange_ = _onChange <<< Applicative.pure

_onCanplaythrough
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCanplaythrough :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplaythrough = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCanplaythrough", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onCanplaythrough_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCanplaythrough :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplaythrough_ = _onCanplaythrough <<< Applicative.pure

_onCanplay
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCanplay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplay = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCanplay", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onCanplay_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCanplay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplay_ = _onCanplay <<< Applicative.pure

_onCancel
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCancel = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onCancel", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onCancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onCancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCancel_ = _onCancel <<< Applicative.pure

_onBeforetoggle
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforetoggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforetoggle = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onBeforetoggle", value: _ } <<< Deku.Attribute.cb'
      <<< Deku.Attribute.cb
  )

_onBeforetoggle_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforetoggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforetoggle_ = _onBeforetoggle <<< Applicative.pure

_onBeforematch
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforematch :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforematch = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onBeforematch", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onBeforematch_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforematch :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforematch_ = _onBeforematch <<< Applicative.pure

_onBeforeinput
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforeinput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforeinput = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onBeforeinput", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onBeforeinput_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onBeforeinput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforeinput_ = _onBeforeinput <<< Applicative.pure

_onAuxclick
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAuxclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAuxclick = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAuxclick", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onAuxclick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAuxclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAuxclick_ = _onAuxclick <<< Applicative.pure

_onAbort
  :: forall r
   . FRP.Event.Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAbort :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAbort = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "onAbort", value: _ } <<< Deku.Attribute.cb' <<<
      Deku.Attribute.cb
  )

_onAbort_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> FRP.Event.Event
       ( Deku.Attribute.Attribute
           ( Index.Indexed
               (onAbort :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAbort_ = _onAbort <<< Applicative.pure

_ariaValuetext
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuetext :: String | r)))
_ariaValuetext = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-valuetext", value: _ } <<< Deku.Attribute.prop')

_ariaValuetext_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuetext :: String | r)))
_ariaValuetext_ = _ariaValuetext <<< Applicative.pure

_ariaValuenow
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuenow :: String | r)))
_ariaValuenow = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-valuenow", value: _ } <<< Deku.Attribute.prop')

_ariaValuenow_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuenow :: String | r)))
_ariaValuenow_ = _ariaValuenow <<< Applicative.pure

_ariaValuemin
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuemin :: String | r)))
_ariaValuemin = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-valuemin", value: _ } <<< Deku.Attribute.prop')

_ariaValuemin_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuemin :: String | r)))
_ariaValuemin_ = _ariaValuemin <<< Applicative.pure

_ariaValuemax
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuemax :: String | r)))
_ariaValuemax = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-valuemax", value: _ } <<< Deku.Attribute.prop')

_ariaValuemax_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaValuemax :: String | r)))
_ariaValuemax_ = _ariaValuemax <<< Applicative.pure

_ariaSort
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSort :: String | r)))
_ariaSort = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-sort", value: _ } <<< Deku.Attribute.prop')

_ariaSort_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSort :: String | r)))
_ariaSort_ = _ariaSort <<< Applicative.pure

_ariaSetsize
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSetsize :: String | r)))
_ariaSetsize = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-setsize", value: _ } <<< Deku.Attribute.prop')

_ariaSetsize_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSetsize :: String | r)))
_ariaSetsize_ = _ariaSetsize <<< Applicative.pure

_ariaSelected
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSelected :: String | r)))
_ariaSelected = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-selected", value: _ } <<< Deku.Attribute.prop')

_ariaSelected_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaSelected :: String | r)))
_ariaSelected_ = _ariaSelected <<< Applicative.pure

_ariaRowspan
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowspan :: String | r)))
_ariaRowspan = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-rowspan", value: _ } <<< Deku.Attribute.prop')

_ariaRowspan_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowspan :: String | r)))
_ariaRowspan_ = _ariaRowspan <<< Applicative.pure

_ariaRowindextext
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowindextext :: String | r)))
_ariaRowindextext = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-rowindextext", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaRowindextext_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowindextext :: String | r)))
_ariaRowindextext_ = _ariaRowindextext <<< Applicative.pure

_ariaRowindex
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowindex :: String | r)))
_ariaRowindex = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-rowindex", value: _ } <<< Deku.Attribute.prop')

_ariaRowindex_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowindex :: String | r)))
_ariaRowindex_ = _ariaRowindex <<< Applicative.pure

_ariaRowcount
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowcount :: String | r)))
_ariaRowcount = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-rowcount", value: _ } <<< Deku.Attribute.prop')

_ariaRowcount_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRowcount :: String | r)))
_ariaRowcount_ = _ariaRowcount <<< Applicative.pure

_ariaRoledescription
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRoledescription :: String | r)))
_ariaRoledescription = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-roledescription", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaRoledescription_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRoledescription :: String | r)))
_ariaRoledescription_ = _ariaRoledescription <<< Applicative.pure

_ariaRequired
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRequired :: String | r)))
_ariaRequired = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-required", value: _ } <<< Deku.Attribute.prop')

_ariaRequired_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaRequired :: String | r)))
_ariaRequired_ = _ariaRequired <<< Applicative.pure

_ariaReadonly
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaReadonly :: String | r)))
_ariaReadonly = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-readonly", value: _ } <<< Deku.Attribute.prop')

_ariaReadonly_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaReadonly :: String | r)))
_ariaReadonly_ = _ariaReadonly <<< Applicative.pure

_ariaPressed
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPressed :: String | r)))
_ariaPressed = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-pressed", value: _ } <<< Deku.Attribute.prop')

_ariaPressed_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPressed :: String | r)))
_ariaPressed_ = _ariaPressed <<< Applicative.pure

_ariaPosinset
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPosinset :: String | r)))
_ariaPosinset = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-posinset", value: _ } <<< Deku.Attribute.prop')

_ariaPosinset_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPosinset :: String | r)))
_ariaPosinset_ = _ariaPosinset <<< Applicative.pure

_ariaPlaceholder
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-placeholder", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaPlaceholder_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder_ = _ariaPlaceholder <<< Applicative.pure

_ariaOwns
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaOwns :: String | r)))
_ariaOwns = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-owns", value: _ } <<< Deku.Attribute.prop')

_ariaOwns_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaOwns :: String | r)))
_ariaOwns_ = _ariaOwns <<< Applicative.pure

_ariaOrientation
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaOrientation :: String | r)))
_ariaOrientation = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-orientation", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaOrientation_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaOrientation :: String | r)))
_ariaOrientation_ = _ariaOrientation <<< Applicative.pure

_ariaMultiselectable
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaMultiselectable :: String | r)))
_ariaMultiselectable = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-multiselectable", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaMultiselectable_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaMultiselectable :: String | r)))
_ariaMultiselectable_ = _ariaMultiselectable <<< Applicative.pure

_ariaMultiline
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaMultiline :: String | r)))
_ariaMultiline = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-multiline", value: _ } <<< Deku.Attribute.prop')

_ariaMultiline_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaMultiline :: String | r)))
_ariaMultiline_ = _ariaMultiline <<< Applicative.pure

_ariaModal
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaModal :: String | r)))
_ariaModal = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-modal", value: _ } <<< Deku.Attribute.prop')

_ariaModal_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaModal :: String | r)))
_ariaModal_ = _ariaModal <<< Applicative.pure

_ariaLive
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLive :: String | r)))
_ariaLive = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-live", value: _ } <<< Deku.Attribute.prop')

_ariaLive_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLive :: String | r)))
_ariaLive_ = _ariaLive <<< Applicative.pure

_ariaLevel
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLevel :: String | r)))
_ariaLevel = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-level", value: _ } <<< Deku.Attribute.prop')

_ariaLevel_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLevel :: String | r)))
_ariaLevel_ = _ariaLevel <<< Applicative.pure

_ariaLabelledby
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLabelledby :: String | r)))
_ariaLabelledby = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-labelledby", value: _ } <<< Deku.Attribute.prop')

_ariaLabelledby_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLabelledby :: String | r)))
_ariaLabelledby_ = _ariaLabelledby <<< Applicative.pure

_ariaLabel
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLabel :: String | r)))
_ariaLabel = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-label", value: _ } <<< Deku.Attribute.prop')

_ariaLabel_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaLabel :: String | r)))
_ariaLabel_ = _ariaLabel <<< Applicative.pure

_ariaKeyshortcuts
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaKeyshortcuts :: String | r)))
_ariaKeyshortcuts = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-keyshortcuts", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaKeyshortcuts_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaKeyshortcuts :: String | r)))
_ariaKeyshortcuts_ = _ariaKeyshortcuts <<< Applicative.pure

_ariaInvalid
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaInvalid :: String | r)))
_ariaInvalid = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-invalid", value: _ } <<< Deku.Attribute.prop')

_ariaInvalid_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaInvalid :: String | r)))
_ariaInvalid_ = _ariaInvalid <<< Applicative.pure

_ariaHidden
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaHidden :: String | r)))
_ariaHidden = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-hidden", value: _ } <<< Deku.Attribute.prop')

_ariaHidden_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaHidden :: String | r)))
_ariaHidden_ = _ariaHidden <<< Applicative.pure

_ariaHaspopup
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaHaspopup :: String | r)))
_ariaHaspopup = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-haspopup", value: _ } <<< Deku.Attribute.prop')

_ariaHaspopup_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaHaspopup :: String | r)))
_ariaHaspopup_ = _ariaHaspopup <<< Applicative.pure

_ariaFlowto
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaFlowto :: String | r)))
_ariaFlowto = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-flowto", value: _ } <<< Deku.Attribute.prop')

_ariaFlowto_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaFlowto :: String | r)))
_ariaFlowto_ = _ariaFlowto <<< Applicative.pure

_ariaExpanded
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaExpanded :: String | r)))
_ariaExpanded = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-expanded", value: _ } <<< Deku.Attribute.prop')

_ariaExpanded_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaExpanded :: String | r)))
_ariaExpanded_ = _ariaExpanded <<< Applicative.pure

_ariaErrormessage
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaErrormessage :: String | r)))
_ariaErrormessage = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-errormessage", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaErrormessage_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaErrormessage :: String | r)))
_ariaErrormessage_ = _ariaErrormessage <<< Applicative.pure

_ariaDisabled
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDisabled :: String | r)))
_ariaDisabled = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-disabled", value: _ } <<< Deku.Attribute.prop')

_ariaDisabled_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDisabled :: String | r)))
_ariaDisabled_ = _ariaDisabled <<< Applicative.pure

_ariaDetails
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDetails :: String | r)))
_ariaDetails = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-details", value: _ } <<< Deku.Attribute.prop')

_ariaDetails_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDetails :: String | r)))
_ariaDetails_ = _ariaDetails <<< Applicative.pure

_ariaDescription
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDescription :: String | r)))
_ariaDescription = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-description", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaDescription_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDescription :: String | r)))
_ariaDescription_ = _ariaDescription <<< Applicative.pure

_ariaDescribedby
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDescribedby :: String | r)))
_ariaDescribedby = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-describedby", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaDescribedby_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaDescribedby :: String | r)))
_ariaDescribedby_ = _ariaDescribedby <<< Applicative.pure

_ariaCurrent
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaCurrent :: String | r)))
_ariaCurrent = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-current", value: _ } <<< Deku.Attribute.prop')

_ariaCurrent_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaCurrent :: String | r)))
_ariaCurrent_ = _ariaCurrent <<< Applicative.pure

_ariaControls
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaControls :: String | r)))
_ariaControls = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-controls", value: _ } <<< Deku.Attribute.prop')

_ariaControls_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaControls :: String | r)))
_ariaControls_ = _ariaControls <<< Applicative.pure

_ariaColspan
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColspan :: String | r)))
_ariaColspan = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-colspan", value: _ } <<< Deku.Attribute.prop')

_ariaColspan_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColspan :: String | r)))
_ariaColspan_ = _ariaColspan <<< Applicative.pure

_ariaColindextext
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColindextext :: String | r)))
_ariaColindextext = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-colindextext", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaColindextext_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColindextext :: String | r)))
_ariaColindextext_ = _ariaColindextext <<< Applicative.pure

_ariaColindex
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColindex :: String | r)))
_ariaColindex = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-colindex", value: _ } <<< Deku.Attribute.prop')

_ariaColindex_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColindex :: String | r)))
_ariaColindex_ = _ariaColindex <<< Applicative.pure

_ariaColcount
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColcount :: String | r)))
_ariaColcount = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-colcount", value: _ } <<< Deku.Attribute.prop')

_ariaColcount_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaColcount :: String | r)))
_ariaColcount_ = _ariaColcount <<< Applicative.pure

_ariaChecked
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaChecked :: String | r)))
_ariaChecked = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-checked", value: _ } <<< Deku.Attribute.prop')

_ariaChecked_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaChecked :: String | r)))
_ariaChecked_ = _ariaChecked <<< Applicative.pure

_ariaBusy
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaBusy :: String | r)))
_ariaBusy = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-busy", value: _ } <<< Deku.Attribute.prop')

_ariaBusy_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaBusy :: String | r)))
_ariaBusy_ = _ariaBusy <<< Applicative.pure

_ariaAutocomplete
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaAutocomplete :: String | r)))
_ariaAutocomplete = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-autocomplete", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaAutocomplete_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaAutocomplete :: String | r)))
_ariaAutocomplete_ = _ariaAutocomplete <<< Applicative.pure

_ariaAtomic
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaAtomic :: String | r)))
_ariaAtomic = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "aria-atomic", value: _ } <<< Deku.Attribute.prop')

_ariaAtomic_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaAtomic :: String | r)))
_ariaAtomic_ = _ariaAtomic <<< Applicative.pure

_ariaActivedescendant
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaActivedescendant :: String | r)))
_ariaActivedescendant = Functor.map
  ( Deku.Attribute.unsafeAttribute <<< { key: "aria-activedescendant", value: _ } <<<
      Deku.Attribute.prop'
  )

_ariaActivedescendant_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (ariaActivedescendant :: String | r)))
_ariaActivedescendant_ = _ariaActivedescendant <<< Applicative.pure

_role
  :: forall r
   . FRP.Event.Event String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (role :: String | r)))
_role = Functor.map
  (Deku.Attribute.unsafeAttribute <<< { key: "role", value: _ } <<< Deku.Attribute.prop')

_role_
  :: forall r
   . String
  -> FRP.Event.Event (Deku.Attribute.Attribute (Index.Indexed (role :: String | r)))
_role_ = _role <<< Applicative.pure

__anonymous :: Index.Keyword "anonymous"
__anonymous = Index.Keyword "anonymous"

__useCredentials :: Index.Keyword "use-credentials"
__useCredentials = Index.Keyword "use-credentials"

__lazy :: Index.Keyword "lazy"
__lazy = Index.Keyword "lazy"

__eager :: Index.Keyword "eager"
__eager = Index.Keyword "eager"

__high :: Index.Keyword "high"
__high = Index.Keyword "high"

__low :: Index.Keyword "low"
__low = Index.Keyword "low"

__auto :: Index.Keyword "auto"
__auto = Index.Keyword "auto"

__ltr :: Index.Keyword "ltr"
__ltr = Index.Keyword "ltr"

__rtl :: Index.Keyword "rtl"
__rtl = Index.Keyword "rtl"

__applicationName :: Index.Keyword "application-name"
__applicationName = Index.Keyword "application-name"

__author :: Index.Keyword "author"
__author = Index.Keyword "author"

__description :: Index.Keyword "description"
__description = Index.Keyword "description"

__generator :: Index.Keyword "generator"
__generator = Index.Keyword "generator"

__keywords :: Index.Keyword "keywords"
__keywords = Index.Keyword "keywords"

__referrer :: Index.Keyword "referrer"
__referrer = Index.Keyword "referrer"

__themeColor :: Index.Keyword "theme-color"
__themeColor = Index.Keyword "theme-color"

__colorScheme :: Index.Keyword "color-scheme"
__colorScheme = Index.Keyword "color-scheme"

__contentLanguage :: Index.Keyword "content-language"
__contentLanguage = Index.Keyword "content-language"

__contentType :: Index.Keyword "content-type"
__contentType = Index.Keyword "content-type"

__defaultStyle :: Index.Keyword "default-style"
__defaultStyle = Index.Keyword "default-style"

__refresh :: Index.Keyword "refresh"
__refresh = Index.Keyword "refresh"

__setCookie :: Index.Keyword "set-cookie"
__setCookie = Index.Keyword "set-cookie"

__xUaCompatible :: Index.Keyword "x-ua-compatible"
__xUaCompatible = Index.Keyword "x-ua-compatible"

__contentSecurityPolicy :: Index.Keyword "content-security-policy"
__contentSecurityPolicy = Index.Keyword "content-security-policy"

__x1 :: Index.Keyword "1"
__x1 = Index.Keyword "1"

__a :: Index.Keyword "a"
__a = Index.Keyword "a"

__xA :: Index.Keyword "A"
__xA = Index.Keyword "A"

__i :: Index.Keyword "i"
__i = Index.Keyword "i"

__xI :: Index.Keyword "I"
__xI = Index.Keyword "I"

__alternate :: Index.Keyword "alternate"
__alternate = Index.Keyword "alternate"

__bookmark :: Index.Keyword "bookmark"
__bookmark = Index.Keyword "bookmark"

__canonical :: Index.Keyword "canonical"
__canonical = Index.Keyword "canonical"

__dnsPrefetch :: Index.Keyword "dns-prefetch"
__dnsPrefetch = Index.Keyword "dns-prefetch"

__external :: Index.Keyword "external"
__external = Index.Keyword "external"

__help :: Index.Keyword "help"
__help = Index.Keyword "help"

__icon :: Index.Keyword "icon"
__icon = Index.Keyword "icon"

__license :: Index.Keyword "license"
__license = Index.Keyword "license"

__manifest :: Index.Keyword "manifest"
__manifest = Index.Keyword "manifest"

__modulepreload :: Index.Keyword "modulepreload"
__modulepreload = Index.Keyword "modulepreload"

__nofollow :: Index.Keyword "nofollow"
__nofollow = Index.Keyword "nofollow"

__noopener :: Index.Keyword "noopener"
__noopener = Index.Keyword "noopener"

__noreferrer :: Index.Keyword "noreferrer"
__noreferrer = Index.Keyword "noreferrer"

__opener :: Index.Keyword "opener"
__opener = Index.Keyword "opener"

__pingback :: Index.Keyword "pingback"
__pingback = Index.Keyword "pingback"

__preconnect :: Index.Keyword "preconnect"
__preconnect = Index.Keyword "preconnect"

__prefetch :: Index.Keyword "prefetch"
__prefetch = Index.Keyword "prefetch"

__preload :: Index.Keyword "preload"
__preload = Index.Keyword "preload"

__search :: Index.Keyword "search"
__search = Index.Keyword "search"

__stylesheet :: Index.Keyword "stylesheet"
__stylesheet = Index.Keyword "stylesheet"

__tag :: Index.Keyword "tag"
__tag = Index.Keyword "tag"

__next :: Index.Keyword "next"
__next = Index.Keyword "next"

__prev :: Index.Keyword "prev"
__prev = Index.Keyword "prev"

__sync :: Index.Keyword "sync"
__sync = Index.Keyword "sync"

__async :: Index.Keyword "async"
__async = Index.Keyword "async"

__subtitles :: Index.Keyword "subtitles"
__subtitles = Index.Keyword "subtitles"

__captions :: Index.Keyword "captions"
__captions = Index.Keyword "captions"

__descriptions :: Index.Keyword "descriptions"
__descriptions = Index.Keyword "descriptions"

__chapters :: Index.Keyword "chapters"
__chapters = Index.Keyword "chapters"

__metadata :: Index.Keyword "metadata"
__metadata = Index.Keyword "metadata"

__none :: Index.Keyword "none"
__none = Index.Keyword "none"

__circleState :: Index.Keyword "circle state"
__circleState = Index.Keyword "circle state"

__defaultState :: Index.Keyword "default state"
__defaultState = Index.Keyword "default state"

__polygonState :: Index.Keyword "polygon state"
__polygonState = Index.Keyword "polygon state"

__rectangleState :: Index.Keyword "rectangle state"
__rectangleState = Index.Keyword "rectangle state"

__row :: Index.Keyword "row"
__row = Index.Keyword "row"

__col :: Index.Keyword "col"
__col = Index.Keyword "col"

__rowgroup :: Index.Keyword "rowgroup"
__rowgroup = Index.Keyword "rowgroup"

__colgroup :: Index.Keyword "colgroup"
__colgroup = Index.Keyword "colgroup"

__hidden :: Index.Keyword "hidden"
__hidden = Index.Keyword "hidden"

__text :: Index.Keyword "text"
__text = Index.Keyword "text"

__tel :: Index.Keyword "tel"
__tel = Index.Keyword "tel"

__url :: Index.Keyword "url"
__url = Index.Keyword "url"

__email :: Index.Keyword "email"
__email = Index.Keyword "email"

__password :: Index.Keyword "password"
__password = Index.Keyword "password"

__date :: Index.Keyword "date"
__date = Index.Keyword "date"

__month :: Index.Keyword "month"
__month = Index.Keyword "month"

__week :: Index.Keyword "week"
__week = Index.Keyword "week"

__time :: Index.Keyword "time"
__time = Index.Keyword "time"

__datetimeLocal :: Index.Keyword "datetime-local"
__datetimeLocal = Index.Keyword "datetime-local"

__number :: Index.Keyword "number"
__number = Index.Keyword "number"

__range :: Index.Keyword "range"
__range = Index.Keyword "range"

__color :: Index.Keyword "color"
__color = Index.Keyword "color"

__checkbox :: Index.Keyword "checkbox"
__checkbox = Index.Keyword "checkbox"

__radio :: Index.Keyword "radio"
__radio = Index.Keyword "radio"

__file :: Index.Keyword "file"
__file = Index.Keyword "file"

__submit :: Index.Keyword "submit"
__submit = Index.Keyword "submit"

__image :: Index.Keyword "image"
__image = Index.Keyword "image"

__reset :: Index.Keyword "reset"
__reset = Index.Keyword "reset"

__button :: Index.Keyword "button"
__button = Index.Keyword "button"

__soft :: Index.Keyword "soft"
__soft = Index.Keyword "soft"

__hard :: Index.Keyword "hard"
__hard = Index.Keyword "hard"

__get :: Index.Keyword "get"
__get = Index.Keyword "get"

__post :: Index.Keyword "post"
__post = Index.Keyword "post"

__dialog :: Index.Keyword "dialog"
__dialog = Index.Keyword "dialog"

__applicationXWwwFormUrlencoded :: Index.Keyword "application/x-www-form-urlencoded"
__applicationXWwwFormUrlencoded = Index.Keyword "application/x-www-form-urlencoded"

__multipartFormData :: Index.Keyword "multipart/form-data"
__multipartFormData = Index.Keyword "multipart/form-data"

__textPlain :: Index.Keyword "text/plain"
__textPlain = Index.Keyword "text/plain"

__shipping :: Index.Keyword "shipping"
__shipping = Index.Keyword "shipping"

__billing :: Index.Keyword "billing"
__billing = Index.Keyword "billing"

__home :: Index.Keyword "home"
__home = Index.Keyword "home"

__work :: Index.Keyword "work"
__work = Index.Keyword "work"

__mobile :: Index.Keyword "mobile"
__mobile = Index.Keyword "mobile"

__fax :: Index.Keyword "fax"
__fax = Index.Keyword "fax"

__pager :: Index.Keyword "pager"
__pager = Index.Keyword "pager"

__off :: Index.Keyword "off"
__off = Index.Keyword "off"

__on :: Index.Keyword "on"
__on = Index.Keyword "on"

__name :: Index.Keyword "name"
__name = Index.Keyword "name"

__honorificPrefix :: Index.Keyword "honorific-prefix"
__honorificPrefix = Index.Keyword "honorific-prefix"

__givenName :: Index.Keyword "given-name"
__givenName = Index.Keyword "given-name"

__additionalName :: Index.Keyword "additional-name"
__additionalName = Index.Keyword "additional-name"

__familyName :: Index.Keyword "family-name"
__familyName = Index.Keyword "family-name"

__honorificSuffix :: Index.Keyword "honorific-suffix"
__honorificSuffix = Index.Keyword "honorific-suffix"

__nickname :: Index.Keyword "nickname"
__nickname = Index.Keyword "nickname"

__organizationTitle :: Index.Keyword "organization-title"
__organizationTitle = Index.Keyword "organization-title"

__username :: Index.Keyword "username"
__username = Index.Keyword "username"

__newPassword :: Index.Keyword "new-password"
__newPassword = Index.Keyword "new-password"

__currentPassword :: Index.Keyword "current-password"
__currentPassword = Index.Keyword "current-password"

__oneTimeCode :: Index.Keyword "one-time-code"
__oneTimeCode = Index.Keyword "one-time-code"

__organization :: Index.Keyword "organization"
__organization = Index.Keyword "organization"

__streetAddress :: Index.Keyword "street-address"
__streetAddress = Index.Keyword "street-address"

__addressLine1 :: Index.Keyword "address-line1"
__addressLine1 = Index.Keyword "address-line1"

__addressLine2 :: Index.Keyword "address-line2"
__addressLine2 = Index.Keyword "address-line2"

__addressLine3 :: Index.Keyword "address-line3"
__addressLine3 = Index.Keyword "address-line3"

__addressLevel4 :: Index.Keyword "address-level4"
__addressLevel4 = Index.Keyword "address-level4"

__addressLevel3 :: Index.Keyword "address-level3"
__addressLevel3 = Index.Keyword "address-level3"

__addressLevel2 :: Index.Keyword "address-level2"
__addressLevel2 = Index.Keyword "address-level2"

__addressLevel1 :: Index.Keyword "address-level1"
__addressLevel1 = Index.Keyword "address-level1"

__country :: Index.Keyword "country"
__country = Index.Keyword "country"

__countryName :: Index.Keyword "country-name"
__countryName = Index.Keyword "country-name"

__postalCode :: Index.Keyword "postal-code"
__postalCode = Index.Keyword "postal-code"

__ccName :: Index.Keyword "cc-name"
__ccName = Index.Keyword "cc-name"

__ccGivenName :: Index.Keyword "cc-given-name"
__ccGivenName = Index.Keyword "cc-given-name"

__ccAdditionalName :: Index.Keyword "cc-additional-name"
__ccAdditionalName = Index.Keyword "cc-additional-name"

__ccFamilyName :: Index.Keyword "cc-family-name"
__ccFamilyName = Index.Keyword "cc-family-name"

__ccNumber :: Index.Keyword "cc-number"
__ccNumber = Index.Keyword "cc-number"

__ccExp :: Index.Keyword "cc-exp"
__ccExp = Index.Keyword "cc-exp"

__ccExpMonth :: Index.Keyword "cc-exp-month"
__ccExpMonth = Index.Keyword "cc-exp-month"

__ccExpYear :: Index.Keyword "cc-exp-year"
__ccExpYear = Index.Keyword "cc-exp-year"

__ccCsc :: Index.Keyword "cc-csc"
__ccCsc = Index.Keyword "cc-csc"

__ccType :: Index.Keyword "cc-type"
__ccType = Index.Keyword "cc-type"

__transactionCurrency :: Index.Keyword "transaction-currency"
__transactionCurrency = Index.Keyword "transaction-currency"

__transactionAmount :: Index.Keyword "transaction-amount"
__transactionAmount = Index.Keyword "transaction-amount"

__language :: Index.Keyword "language"
__language = Index.Keyword "language"

__bday :: Index.Keyword "bday"
__bday = Index.Keyword "bday"

__bdayDay :: Index.Keyword "bday-day"
__bdayDay = Index.Keyword "bday-day"

__bdayMonth :: Index.Keyword "bday-month"
__bdayMonth = Index.Keyword "bday-month"

__bdayYear :: Index.Keyword "bday-year"
__bdayYear = Index.Keyword "bday-year"

__sex :: Index.Keyword "sex"
__sex = Index.Keyword "sex"

__photo :: Index.Keyword "photo"
__photo = Index.Keyword "photo"

__telCountryCode :: Index.Keyword "tel-country-code"
__telCountryCode = Index.Keyword "tel-country-code"

__telNational :: Index.Keyword "tel-national"
__telNational = Index.Keyword "tel-national"

__telAreaCode :: Index.Keyword "tel-area-code"
__telAreaCode = Index.Keyword "tel-area-code"

__telLocal :: Index.Keyword "tel-local"
__telLocal = Index.Keyword "tel-local"

__telLocalPrefix :: Index.Keyword "tel-local-prefix"
__telLocalPrefix = Index.Keyword "tel-local-prefix"

__telLocalSuffix :: Index.Keyword "tel-local-suffix"
__telLocalSuffix = Index.Keyword "tel-local-suffix"

__telExtension :: Index.Keyword "tel-extension"
__telExtension = Index.Keyword "tel-extension"

__impp :: Index.Keyword "impp"
__impp = Index.Keyword "impp"

__value :: Index.Keyword "value"
__value = Index.Keyword "value"

__untilFound :: Index.Keyword "until-found"
__untilFound = Index.Keyword "until-found"

__sentences :: Index.Keyword "sentences"
__sentences = Index.Keyword "sentences"

__words :: Index.Keyword "words"
__words = Index.Keyword "words"

__characters :: Index.Keyword "characters"
__characters = Index.Keyword "characters"

__numeric :: Index.Keyword "numeric"
__numeric = Index.Keyword "numeric"

__decimal :: Index.Keyword "decimal"
__decimal = Index.Keyword "decimal"

__enter :: Index.Keyword "enter"
__enter = Index.Keyword "enter"

__done :: Index.Keyword "done"
__done = Index.Keyword "done"

__go :: Index.Keyword "go"
__go = Index.Keyword "go"

__previous :: Index.Keyword "previous"
__previous = Index.Keyword "previous"

__send :: Index.Keyword "send"
__send = Index.Keyword "send"

__manual :: Index.Keyword "manual"
__manual = Index.Keyword "manual"

__toggle :: Index.Keyword "toggle"
__toggle = Index.Keyword "toggle"

__show :: Index.Keyword "show"
__show = Index.Keyword "show"

__hide :: Index.Keyword "hide"
__hide = Index.Keyword "hide"

__allowPopups :: Index.Keyword "allow-popups"
__allowPopups = Index.Keyword "allow-popups"

__allowTopNavigation :: Index.Keyword "allow-top-navigation"
__allowTopNavigation = Index.Keyword "allow-top-navigation"

__allowTopNavigationByUserActivation :: Index.Keyword "allow-top-navigation-by-user-activation"
__allowTopNavigationByUserActivation = Index.Keyword "allow-top-navigation-by-user-activation"

__allowSameOrigin :: Index.Keyword "allow-same-origin"
__allowSameOrigin = Index.Keyword "allow-same-origin"

__allowForms :: Index.Keyword "allow-forms"
__allowForms = Index.Keyword "allow-forms"

__allowPointerLock :: Index.Keyword "allow-pointer-lock"
__allowPointerLock = Index.Keyword "allow-pointer-lock"

__allowScripts :: Index.Keyword "allow-scripts"
__allowScripts = Index.Keyword "allow-scripts"

__allowPopupsToEscapeSandbox :: Index.Keyword "allow-popups-to-escape-sandbox"
__allowPopupsToEscapeSandbox = Index.Keyword "allow-popups-to-escape-sandbox"

__allowModals :: Index.Keyword "allow-modals"
__allowModals = Index.Keyword "allow-modals"

__allowOrientationLock :: Index.Keyword "allow-orientation-lock"
__allowOrientationLock = Index.Keyword "allow-orientation-lock"

__allowPresentation :: Index.Keyword "allow-presentation"
__allowPresentation = Index.Keyword "allow-presentation"

__allowDownloads :: Index.Keyword "allow-downloads"
__allowDownloads = Index.Keyword "allow-downloads"

__allowTopNavigationToCustomProtocols :: Index.Keyword "allow-top-navigation-to-custom-protocols"
__allowTopNavigationToCustomProtocols = Index.Keyword "allow-top-navigation-to-custom-protocols"
