module Deku.DOM.Indexed where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import Deku.Attribute (Attribute, AttributeValue, unsafeAttribute)
import Deku.Control (elementify2)
import Deku.Core (Nut)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Deku.DOM.Indexed.Index (Indexed, Keyword(..))
import Data.Newtype as Data.Newtype
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types

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

html :: Array (Event (Attribute (Indexed (HTMLHtmlElement ())))) -> Array Nut -> Nut
html = elementify2 {-  -} "html"

html_ :: Array Nut -> Nut
html_ = elementify2 {-  -} "html" []

head :: Array (Event (Attribute (Indexed (HTMLHeadElement ())))) -> Array Nut -> Nut
head = elementify2 {-  -} "head"

head_ :: Array Nut -> Nut
head_ = elementify2 {-  -} "head" []

title :: Array (Event (Attribute (Indexed (HTMLTitleElement ())))) -> Array Nut -> Nut
title = elementify2 {-  -} "title"

title_ :: Array Nut -> Nut
title_ = elementify2 {-  -} "title" []

base :: Array (Event (Attribute (Indexed (HTMLBaseElement ())))) -> Array Nut -> Nut
base = elementify2 {-  -} "base"

base_ :: Array Nut -> Nut
base_ = elementify2 {-  -} "base" []

link :: Array (Event (Attribute (Indexed (HTMLLinkElement ())))) -> Array Nut -> Nut
link = elementify2 {-  -} "link"

link_ :: Array Nut -> Nut
link_ = elementify2 {-  -} "link" []

meta :: Array (Event (Attribute (Indexed (HTMLMetaElement ())))) -> Array Nut -> Nut
meta = elementify2 {-  -} "meta"

meta_ :: Array Nut -> Nut
meta_ = elementify2 {-  -} "meta" []

style :: Array (Event (Attribute (Indexed (HTMLStyleElement ())))) -> Array Nut -> Nut
style = elementify2 {-  -} "style"

style_ :: Array Nut -> Nut
style_ = elementify2 {-  -} "style" []

body :: Array (Event (Attribute (Indexed (HTMLBodyElement ())))) -> Array Nut -> Nut
body = elementify2 {-  -} "body"

body_ :: Array Nut -> Nut
body_ = elementify2 {-  -} "body" []

article :: Array (Event (Attribute (Indexed (HTMLArticleElement ())))) -> Array Nut -> Nut
article = elementify2 {-  -} "article"

article_ :: Array Nut -> Nut
article_ = elementify2 {-  -} "article" []

section :: Array (Event (Attribute (Indexed (HTMLSectionElement ())))) -> Array Nut -> Nut
section = elementify2 {-  -} "section"

section_ :: Array Nut -> Nut
section_ = elementify2 {-  -} "section" []

nav :: Array (Event (Attribute (Indexed (HTMLNavElement ())))) -> Array Nut -> Nut
nav = elementify2 {-  -} "nav"

nav_ :: Array Nut -> Nut
nav_ = elementify2 {-  -} "nav" []

aside :: Array (Event (Attribute (Indexed (HTMLAsideElement ())))) -> Array Nut -> Nut
aside = elementify2 {-  -} "aside"

aside_ :: Array Nut -> Nut
aside_ = elementify2 {-  -} "aside" []

h1 :: Array (Event (Attribute (Indexed (HTMLH1Element ())))) -> Array Nut -> Nut
h1 = elementify2 {-  -} "h1"

h1_ :: Array Nut -> Nut
h1_ = elementify2 {-  -} "h1" []

h2 :: Array (Event (Attribute (Indexed (HTMLH2Element ())))) -> Array Nut -> Nut
h2 = elementify2 {-  -} "h2"

h2_ :: Array Nut -> Nut
h2_ = elementify2 {-  -} "h2" []

h3 :: Array (Event (Attribute (Indexed (HTMLH3Element ())))) -> Array Nut -> Nut
h3 = elementify2 {-  -} "h3"

h3_ :: Array Nut -> Nut
h3_ = elementify2 {-  -} "h3" []

h4 :: Array (Event (Attribute (Indexed (HTMLH4Element ())))) -> Array Nut -> Nut
h4 = elementify2 {-  -} "h4"

h4_ :: Array Nut -> Nut
h4_ = elementify2 {-  -} "h4" []

h5 :: Array (Event (Attribute (Indexed (HTMLH5Element ())))) -> Array Nut -> Nut
h5 = elementify2 {-  -} "h5"

h5_ :: Array Nut -> Nut
h5_ = elementify2 {-  -} "h5" []

h6 :: Array (Event (Attribute (Indexed (HTMLH6Element ())))) -> Array Nut -> Nut
h6 = elementify2 {-  -} "h6"

h6_ :: Array Nut -> Nut
h6_ = elementify2 {-  -} "h6" []

hgroup :: Array (Event (Attribute (Indexed (HTMLHgroupElement ())))) -> Array Nut -> Nut
hgroup = elementify2 {-  -} "hgroup"

hgroup_ :: Array Nut -> Nut
hgroup_ = elementify2 {-  -} "hgroup" []

header :: Array (Event (Attribute (Indexed (HTMLHeaderElement ())))) -> Array Nut -> Nut
header = elementify2 {-  -} "header"

header_ :: Array Nut -> Nut
header_ = elementify2 {-  -} "header" []

footer :: Array (Event (Attribute (Indexed (HTMLFooterElement ())))) -> Array Nut -> Nut
footer = elementify2 {-  -} "footer"

footer_ :: Array Nut -> Nut
footer_ = elementify2 {-  -} "footer" []

address :: Array (Event (Attribute (Indexed (HTMLAddressElement ())))) -> Array Nut -> Nut
address = elementify2 {-  -} "address"

address_ :: Array Nut -> Nut
address_ = elementify2 {-  -} "address" []

p :: Array (Event (Attribute (Indexed (HTMLPElement ())))) -> Array Nut -> Nut
p = elementify2 {-  -} "p"

p_ :: Array Nut -> Nut
p_ = elementify2 {-  -} "p" []

hr :: Array (Event (Attribute (Indexed (HTMLHrElement ())))) -> Array Nut -> Nut
hr = elementify2 {-  -} "hr"

hr_ :: Array Nut -> Nut
hr_ = elementify2 {-  -} "hr" []

pre :: Array (Event (Attribute (Indexed (HTMLPreElement ())))) -> Array Nut -> Nut
pre = elementify2 {-  -} "pre"

pre_ :: Array Nut -> Nut
pre_ = elementify2 {-  -} "pre" []

blockquote :: Array (Event (Attribute (Indexed (HTMLBlockquoteElement ())))) -> Array Nut -> Nut
blockquote = elementify2 {-  -} "blockquote"

blockquote_ :: Array Nut -> Nut
blockquote_ = elementify2 {-  -} "blockquote" []

ol :: Array (Event (Attribute (Indexed (HTMLOlElement ())))) -> Array Nut -> Nut
ol = elementify2 {-  -} "ol"

ol_ :: Array Nut -> Nut
ol_ = elementify2 {-  -} "ol" []

ul :: Array (Event (Attribute (Indexed (HTMLUlElement ())))) -> Array Nut -> Nut
ul = elementify2 {-  -} "ul"

ul_ :: Array Nut -> Nut
ul_ = elementify2 {-  -} "ul" []

menu :: Array (Event (Attribute (Indexed (HTMLMenuElement ())))) -> Array Nut -> Nut
menu = elementify2 {-  -} "menu"

menu_ :: Array Nut -> Nut
menu_ = elementify2 {-  -} "menu" []

li :: Array (Event (Attribute (Indexed (HTMLLiElement ())))) -> Array Nut -> Nut
li = elementify2 {-  -} "li"

li_ :: Array Nut -> Nut
li_ = elementify2 {-  -} "li" []

dl :: Array (Event (Attribute (Indexed (HTMLDlElement ())))) -> Array Nut -> Nut
dl = elementify2 {-  -} "dl"

dl_ :: Array Nut -> Nut
dl_ = elementify2 {-  -} "dl" []

dt :: Array (Event (Attribute (Indexed (HTMLDtElement ())))) -> Array Nut -> Nut
dt = elementify2 {-  -} "dt"

dt_ :: Array Nut -> Nut
dt_ = elementify2 {-  -} "dt" []

dd :: Array (Event (Attribute (Indexed (HTMLDdElement ())))) -> Array Nut -> Nut
dd = elementify2 {-  -} "dd"

dd_ :: Array Nut -> Nut
dd_ = elementify2 {-  -} "dd" []

figure :: Array (Event (Attribute (Indexed (HTMLFigureElement ())))) -> Array Nut -> Nut
figure = elementify2 {-  -} "figure"

figure_ :: Array Nut -> Nut
figure_ = elementify2 {-  -} "figure" []

figcaption :: Array (Event (Attribute (Indexed (HTMLFigcaptionElement ())))) -> Array Nut -> Nut
figcaption = elementify2 {-  -} "figcaption"

figcaption_ :: Array Nut -> Nut
figcaption_ = elementify2 {-  -} "figcaption" []

main :: Array (Event (Attribute (Indexed (HTMLMainElement ())))) -> Array Nut -> Nut
main = elementify2 {-  -} "main"

main_ :: Array Nut -> Nut
main_ = elementify2 {-  -} "main" []

search :: Array (Event (Attribute (Indexed (HTMLSearchElement ())))) -> Array Nut -> Nut
search = elementify2 {-  -} "search"

search_ :: Array Nut -> Nut
search_ = elementify2 {-  -} "search" []

div :: Array (Event (Attribute (Indexed (HTMLDivElement ())))) -> Array Nut -> Nut
div = elementify2 {-  -} "div"

div_ :: Array Nut -> Nut
div_ = elementify2 {-  -} "div" []

a :: Array (Event (Attribute (Indexed (HTMLAElement ())))) -> Array Nut -> Nut
a = elementify2 {-  -} "a"

a_ :: Array Nut -> Nut
a_ = elementify2 {-  -} "a" []

em :: Array (Event (Attribute (Indexed (HTMLEmElement ())))) -> Array Nut -> Nut
em = elementify2 {-  -} "em"

em_ :: Array Nut -> Nut
em_ = elementify2 {-  -} "em" []

strong :: Array (Event (Attribute (Indexed (HTMLStrongElement ())))) -> Array Nut -> Nut
strong = elementify2 {-  -} "strong"

strong_ :: Array Nut -> Nut
strong_ = elementify2 {-  -} "strong" []

small :: Array (Event (Attribute (Indexed (HTMLSmallElement ())))) -> Array Nut -> Nut
small = elementify2 {-  -} "small"

small_ :: Array Nut -> Nut
small_ = elementify2 {-  -} "small" []

s :: Array (Event (Attribute (Indexed (HTMLSElement ())))) -> Array Nut -> Nut
s = elementify2 {-  -} "s"

s_ :: Array Nut -> Nut
s_ = elementify2 {-  -} "s" []

cite :: Array (Event (Attribute (Indexed (HTMLCiteElement ())))) -> Array Nut -> Nut
cite = elementify2 {-  -} "cite"

cite_ :: Array Nut -> Nut
cite_ = elementify2 {-  -} "cite" []

q :: Array (Event (Attribute (Indexed (HTMLQElement ())))) -> Array Nut -> Nut
q = elementify2 {-  -} "q"

q_ :: Array Nut -> Nut
q_ = elementify2 {-  -} "q" []

dfn :: Array (Event (Attribute (Indexed (HTMLDfnElement ())))) -> Array Nut -> Nut
dfn = elementify2 {-  -} "dfn"

dfn_ :: Array Nut -> Nut
dfn_ = elementify2 {-  -} "dfn" []

abbr :: Array (Event (Attribute (Indexed (HTMLAbbrElement ())))) -> Array Nut -> Nut
abbr = elementify2 {-  -} "abbr"

abbr_ :: Array Nut -> Nut
abbr_ = elementify2 {-  -} "abbr" []

ruby :: Array (Event (Attribute (Indexed (HTMLRubyElement ())))) -> Array Nut -> Nut
ruby = elementify2 {-  -} "ruby"

ruby_ :: Array Nut -> Nut
ruby_ = elementify2 {-  -} "ruby" []

rt :: Array (Event (Attribute (Indexed (HTMLRtElement ())))) -> Array Nut -> Nut
rt = elementify2 {-  -} "rt"

rt_ :: Array Nut -> Nut
rt_ = elementify2 {-  -} "rt" []

rp :: Array (Event (Attribute (Indexed (HTMLRpElement ())))) -> Array Nut -> Nut
rp = elementify2 {-  -} "rp"

rp_ :: Array Nut -> Nut
rp_ = elementify2 {-  -} "rp" []

xdata :: Array (Event (Attribute (Indexed (HTMLDataElement ())))) -> Array Nut -> Nut
xdata = elementify2 {-  -} "data"

xdata_ :: Array Nut -> Nut
xdata_ = elementify2 {-  -} "data" []

time :: Array (Event (Attribute (Indexed (HTMLTimeElement ())))) -> Array Nut -> Nut
time = elementify2 {-  -} "time"

time_ :: Array Nut -> Nut
time_ = elementify2 {-  -} "time" []

code :: Array (Event (Attribute (Indexed (HTMLCodeElement ())))) -> Array Nut -> Nut
code = elementify2 {-  -} "code"

code_ :: Array Nut -> Nut
code_ = elementify2 {-  -} "code" []

var :: Array (Event (Attribute (Indexed (HTMLVarElement ())))) -> Array Nut -> Nut
var = elementify2 {-  -} "var"

var_ :: Array Nut -> Nut
var_ = elementify2 {-  -} "var" []

samp :: Array (Event (Attribute (Indexed (HTMLSampElement ())))) -> Array Nut -> Nut
samp = elementify2 {-  -} "samp"

samp_ :: Array Nut -> Nut
samp_ = elementify2 {-  -} "samp" []

kbd :: Array (Event (Attribute (Indexed (HTMLKbdElement ())))) -> Array Nut -> Nut
kbd = elementify2 {-  -} "kbd"

kbd_ :: Array Nut -> Nut
kbd_ = elementify2 {-  -} "kbd" []

sub :: Array (Event (Attribute (Indexed (HTMLSubElement ())))) -> Array Nut -> Nut
sub = elementify2 {-  -} "sub"

sub_ :: Array Nut -> Nut
sub_ = elementify2 {-  -} "sub" []

sup :: Array (Event (Attribute (Indexed (HTMLSupElement ())))) -> Array Nut -> Nut
sup = elementify2 {-  -} "sup"

sup_ :: Array Nut -> Nut
sup_ = elementify2 {-  -} "sup" []

i :: Array (Event (Attribute (Indexed (HTMLIElement ())))) -> Array Nut -> Nut
i = elementify2 {-  -} "i"

i_ :: Array Nut -> Nut
i_ = elementify2 {-  -} "i" []

b :: Array (Event (Attribute (Indexed (HTMLBElement ())))) -> Array Nut -> Nut
b = elementify2 {-  -} "b"

b_ :: Array Nut -> Nut
b_ = elementify2 {-  -} "b" []

u :: Array (Event (Attribute (Indexed (HTMLUElement ())))) -> Array Nut -> Nut
u = elementify2 {-  -} "u"

u_ :: Array Nut -> Nut
u_ = elementify2 {-  -} "u" []

mark :: Array (Event (Attribute (Indexed (HTMLMarkElement ())))) -> Array Nut -> Nut
mark = elementify2 {-  -} "mark"

mark_ :: Array Nut -> Nut
mark_ = elementify2 {-  -} "mark" []

bdi :: Array (Event (Attribute (Indexed (HTMLBdiElement ())))) -> Array Nut -> Nut
bdi = elementify2 {-  -} "bdi"

bdi_ :: Array Nut -> Nut
bdi_ = elementify2 {-  -} "bdi" []

bdo :: Array (Event (Attribute (Indexed (HTMLBdoElement ())))) -> Array Nut -> Nut
bdo = elementify2 {-  -} "bdo"

bdo_ :: Array Nut -> Nut
bdo_ = elementify2 {-  -} "bdo" []

span :: Array (Event (Attribute (Indexed (HTMLSpanElement ())))) -> Array Nut -> Nut
span = elementify2 {-  -} "span"

span_ :: Array Nut -> Nut
span_ = elementify2 {-  -} "span" []

br :: Array (Event (Attribute (Indexed (HTMLBrElement ())))) -> Array Nut -> Nut
br = elementify2 {-  -} "br"

br_ :: Array Nut -> Nut
br_ = elementify2 {-  -} "br" []

wbr :: Array (Event (Attribute (Indexed (HTMLWbrElement ())))) -> Array Nut -> Nut
wbr = elementify2 {-  -} "wbr"

wbr_ :: Array Nut -> Nut
wbr_ = elementify2 {-  -} "wbr" []

ins :: Array (Event (Attribute (Indexed (HTMLInsElement ())))) -> Array Nut -> Nut
ins = elementify2 {-  -} "ins"

ins_ :: Array Nut -> Nut
ins_ = elementify2 {-  -} "ins" []

del :: Array (Event (Attribute (Indexed (HTMLDelElement ())))) -> Array Nut -> Nut
del = elementify2 {-  -} "del"

del_ :: Array Nut -> Nut
del_ = elementify2 {-  -} "del" []

picture :: Array (Event (Attribute (Indexed (HTMLPictureElement ())))) -> Array Nut -> Nut
picture = elementify2 {-  -} "picture"

picture_ :: Array Nut -> Nut
picture_ = elementify2 {-  -} "picture" []

source :: Array (Event (Attribute (Indexed (HTMLSourceElement ())))) -> Array Nut -> Nut
source = elementify2 {-  -} "source"

source_ :: Array Nut -> Nut
source_ = elementify2 {-  -} "source" []

img :: Array (Event (Attribute (Indexed (HTMLImgElement ())))) -> Array Nut -> Nut
img = elementify2 {-  -} "img"

img_ :: Array Nut -> Nut
img_ = elementify2 {-  -} "img" []

iframe :: Array (Event (Attribute (Indexed (HTMLIframeElement ())))) -> Array Nut -> Nut
iframe = elementify2 {-  -} "iframe"

iframe_ :: Array Nut -> Nut
iframe_ = elementify2 {-  -} "iframe" []

embed :: Array (Event (Attribute (Indexed (HTMLEmbedElement ())))) -> Array Nut -> Nut
embed = elementify2 {-  -} "embed"

embed_ :: Array Nut -> Nut
embed_ = elementify2 {-  -} "embed" []

object :: Array (Event (Attribute (Indexed (HTMLObjectElement ())))) -> Array Nut -> Nut
object = elementify2 {-  -} "object"

object_ :: Array Nut -> Nut
object_ = elementify2 {-  -} "object" []

video :: Array (Event (Attribute (Indexed (HTMLVideoElement ())))) -> Array Nut -> Nut
video = elementify2 {-  -} "video"

video_ :: Array Nut -> Nut
video_ = elementify2 {-  -} "video" []

audio :: Array (Event (Attribute (Indexed (HTMLAudioElement ())))) -> Array Nut -> Nut
audio = elementify2 {-  -} "audio"

audio_ :: Array Nut -> Nut
audio_ = elementify2 {-  -} "audio" []

track :: Array (Event (Attribute (Indexed (HTMLTrackElement ())))) -> Array Nut -> Nut
track = elementify2 {-  -} "track"

track_ :: Array Nut -> Nut
track_ = elementify2 {-  -} "track" []

map :: Array (Event (Attribute (Indexed (HTMLMapElement ())))) -> Array Nut -> Nut
map = elementify2 {-  -} "map"

map_ :: Array Nut -> Nut
map_ = elementify2 {-  -} "map" []

area :: Array (Event (Attribute (Indexed (HTMLAreaElement ())))) -> Array Nut -> Nut
area = elementify2 {-  -} "area"

area_ :: Array Nut -> Nut
area_ = elementify2 {-  -} "area" []

table :: Array (Event (Attribute (Indexed (HTMLTableElement ())))) -> Array Nut -> Nut
table = elementify2 {-  -} "table"

table_ :: Array Nut -> Nut
table_ = elementify2 {-  -} "table" []

caption :: Array (Event (Attribute (Indexed (HTMLCaptionElement ())))) -> Array Nut -> Nut
caption = elementify2 {-  -} "caption"

caption_ :: Array Nut -> Nut
caption_ = elementify2 {-  -} "caption" []

colgroup :: Array (Event (Attribute (Indexed (HTMLColgroupElement ())))) -> Array Nut -> Nut
colgroup = elementify2 {-  -} "colgroup"

colgroup_ :: Array Nut -> Nut
colgroup_ = elementify2 {-  -} "colgroup" []

col :: Array (Event (Attribute (Indexed (HTMLColElement ())))) -> Array Nut -> Nut
col = elementify2 {-  -} "col"

col_ :: Array Nut -> Nut
col_ = elementify2 {-  -} "col" []

tbody :: Array (Event (Attribute (Indexed (HTMLTbodyElement ())))) -> Array Nut -> Nut
tbody = elementify2 {-  -} "tbody"

tbody_ :: Array Nut -> Nut
tbody_ = elementify2 {-  -} "tbody" []

thead :: Array (Event (Attribute (Indexed (HTMLTheadElement ())))) -> Array Nut -> Nut
thead = elementify2 {-  -} "thead"

thead_ :: Array Nut -> Nut
thead_ = elementify2 {-  -} "thead" []

tfoot :: Array (Event (Attribute (Indexed (HTMLTfootElement ())))) -> Array Nut -> Nut
tfoot = elementify2 {-  -} "tfoot"

tfoot_ :: Array Nut -> Nut
tfoot_ = elementify2 {-  -} "tfoot" []

tr :: Array (Event (Attribute (Indexed (HTMLTrElement ())))) -> Array Nut -> Nut
tr = elementify2 {-  -} "tr"

tr_ :: Array Nut -> Nut
tr_ = elementify2 {-  -} "tr" []

td :: Array (Event (Attribute (Indexed (HTMLTdElement ())))) -> Array Nut -> Nut
td = elementify2 {-  -} "td"

td_ :: Array Nut -> Nut
td_ = elementify2 {-  -} "td" []

th :: Array (Event (Attribute (Indexed (HTMLThElement ())))) -> Array Nut -> Nut
th = elementify2 {-  -} "th"

th_ :: Array Nut -> Nut
th_ = elementify2 {-  -} "th" []

form :: Array (Event (Attribute (Indexed (HTMLFormElement ())))) -> Array Nut -> Nut
form = elementify2 {-  -} "form"

form_ :: Array Nut -> Nut
form_ = elementify2 {-  -} "form" []

label :: Array (Event (Attribute (Indexed (HTMLLabelElement ())))) -> Array Nut -> Nut
label = elementify2 {-  -} "label"

label_ :: Array Nut -> Nut
label_ = elementify2 {-  -} "label" []

input :: Array (Event (Attribute (Indexed (HTMLInputElement ())))) -> Array Nut -> Nut
input = elementify2 {-  -} "input"

input_ :: Array Nut -> Nut
input_ = elementify2 {-  -} "input" []

button :: Array (Event (Attribute (Indexed (HTMLButtonElement ())))) -> Array Nut -> Nut
button = elementify2 {-  -} "button"

button_ :: Array Nut -> Nut
button_ = elementify2 {-  -} "button" []

select :: Array (Event (Attribute (Indexed (HTMLSelectElement ())))) -> Array Nut -> Nut
select = elementify2 {-  -} "select"

select_ :: Array Nut -> Nut
select_ = elementify2 {-  -} "select" []

datalist :: Array (Event (Attribute (Indexed (HTMLDatalistElement ())))) -> Array Nut -> Nut
datalist = elementify2 {-  -} "datalist"

datalist_ :: Array Nut -> Nut
datalist_ = elementify2 {-  -} "datalist" []

optgroup :: Array (Event (Attribute (Indexed (HTMLOptgroupElement ())))) -> Array Nut -> Nut
optgroup = elementify2 {-  -} "optgroup"

optgroup_ :: Array Nut -> Nut
optgroup_ = elementify2 {-  -} "optgroup" []

option :: Array (Event (Attribute (Indexed (HTMLOptionElement ())))) -> Array Nut -> Nut
option = elementify2 {-  -} "option"

option_ :: Array Nut -> Nut
option_ = elementify2 {-  -} "option" []

textarea :: Array (Event (Attribute (Indexed (HTMLTextareaElement ())))) -> Array Nut -> Nut
textarea = elementify2 {-  -} "textarea"

textarea_ :: Array Nut -> Nut
textarea_ = elementify2 {-  -} "textarea" []

output :: Array (Event (Attribute (Indexed (HTMLOutputElement ())))) -> Array Nut -> Nut
output = elementify2 {-  -} "output"

output_ :: Array Nut -> Nut
output_ = elementify2 {-  -} "output" []

progress :: Array (Event (Attribute (Indexed (HTMLProgressElement ())))) -> Array Nut -> Nut
progress = elementify2 {-  -} "progress"

progress_ :: Array Nut -> Nut
progress_ = elementify2 {-  -} "progress" []

meter :: Array (Event (Attribute (Indexed (HTMLMeterElement ())))) -> Array Nut -> Nut
meter = elementify2 {-  -} "meter"

meter_ :: Array Nut -> Nut
meter_ = elementify2 {-  -} "meter" []

fieldset :: Array (Event (Attribute (Indexed (HTMLFieldsetElement ())))) -> Array Nut -> Nut
fieldset = elementify2 {-  -} "fieldset"

fieldset_ :: Array Nut -> Nut
fieldset_ = elementify2 {-  -} "fieldset" []

legend :: Array (Event (Attribute (Indexed (HTMLLegendElement ())))) -> Array Nut -> Nut
legend = elementify2 {-  -} "legend"

legend_ :: Array Nut -> Nut
legend_ = elementify2 {-  -} "legend" []

details :: Array (Event (Attribute (Indexed (HTMLDetailsElement ())))) -> Array Nut -> Nut
details = elementify2 {-  -} "details"

details_ :: Array Nut -> Nut
details_ = elementify2 {-  -} "details" []

summary :: Array (Event (Attribute (Indexed (HTMLSummaryElement ())))) -> Array Nut -> Nut
summary = elementify2 {-  -} "summary"

summary_ :: Array Nut -> Nut
summary_ = elementify2 {-  -} "summary" []

dialog :: Array (Event (Attribute (Indexed (HTMLDialogElement ())))) -> Array Nut -> Nut
dialog = elementify2 {-  -} "dialog"

dialog_ :: Array Nut -> Nut
dialog_ = elementify2 {-  -} "dialog" []

script :: Array (Event (Attribute (Indexed (HTMLScriptElement ())))) -> Array Nut -> Nut
script = elementify2 {-  -} "script"

script_ :: Array Nut -> Nut
script_ = elementify2 {-  -} "script" []

noscript :: Array (Event (Attribute (Indexed (HTMLNoscriptElement ())))) -> Array Nut -> Nut
noscript = elementify2 {-  -} "noscript"

noscript_ :: Array Nut -> Nut
noscript_ = elementify2 {-  -} "noscript" []

template :: Array (Event (Attribute (Indexed (HTMLTemplateElement ())))) -> Array Nut -> Nut
template = elementify2 {-  -} "template"

template_ :: Array Nut -> Nut
template_ = elementify2 {-  -} "template" []

slot :: Array (Event (Attribute (Indexed (HTMLSlotElement ())))) -> Array Nut -> Nut
slot = elementify2 {-  -} "slot"

slot_ :: Array Nut -> Nut
slot_ = elementify2 {-  -} "slot" []

canvas :: Array (Event (Attribute (Indexed (HTMLCanvasElement ())))) -> Array Nut -> Nut
canvas = elementify2 {-  -} "canvas"

canvas_ :: Array Nut -> Nut
canvas_ = elementify2 {-  -} "canvas" []

applet :: Array (Event (Attribute (Indexed (HTMLAppletElement ())))) -> Array Nut -> Nut
applet = elementify2 {-  -} "applet"

applet_ :: Array Nut -> Nut
applet_ = elementify2 {-  -} "applet" []

acronym :: Array (Event (Attribute (Indexed (HTMLAcronymElement ())))) -> Array Nut -> Nut
acronym = elementify2 {-  -} "acronym"

acronym_ :: Array Nut -> Nut
acronym_ = elementify2 {-  -} "acronym" []

bgsound :: Array (Event (Attribute (Indexed (HTMLBgsoundElement ())))) -> Array Nut -> Nut
bgsound = elementify2 {-  -} "bgsound"

bgsound_ :: Array Nut -> Nut
bgsound_ = elementify2 {-  -} "bgsound" []

dir :: Array (Event (Attribute (Indexed (HTMLDirElement ())))) -> Array Nut -> Nut
dir = elementify2 {-  -} "dir"

dir_ :: Array Nut -> Nut
dir_ = elementify2 {-  -} "dir" []

noframes :: Array (Event (Attribute (Indexed (HTMLNoframesElement ())))) -> Array Nut -> Nut
noframes = elementify2 {-  -} "noframes"

noframes_ :: Array Nut -> Nut
noframes_ = elementify2 {-  -} "noframes" []

isindex :: Array (Event (Attribute (Indexed (HTMLIsindexElement ())))) -> Array Nut -> Nut
isindex = elementify2 {-  -} "isindex"

isindex_ :: Array Nut -> Nut
isindex_ = elementify2 {-  -} "isindex" []

keygen :: Array (Event (Attribute (Indexed (HTMLKeygenElement ())))) -> Array Nut -> Nut
keygen = elementify2 {-  -} "keygen"

keygen_ :: Array Nut -> Nut
keygen_ = elementify2 {-  -} "keygen" []

listing :: Array (Event (Attribute (Indexed (HTMLListingElement ())))) -> Array Nut -> Nut
listing = elementify2 {-  -} "listing"

listing_ :: Array Nut -> Nut
listing_ = elementify2 {-  -} "listing" []

menuitem :: Array (Event (Attribute (Indexed (HTMLMenuitemElement ())))) -> Array Nut -> Nut
menuitem = elementify2 {-  -} "menuitem"

menuitem_ :: Array Nut -> Nut
menuitem_ = elementify2 {-  -} "menuitem" []

nextid :: Array (Event (Attribute (Indexed (HTMLNextidElement ())))) -> Array Nut -> Nut
nextid = elementify2 {-  -} "nextid"

nextid_ :: Array Nut -> Nut
nextid_ = elementify2 {-  -} "nextid" []

noembed :: Array (Event (Attribute (Indexed (HTMLNoembedElement ())))) -> Array Nut -> Nut
noembed = elementify2 {-  -} "noembed"

noembed_ :: Array Nut -> Nut
noembed_ = elementify2 {-  -} "noembed" []

param :: Array (Event (Attribute (Indexed (HTMLParamElement ())))) -> Array Nut -> Nut
param = elementify2 {-  -} "param"

param_ :: Array Nut -> Nut
param_ = elementify2 {-  -} "param" []

plaintext :: Array (Event (Attribute (Indexed (HTMLPlaintextElement ())))) -> Array Nut -> Nut
plaintext = elementify2 {-  -} "plaintext"

plaintext_ :: Array Nut -> Nut
plaintext_ = elementify2 {-  -} "plaintext" []

rb :: Array (Event (Attribute (Indexed (HTMLRbElement ())))) -> Array Nut -> Nut
rb = elementify2 {-  -} "rb"

rb_ :: Array Nut -> Nut
rb_ = elementify2 {-  -} "rb" []

rtc :: Array (Event (Attribute (Indexed (HTMLRtcElement ())))) -> Array Nut -> Nut
rtc = elementify2 {-  -} "rtc"

rtc_ :: Array Nut -> Nut
rtc_ = elementify2 {-  -} "rtc" []

strike :: Array (Event (Attribute (Indexed (HTMLStrikeElement ())))) -> Array Nut -> Nut
strike = elementify2 {-  -} "strike"

strike_ :: Array Nut -> Nut
strike_ = elementify2 {-  -} "strike" []

xmp :: Array (Event (Attribute (Indexed (HTMLXmpElement ())))) -> Array Nut -> Nut
xmp = elementify2 {-  -} "xmp"

xmp_ :: Array Nut -> Nut
xmp_ = elementify2 {-  -} "xmp" []

basefont :: Array (Event (Attribute (Indexed (HTMLBasefontElement ())))) -> Array Nut -> Nut
basefont = elementify2 {-  -} "basefont"

basefont_ :: Array Nut -> Nut
basefont_ = elementify2 {-  -} "basefont" []

big :: Array (Event (Attribute (Indexed (HTMLBigElement ())))) -> Array Nut -> Nut
big = elementify2 {-  -} "big"

big_ :: Array Nut -> Nut
big_ = elementify2 {-  -} "big" []

blink :: Array (Event (Attribute (Indexed (HTMLBlinkElement ())))) -> Array Nut -> Nut
blink = elementify2 {-  -} "blink"

blink_ :: Array Nut -> Nut
blink_ = elementify2 {-  -} "blink" []

center :: Array (Event (Attribute (Indexed (HTMLCenterElement ())))) -> Array Nut -> Nut
center = elementify2 {-  -} "center"

center_ :: Array Nut -> Nut
center_ = elementify2 {-  -} "center" []

font :: Array (Event (Attribute (Indexed (HTMLFontElement ())))) -> Array Nut -> Nut
font = elementify2 {-  -} "font"

font_ :: Array Nut -> Nut
font_ = elementify2 {-  -} "font" []

multicol :: Array (Event (Attribute (Indexed (HTMLMulticolElement ())))) -> Array Nut -> Nut
multicol = elementify2 {-  -} "multicol"

multicol_ :: Array Nut -> Nut
multicol_ = elementify2 {-  -} "multicol" []

nobr :: Array (Event (Attribute (Indexed (HTMLNobrElement ())))) -> Array Nut -> Nut
nobr = elementify2 {-  -} "nobr"

nobr_ :: Array Nut -> Nut
nobr_ = elementify2 {-  -} "nobr" []

spacer :: Array (Event (Attribute (Indexed (HTMLSpacerElement ())))) -> Array Nut -> Nut
spacer = elementify2 {-  -} "spacer"

spacer_ :: Array Nut -> Nut
spacer_ = elementify2 {-  -} "spacer" []

tt :: Array (Event (Attribute (Indexed (HTMLTtElement ())))) -> Array Nut -> Nut
tt = elementify2 {-  -} "tt"

tt_ :: Array Nut -> Nut
tt_ = elementify2 {-  -} "tt" []

marquee :: Array (Event (Attribute (Indexed (HTMLMarqueeElement ())))) -> Array Nut -> Nut
marquee = elementify2 {-  -} "marquee"

marquee_ :: Array Nut -> Nut
marquee_ = elementify2 {-  -} "marquee" []

frameset :: Array (Event (Attribute (Indexed (HTMLFramesetElement ())))) -> Array Nut -> Nut
frameset = elementify2 {-  -} "frameset"

frameset_ :: Array Nut -> Nut
frameset_ = elementify2 {-  -} "frameset" []

frame :: Array (Event (Attribute (Indexed (HTMLFrameElement ())))) -> Array Nut -> Nut
frame = elementify2 {-  -} "frame"

frame_ :: Array Nut -> Nut
frame_ = elementify2 {-  -} "frame" []

class Iscrossorigin (v :: Type) (a :: Type) | v -> a where
  iscrossorigin :: v -> AttributeValue

instance Iscrossorigin String String where
  iscrossorigin = Deku.Attribute.prop'

instance Iscrossorigin (Keyword "use-credentials") String where
  iscrossorigin = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iscrossorigin (Keyword "anonymous") String where
  iscrossorigin = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_crossorigin
  :: forall r v a
   . Iscrossorigin v a
  => Event v
  -> Event (Attribute (Indexed (crossorigin :: a | r)))
_crossorigin = Functor.map (unsafeAttribute <<< { key: "crossorigin", value: _ } <<< iscrossorigin)

_crossorigin_
  :: forall r v a. Iscrossorigin v a => v -> Event (Attribute (Indexed (crossorigin :: a | r)))
_crossorigin_ = _crossorigin <<< Applicative.pure

class Isloading (v :: Type) (a :: Type) | v -> a where
  isloading :: v -> AttributeValue

instance Isloading String String where
  isloading = Deku.Attribute.prop'

instance Isloading (Keyword "eager") String where
  isloading = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isloading (Keyword "lazy") String where
  isloading = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_loading
  :: forall r v a. Isloading v a => Event v -> Event (Attribute (Indexed (loading :: a | r)))
_loading = Functor.map (unsafeAttribute <<< { key: "loading", value: _ } <<< isloading)

_loading_ :: forall r v a. Isloading v a => v -> Event (Attribute (Indexed (loading :: a | r)))
_loading_ = _loading <<< Applicative.pure

class Isfetchpriority (v :: Type) (a :: Type) | v -> a where
  isfetchpriority :: v -> AttributeValue

instance Isfetchpriority String String where
  isfetchpriority = Deku.Attribute.prop'

instance Isfetchpriority (Keyword "auto") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isfetchpriority (Keyword "low") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isfetchpriority (Keyword "high") String where
  isfetchpriority = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_fetchpriority
  :: forall r v a
   . Isfetchpriority v a
  => Event v
  -> Event (Attribute (Indexed (fetchpriority :: a | r)))
_fetchpriority = Functor.map
  (unsafeAttribute <<< { key: "fetchpriority", value: _ } <<< isfetchpriority)

_fetchpriority_
  :: forall r v a. Isfetchpriority v a => v -> Event (Attribute (Indexed (fetchpriority :: a | r)))
_fetchpriority_ = _fetchpriority <<< Applicative.pure

class Isdir (v :: Type) (a :: Type) | v -> a where
  isdir :: v -> AttributeValue

instance Isdir String String where
  isdir = Deku.Attribute.prop'

instance Isdir (Keyword "auto") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdir (Keyword "rtl") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdir (Keyword "ltr") String where
  isdir = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_dir :: forall r v a. Isdir v a => Event v -> Event (Attribute (Indexed (dir :: a | r)))
_dir = Functor.map (unsafeAttribute <<< { key: "dir", value: _ } <<< isdir)

_dir_ :: forall r v a. Isdir v a => v -> Event (Attribute (Indexed (dir :: a | r)))
_dir_ = _dir <<< Applicative.pure

class Isname (v :: Type) (a :: Type) | v -> a where
  isname :: v -> AttributeValue

instance Isname String String where
  isname = Deku.Attribute.prop'

instance Isname (Keyword "color-scheme") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "theme-color") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "referrer") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "keywords") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "generator") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "description") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "author") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isname (Keyword "application-name") String where
  isname = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_name :: forall r v a. Isname v a => Event v -> Event (Attribute (Indexed (name :: a | r)))
_name = Functor.map (unsafeAttribute <<< { key: "name", value: _ } <<< isname)

_name_ :: forall r v a. Isname v a => v -> Event (Attribute (Indexed (name :: a | r)))
_name_ = _name <<< Applicative.pure

class IshttpEquiv (v :: Type) (a :: Type) | v -> a where
  ishttpEquiv :: v -> AttributeValue

instance IshttpEquiv String String where
  ishttpEquiv = Deku.Attribute.prop'

instance IshttpEquiv (Keyword "content-security-policy") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "x-ua-compatible") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "set-cookie") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "refresh") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "default-style") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "content-type") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance IshttpEquiv (Keyword "content-language") String where
  ishttpEquiv = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_httpEquiv
  :: forall r v a. IshttpEquiv v a => Event v -> Event (Attribute (Indexed (httpEquiv :: a | r)))
_httpEquiv = Functor.map (unsafeAttribute <<< { key: "http-equiv", value: _ } <<< ishttpEquiv)

_httpEquiv_
  :: forall r v a. IshttpEquiv v a => v -> Event (Attribute (Indexed (httpEquiv :: a | r)))
_httpEquiv_ = _httpEquiv <<< Applicative.pure

class Istype (v :: Type) (a :: Type) | v -> a where
  istype :: v -> AttributeValue

instance Istype String String where
  istype = Deku.Attribute.prop'

instance Istype (Keyword "button") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "reset") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "submit") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "image") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "file") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "radio") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "checkbox") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "color") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "range") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "number") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "datetime-local") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "time") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "week") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "month") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "date") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "password") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "email") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "url") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "tel") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "search") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "text") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "hidden") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "I") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "i") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "A") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "a") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Istype (Keyword "1") String where
  istype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_type :: forall r v a. Istype v a => Event v -> Event (Attribute (Indexed (type :: a | r)))
_type = Functor.map (unsafeAttribute <<< { key: "type", value: _ } <<< istype)

_type_ :: forall r v a. Istype v a => v -> Event (Attribute (Indexed (type :: a | r)))
_type_ = _type <<< Applicative.pure

class Isrel (v :: Type) (a :: Type) | v -> a where
  isrel :: v -> AttributeValue

instance Isrel String String where
  isrel = Deku.Attribute.prop'

instance Isrel (Keyword "prev") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "next") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "tag") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "stylesheet") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "search") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "preload") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "prefetch") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "preconnect") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "pingback") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "opener") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "noreferrer") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "noopener") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "nofollow") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "modulepreload") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "manifest") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "license") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "icon") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "help") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "external") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "dns-prefetch") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "canonical") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "bookmark") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "author") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isrel (Keyword "alternate") String where
  isrel = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_rel :: forall r v a. Isrel v a => Event v -> Event (Attribute (Indexed (rel :: a | r)))
_rel = Functor.map (unsafeAttribute <<< { key: "rel", value: _ } <<< isrel)

_rel_ :: forall r v a. Isrel v a => v -> Event (Attribute (Indexed (rel :: a | r)))
_rel_ = _rel <<< Applicative.pure

class Isdecoding (v :: Type) (a :: Type) | v -> a where
  isdecoding :: v -> AttributeValue

instance Isdecoding String String where
  isdecoding = Deku.Attribute.prop'

instance Isdecoding (Keyword "auto") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdecoding (Keyword "async") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isdecoding (Keyword "sync") String where
  isdecoding = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_decoding
  :: forall r v a. Isdecoding v a => Event v -> Event (Attribute (Indexed (decoding :: a | r)))
_decoding = Functor.map (unsafeAttribute <<< { key: "decoding", value: _ } <<< isdecoding)

_decoding_ :: forall r v a. Isdecoding v a => v -> Event (Attribute (Indexed (decoding :: a | r)))
_decoding_ = _decoding <<< Applicative.pure

class Iskind (v :: Type) (a :: Type) | v -> a where
  iskind :: v -> AttributeValue

instance Iskind String String where
  iskind = Deku.Attribute.prop'

instance Iskind (Keyword "metadata") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Keyword "chapters") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Keyword "descriptions") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Keyword "captions") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iskind (Keyword "subtitles") String where
  iskind = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_kind :: forall r v a. Iskind v a => Event v -> Event (Attribute (Indexed (kind :: a | r)))
_kind = Functor.map (unsafeAttribute <<< { key: "kind", value: _ } <<< iskind)

_kind_ :: forall r v a. Iskind v a => v -> Event (Attribute (Indexed (kind :: a | r)))
_kind_ = _kind <<< Applicative.pure

class Ispreload (v :: Type) (a :: Type) | v -> a where
  ispreload :: v -> AttributeValue

instance Ispreload String String where
  ispreload = Deku.Attribute.prop'

instance Ispreload (Keyword "auto") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispreload (Keyword "metadata") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispreload (Keyword "none") String where
  ispreload = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_preload
  :: forall r v a. Ispreload v a => Event v -> Event (Attribute (Indexed (preload :: a | r)))
_preload = Functor.map (unsafeAttribute <<< { key: "preload", value: _ } <<< ispreload)

_preload_ :: forall r v a. Ispreload v a => v -> Event (Attribute (Indexed (preload :: a | r)))
_preload_ = _preload <<< Applicative.pure

class Isshape (v :: Type) (a :: Type) | v -> a where
  isshape :: v -> AttributeValue

instance Isshape String String where
  isshape = Deku.Attribute.prop'

instance Isshape (Keyword "rectangle state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Keyword "polygon state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Keyword "default state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isshape (Keyword "circle state") String where
  isshape = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_shape :: forall r v a. Isshape v a => Event v -> Event (Attribute (Indexed (shape :: a | r)))
_shape = Functor.map (unsafeAttribute <<< { key: "shape", value: _ } <<< isshape)

_shape_ :: forall r v a. Isshape v a => v -> Event (Attribute (Indexed (shape :: a | r)))
_shape_ = _shape <<< Applicative.pure

class Isscope (v :: Type) (a :: Type) | v -> a where
  isscope :: v -> AttributeValue

instance Isscope String String where
  isscope = Deku.Attribute.prop'

instance Isscope (Keyword "auto") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Keyword "colgroup") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Keyword "rowgroup") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Keyword "col") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isscope (Keyword "row") String where
  isscope = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_scope :: forall r v a. Isscope v a => Event v -> Event (Attribute (Indexed (scope :: a | r)))
_scope = Functor.map (unsafeAttribute <<< { key: "scope", value: _ } <<< isscope)

_scope_ :: forall r v a. Isscope v a => v -> Event (Attribute (Indexed (scope :: a | r)))
_scope_ = _scope <<< Applicative.pure

class Iswrap (v :: Type) (a :: Type) | v -> a where
  iswrap :: v -> AttributeValue

instance Iswrap String String where
  iswrap = Deku.Attribute.prop'

instance Iswrap (Keyword "hard") String where
  iswrap = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Iswrap (Keyword "soft") String where
  iswrap = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_wrap :: forall r v a. Iswrap v a => Event v -> Event (Attribute (Indexed (wrap :: a | r)))
_wrap = Functor.map (unsafeAttribute <<< { key: "wrap", value: _ } <<< iswrap)

_wrap_ :: forall r v a. Iswrap v a => v -> Event (Attribute (Indexed (wrap :: a | r)))
_wrap_ = _wrap <<< Applicative.pure

class Ismethod (v :: Type) (a :: Type) | v -> a where
  ismethod :: v -> AttributeValue

instance Ismethod String String where
  ismethod = Deku.Attribute.prop'

instance Ismethod (Keyword "dialog") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ismethod (Keyword "post") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ismethod (Keyword "get") String where
  ismethod = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_method :: forall r v a. Ismethod v a => Event v -> Event (Attribute (Indexed (method :: a | r)))
_method = Functor.map (unsafeAttribute <<< { key: "method", value: _ } <<< ismethod)

_method_ :: forall r v a. Ismethod v a => v -> Event (Attribute (Indexed (method :: a | r)))
_method_ = _method <<< Applicative.pure

class Isenctype (v :: Type) (a :: Type) | v -> a where
  isenctype :: v -> AttributeValue

instance Isenctype String String where
  isenctype = Deku.Attribute.prop'

instance Isenctype (Keyword "text/plain") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenctype (Keyword "multipart/form-data") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenctype (Keyword "application/x-www-form-urlencoded") String where
  isenctype = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_enctype
  :: forall r v a. Isenctype v a => Event v -> Event (Attribute (Indexed (enctype :: a | r)))
_enctype = Functor.map (unsafeAttribute <<< { key: "enctype", value: _ } <<< isenctype)

_enctype_ :: forall r v a. Isenctype v a => v -> Event (Attribute (Indexed (enctype :: a | r)))
_enctype_ = _enctype <<< Applicative.pure

class Isautocomplete (v :: Type) (a :: Type) | v -> a where
  isautocomplete :: v -> AttributeValue

instance Isautocomplete String String where
  isautocomplete = Deku.Attribute.prop'

instance Isautocomplete (Keyword "impp") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "email") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-extension") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-local-suffix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-local-prefix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-local") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-area-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-national") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel-country-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "tel") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "photo") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "url") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "sex") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "bday-year") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "bday-month") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "bday-day") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "bday") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "language") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "transaction-amount") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "transaction-currency") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-type") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-csc") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-exp-year") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-exp-month") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-exp") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-number") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-family-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-additional-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-given-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "cc-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "postal-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "country-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "country") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-level1") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-level2") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-level3") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-level4") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-line3") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-line2") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "address-line1") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "street-address") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "organization") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "one-time-code") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "current-password") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "new-password") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "username") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "organization-title") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "nickname") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "honorific-suffix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "family-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "additional-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "given-name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "honorific-prefix") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "name") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "on") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "off") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "pager") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "fax") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "mobile") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "work") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "home") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "billing") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocomplete (Keyword "shipping") String where
  isautocomplete = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_autocomplete
  :: forall r v a
   . Isautocomplete v a
  => Event v
  -> Event (Attribute (Indexed (autocomplete :: a | r)))
_autocomplete = Functor.map
  (unsafeAttribute <<< { key: "autocomplete", value: _ } <<< isautocomplete)

_autocomplete_
  :: forall r v a. Isautocomplete v a => v -> Event (Attribute (Indexed (autocomplete :: a | r)))
_autocomplete_ = _autocomplete <<< Applicative.pure

class Isentry (v :: Type) (a :: Type) | v -> a where
  isentry :: v -> AttributeValue

instance Isentry (Keyword "value") String where
  isentry = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isentry (Keyword "name") String where
  isentry = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_entry :: forall r v a. Isentry v a => Event v -> Event (Attribute (Indexed (entry :: a | r)))
_entry = Functor.map (unsafeAttribute <<< { key: "entry", value: _ } <<< isentry)

_entry_ :: forall r v a. Isentry v a => v -> Event (Attribute (Indexed (entry :: a | r)))
_entry_ = _entry <<< Applicative.pure

class Ishidden (v :: Type) (a :: Type) | v -> a where
  ishidden :: v -> AttributeValue

instance Ishidden String String where
  ishidden = Deku.Attribute.prop'

instance Ishidden (Keyword "hidden") String where
  ishidden = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ishidden (Keyword "until-found") String where
  ishidden = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_hidden :: forall r v a. Ishidden v a => Event v -> Event (Attribute (Indexed (hidden :: a | r)))
_hidden = Functor.map (unsafeAttribute <<< { key: "hidden", value: _ } <<< ishidden)

_hidden_ :: forall r v a. Ishidden v a => v -> Event (Attribute (Indexed (hidden :: a | r)))
_hidden_ = _hidden <<< Applicative.pure

class Isautocapitalize (v :: Type) (a :: Type) | v -> a where
  isautocapitalize :: v -> AttributeValue

instance Isautocapitalize String String where
  isautocapitalize = Deku.Attribute.prop'

instance Isautocapitalize (Keyword "characters") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Keyword "words") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Keyword "sentences") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Keyword "on") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Keyword "none") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isautocapitalize (Keyword "off") String where
  isautocapitalize = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_autocapitalize
  :: forall r v a
   . Isautocapitalize v a
  => Event v
  -> Event (Attribute (Indexed (autocapitalize :: a | r)))
_autocapitalize = Functor.map
  (unsafeAttribute <<< { key: "autocapitalize", value: _ } <<< isautocapitalize)

_autocapitalize_
  :: forall r v a
   . Isautocapitalize v a
  => v
  -> Event (Attribute (Indexed (autocapitalize :: a | r)))
_autocapitalize_ = _autocapitalize <<< Applicative.pure

class Isinputmode (v :: Type) (a :: Type) | v -> a where
  isinputmode :: v -> AttributeValue

instance Isinputmode String String where
  isinputmode = Deku.Attribute.prop'

instance Isinputmode (Keyword "search") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "decimal") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "numeric") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "email") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "url") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "tel") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "text") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isinputmode (Keyword "none") String where
  isinputmode = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_inputmode
  :: forall r v a. Isinputmode v a => Event v -> Event (Attribute (Indexed (inputmode :: a | r)))
_inputmode = Functor.map (unsafeAttribute <<< { key: "inputmode", value: _ } <<< isinputmode)

_inputmode_
  :: forall r v a. Isinputmode v a => v -> Event (Attribute (Indexed (inputmode :: a | r)))
_inputmode_ = _inputmode <<< Applicative.pure

class Isenterkeyhint (v :: Type) (a :: Type) | v -> a where
  isenterkeyhint :: v -> AttributeValue

instance Isenterkeyhint String String where
  isenterkeyhint = Deku.Attribute.prop'

instance Isenterkeyhint (Keyword "send") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "search") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "previous") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "next") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "go") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "done") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Isenterkeyhint (Keyword "enter") String where
  isenterkeyhint = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_enterkeyhint
  :: forall r v a
   . Isenterkeyhint v a
  => Event v
  -> Event (Attribute (Indexed (enterkeyhint :: a | r)))
_enterkeyhint = Functor.map
  (unsafeAttribute <<< { key: "enterkeyhint", value: _ } <<< isenterkeyhint)

_enterkeyhint_
  :: forall r v a. Isenterkeyhint v a => v -> Event (Attribute (Indexed (enterkeyhint :: a | r)))
_enterkeyhint_ = _enterkeyhint <<< Applicative.pure

class Ispopover (v :: Type) (a :: Type) | v -> a where
  ispopover :: v -> AttributeValue

instance Ispopover String String where
  ispopover = Deku.Attribute.prop'

instance Ispopover (Keyword "manual") String where
  ispopover = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopover (Keyword "auto") String where
  ispopover = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_popover
  :: forall r v a. Ispopover v a => Event v -> Event (Attribute (Indexed (popover :: a | r)))
_popover = Functor.map (unsafeAttribute <<< { key: "popover", value: _ } <<< ispopover)

_popover_ :: forall r v a. Ispopover v a => v -> Event (Attribute (Indexed (popover :: a | r)))
_popover_ = _popover <<< Applicative.pure

class Ispopovertargetaction (v :: Type) (a :: Type) | v -> a where
  ispopovertargetaction :: v -> AttributeValue

instance Ispopovertargetaction String String where
  ispopovertargetaction = Deku.Attribute.prop'

instance Ispopovertargetaction (Keyword "hide") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopovertargetaction (Keyword "show") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Ispopovertargetaction (Keyword "toggle") String where
  ispopovertargetaction = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_popovertargetaction
  :: forall r v a
   . Ispopovertargetaction v a
  => Event v
  -> Event (Attribute (Indexed (popovertargetaction :: a | r)))
_popovertargetaction = Functor.map
  (unsafeAttribute <<< { key: "popovertargetaction", value: _ } <<< ispopovertargetaction)

_popovertargetaction_
  :: forall r v a
   . Ispopovertargetaction v a
  => v
  -> Event (Attribute (Indexed (popovertargetaction :: a | r)))
_popovertargetaction_ = _popovertargetaction <<< Applicative.pure

class Issandbox (v :: Type) (a :: Type) | v -> a where
  issandbox :: v -> AttributeValue

instance Issandbox String String where
  issandbox = Deku.Attribute.prop'

instance Issandbox (Keyword "allow-top-navigation-to-custom-protocols") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-downloads") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-presentation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-orientation-lock") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-modals") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-popups-to-escape-sandbox") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-scripts") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-pointer-lock") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-forms") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-same-origin") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-top-navigation-by-user-activation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-top-navigation") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

instance Issandbox (Keyword "allow-popups") String where
  issandbox = Deku.Attribute.prop' <<< Data.Newtype.unwrap

_sandbox
  :: forall r v a. Issandbox v a => Event v -> Event (Attribute (Indexed (sandbox :: a | r)))
_sandbox = Functor.map (unsafeAttribute <<< { key: "sandbox", value: _ } <<< issandbox)

_sandbox_ :: forall r v a. Issandbox v a => v -> Event (Attribute (Indexed (sandbox :: a | r)))
_sandbox_ = _sandbox <<< Applicative.pure

_version :: forall r. Event String -> Event (Attribute (Indexed (version :: String | r)))
_version = Functor.map (unsafeAttribute <<< { key: "version", value: _ } <<< Deku.Attribute.prop')

_version_ :: forall r. String -> Event (Attribute (Indexed (version :: String | r)))
_version_ = _version <<< Applicative.pure

_manifest :: forall r. Event String -> Event (Attribute (Indexed (manifest :: String | r)))
_manifest = Functor.map
  (unsafeAttribute <<< { key: "manifest", value: _ } <<< Deku.Attribute.prop')

_manifest_ :: forall r. String -> Event (Attribute (Indexed (manifest :: String | r)))
_manifest_ = _manifest <<< Applicative.pure

_profile :: forall r. Event String -> Event (Attribute (Indexed (profile :: String | r)))
_profile = Functor.map (unsafeAttribute <<< { key: "profile", value: _ } <<< Deku.Attribute.prop')

_profile_ :: forall r. String -> Event (Attribute (Indexed (profile :: String | r)))
_profile_ = _profile <<< Applicative.pure

_target :: forall r. Event String -> Event (Attribute (Indexed (target :: String | r)))
_target = Functor.map (unsafeAttribute <<< { key: "target", value: _ } <<< Deku.Attribute.prop')

_target_ :: forall r. String -> Event (Attribute (Indexed (target :: String | r)))
_target_ = _target <<< Applicative.pure

_href :: forall r. Event String -> Event (Attribute (Indexed (href :: String | r)))
_href = Functor.map (unsafeAttribute <<< { key: "href", value: _ } <<< Deku.Attribute.prop')

_href_ :: forall r. String -> Event (Attribute (Indexed (href :: String | r)))
_href_ = _href <<< Applicative.pure

_urn :: forall r. Event String -> Event (Attribute (Indexed (urn :: String | r)))
_urn = Functor.map (unsafeAttribute <<< { key: "urn", value: _ } <<< Deku.Attribute.prop')

_urn_ :: forall r. String -> Event (Attribute (Indexed (urn :: String | r)))
_urn_ = _urn <<< Applicative.pure

_rev :: forall r. Event String -> Event (Attribute (Indexed (rev :: String | r)))
_rev = Functor.map (unsafeAttribute <<< { key: "rev", value: _ } <<< Deku.Attribute.prop')

_rev_ :: forall r. String -> Event (Attribute (Indexed (rev :: String | r)))
_rev_ = _rev <<< Applicative.pure

_methods :: forall r. Event String -> Event (Attribute (Indexed (methods :: String | r)))
_methods = Functor.map (unsafeAttribute <<< { key: "methods", value: _ } <<< Deku.Attribute.prop')

_methods_ :: forall r. String -> Event (Attribute (Indexed (methods :: String | r)))
_methods_ = _methods <<< Applicative.pure

_charset :: forall r. Event String -> Event (Attribute (Indexed (charset :: String | r)))
_charset = Functor.map (unsafeAttribute <<< { key: "charset", value: _ } <<< Deku.Attribute.prop')

_charset_ :: forall r. String -> Event (Attribute (Indexed (charset :: String | r)))
_charset_ = _charset <<< Applicative.pure

_disabled :: forall r. Event String -> Event (Attribute (Indexed (disabled :: String | r)))
_disabled = Functor.map
  (unsafeAttribute <<< { key: "disabled", value: _ } <<< Deku.Attribute.prop')

_disabled_ :: forall r. String -> Event (Attribute (Indexed (disabled :: String | r)))
_disabled_ = _disabled <<< Applicative.pure

_color :: forall r. Event String -> Event (Attribute (Indexed (color :: String | r)))
_color = Functor.map (unsafeAttribute <<< { key: "color", value: _ } <<< Deku.Attribute.prop')

_color_ :: forall r. String -> Event (Attribute (Indexed (color :: String | r)))
_color_ = _color <<< Applicative.pure

_blocking :: forall r. Event String -> Event (Attribute (Indexed (blocking :: String | r)))
_blocking = Functor.map
  (unsafeAttribute <<< { key: "blocking", value: _ } <<< Deku.Attribute.prop')

_blocking_ :: forall r. String -> Event (Attribute (Indexed (blocking :: String | r)))
_blocking_ = _blocking <<< Applicative.pure

_as :: forall r. Event String -> Event (Attribute (Indexed (as :: String | r)))
_as = Functor.map (unsafeAttribute <<< { key: "as", value: _ } <<< Deku.Attribute.prop')

_as_ :: forall r. String -> Event (Attribute (Indexed (as :: String | r)))
_as_ = _as <<< Applicative.pure

_sizes :: forall r. Event String -> Event (Attribute (Indexed (sizes :: String | r)))
_sizes = Functor.map (unsafeAttribute <<< { key: "sizes", value: _ } <<< Deku.Attribute.prop')

_sizes_ :: forall r. String -> Event (Attribute (Indexed (sizes :: String | r)))
_sizes_ = _sizes <<< Applicative.pure

_imagesizes :: forall r. Event String -> Event (Attribute (Indexed (imagesizes :: String | r)))
_imagesizes = Functor.map
  (unsafeAttribute <<< { key: "imagesizes", value: _ } <<< Deku.Attribute.prop')

_imagesizes_ :: forall r. String -> Event (Attribute (Indexed (imagesizes :: String | r)))
_imagesizes_ = _imagesizes <<< Applicative.pure

_imagesrcset :: forall r. Event String -> Event (Attribute (Indexed (imagesrcset :: String | r)))
_imagesrcset = Functor.map
  (unsafeAttribute <<< { key: "imagesrcset", value: _ } <<< Deku.Attribute.prop')

_imagesrcset_ :: forall r. String -> Event (Attribute (Indexed (imagesrcset :: String | r)))
_imagesrcset_ = _imagesrcset <<< Applicative.pure

_title :: forall r. Event String -> Event (Attribute (Indexed (title :: String | r)))
_title = Functor.map (unsafeAttribute <<< { key: "title", value: _ } <<< Deku.Attribute.prop')

_title_ :: forall r. String -> Event (Attribute (Indexed (title :: String | r)))
_title_ = _title <<< Applicative.pure

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

_integrity :: forall r. Event String -> Event (Attribute (Indexed (integrity :: String | r)))
_integrity = Functor.map
  (unsafeAttribute <<< { key: "integrity", value: _ } <<< Deku.Attribute.prop')

_integrity_ :: forall r. String -> Event (Attribute (Indexed (integrity :: String | r)))
_integrity_ = _integrity <<< Applicative.pure

_media :: forall r. Event String -> Event (Attribute (Indexed (media :: String | r)))
_media = Functor.map (unsafeAttribute <<< { key: "media", value: _ } <<< Deku.Attribute.prop')

_media_ :: forall r. String -> Event (Attribute (Indexed (media :: String | r)))
_media_ = _media <<< Applicative.pure

_scheme :: forall r. Event String -> Event (Attribute (Indexed (scheme :: String | r)))
_scheme = Functor.map (unsafeAttribute <<< { key: "scheme", value: _ } <<< Deku.Attribute.prop')

_scheme_ :: forall r. String -> Event (Attribute (Indexed (scheme :: String | r)))
_scheme_ = _scheme <<< Applicative.pure

_content :: forall r. Event String -> Event (Attribute (Indexed (content :: String | r)))
_content = Functor.map (unsafeAttribute <<< { key: "content", value: _ } <<< Deku.Attribute.prop')

_content_ :: forall r. String -> Event (Attribute (Indexed (content :: String | r)))
_content_ = _content <<< Applicative.pure

_vlink :: forall r. Event String -> Event (Attribute (Indexed (vlink :: String | r)))
_vlink = Functor.map (unsafeAttribute <<< { key: "vlink", value: _ } <<< Deku.Attribute.prop')

_vlink_ :: forall r. String -> Event (Attribute (Indexed (vlink :: String | r)))
_vlink_ = _vlink <<< Applicative.pure

_topmargin :: forall r. Event String -> Event (Attribute (Indexed (topmargin :: String | r)))
_topmargin = Functor.map
  (unsafeAttribute <<< { key: "topmargin", value: _ } <<< Deku.Attribute.prop')

_topmargin_ :: forall r. String -> Event (Attribute (Indexed (topmargin :: String | r)))
_topmargin_ = _topmargin <<< Applicative.pure

_text :: forall r. Event String -> Event (Attribute (Indexed (text :: String | r)))
_text = Functor.map (unsafeAttribute <<< { key: "text", value: _ } <<< Deku.Attribute.prop')

_text_ :: forall r. String -> Event (Attribute (Indexed (text :: String | r)))
_text_ = _text <<< Applicative.pure

_rightmargin :: forall r. Event String -> Event (Attribute (Indexed (rightmargin :: String | r)))
_rightmargin = Functor.map
  (unsafeAttribute <<< { key: "rightmargin", value: _ } <<< Deku.Attribute.prop')

_rightmargin_ :: forall r. String -> Event (Attribute (Indexed (rightmargin :: String | r)))
_rightmargin_ = _rightmargin <<< Applicative.pure

_marginwidth :: forall r. Event String -> Event (Attribute (Indexed (marginwidth :: String | r)))
_marginwidth = Functor.map
  (unsafeAttribute <<< { key: "marginwidth", value: _ } <<< Deku.Attribute.prop')

_marginwidth_ :: forall r. String -> Event (Attribute (Indexed (marginwidth :: String | r)))
_marginwidth_ = _marginwidth <<< Applicative.pure

_marginheight :: forall r. Event String -> Event (Attribute (Indexed (marginheight :: String | r)))
_marginheight = Functor.map
  (unsafeAttribute <<< { key: "marginheight", value: _ } <<< Deku.Attribute.prop')

_marginheight_ :: forall r. String -> Event (Attribute (Indexed (marginheight :: String | r)))
_marginheight_ = _marginheight <<< Applicative.pure

_link :: forall r. Event String -> Event (Attribute (Indexed (link :: String | r)))
_link = Functor.map (unsafeAttribute <<< { key: "link", value: _ } <<< Deku.Attribute.prop')

_link_ :: forall r. String -> Event (Attribute (Indexed (link :: String | r)))
_link_ = _link <<< Applicative.pure

_leftmargin :: forall r. Event String -> Event (Attribute (Indexed (leftmargin :: String | r)))
_leftmargin = Functor.map
  (unsafeAttribute <<< { key: "leftmargin", value: _ } <<< Deku.Attribute.prop')

_leftmargin_ :: forall r. String -> Event (Attribute (Indexed (leftmargin :: String | r)))
_leftmargin_ = _leftmargin <<< Applicative.pure

_bottommargin :: forall r. Event String -> Event (Attribute (Indexed (bottommargin :: String | r)))
_bottommargin = Functor.map
  (unsafeAttribute <<< { key: "bottommargin", value: _ } <<< Deku.Attribute.prop')

_bottommargin_ :: forall r. String -> Event (Attribute (Indexed (bottommargin :: String | r)))
_bottommargin_ = _bottommargin <<< Applicative.pure

_bgcolor :: forall r. Event String -> Event (Attribute (Indexed (bgcolor :: String | r)))
_bgcolor = Functor.map (unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop')

_bgcolor_ :: forall r. String -> Event (Attribute (Indexed (bgcolor :: String | r)))
_bgcolor_ = _bgcolor <<< Applicative.pure

_alink :: forall r. Event String -> Event (Attribute (Indexed (alink :: String | r)))
_alink = Functor.map (unsafeAttribute <<< { key: "alink", value: _ } <<< Deku.Attribute.prop')

_alink_ :: forall r. String -> Event (Attribute (Indexed (alink :: String | r)))
_alink_ = _alink <<< Applicative.pure

_align :: forall r. Event String -> Event (Attribute (Indexed (align :: String | r)))
_align = Functor.map (unsafeAttribute <<< { key: "align", value: _ } <<< Deku.Attribute.prop')

_align_ :: forall r. String -> Event (Attribute (Indexed (align :: String | r)))
_align_ = _align <<< Applicative.pure

_width :: forall r. Event String -> Event (Attribute (Indexed (width :: String | r)))
_width = Functor.map (unsafeAttribute <<< { key: "width", value: _ } <<< Deku.Attribute.prop')

_width_ :: forall r. String -> Event (Attribute (Indexed (width :: String | r)))
_width_ = _width <<< Applicative.pure

_size :: forall r. Event String -> Event (Attribute (Indexed (size :: String | r)))
_size = Functor.map (unsafeAttribute <<< { key: "size", value: _ } <<< Deku.Attribute.prop')

_size_ :: forall r. String -> Event (Attribute (Indexed (size :: String | r)))
_size_ = _size <<< Applicative.pure

_noshade :: forall r. Event String -> Event (Attribute (Indexed (noshade :: String | r)))
_noshade = Functor.map (unsafeAttribute <<< { key: "noshade", value: _ } <<< Deku.Attribute.prop')

_noshade_ :: forall r. String -> Event (Attribute (Indexed (noshade :: String | r)))
_noshade_ = _noshade <<< Applicative.pure

_cite :: forall r. Event String -> Event (Attribute (Indexed (cite :: String | r)))
_cite = Functor.map (unsafeAttribute <<< { key: "cite", value: _ } <<< Deku.Attribute.prop')

_cite_ :: forall r. String -> Event (Attribute (Indexed (cite :: String | r)))
_cite_ = _cite <<< Applicative.pure

_compact :: forall r. Event String -> Event (Attribute (Indexed (compact :: String | r)))
_compact = Functor.map (unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop')

_compact_ :: forall r. String -> Event (Attribute (Indexed (compact :: String | r)))
_compact_ = _compact <<< Applicative.pure

_start :: forall r. Event String -> Event (Attribute (Indexed (start :: String | r)))
_start = Functor.map (unsafeAttribute <<< { key: "start", value: _ } <<< Deku.Attribute.prop')

_start_ :: forall r. String -> Event (Attribute (Indexed (start :: String | r)))
_start_ = _start <<< Applicative.pure

_reversed :: forall r. Event String -> Event (Attribute (Indexed (reversed :: String | r)))
_reversed = Functor.map
  (unsafeAttribute <<< { key: "reversed", value: _ } <<< Deku.Attribute.prop')

_reversed_ :: forall r. String -> Event (Attribute (Indexed (reversed :: String | r)))
_reversed_ = _reversed <<< Applicative.pure

_label :: forall r. Event String -> Event (Attribute (Indexed (label :: String | r)))
_label = Functor.map (unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop')

_label_ :: forall r. String -> Event (Attribute (Indexed (label :: String | r)))
_label_ = _label <<< Applicative.pure

_value :: forall r. Event String -> Event (Attribute (Indexed (value :: String | r)))
_value = Functor.map (unsafeAttribute <<< { key: "value", value: _ } <<< Deku.Attribute.prop')

_value_ :: forall r. String -> Event (Attribute (Indexed (value :: String | r)))
_value_ = _value <<< Applicative.pure

_coords :: forall r. Event String -> Event (Attribute (Indexed (coords :: String | r)))
_coords = Functor.map (unsafeAttribute <<< { key: "coords", value: _ } <<< Deku.Attribute.prop')

_coords_ :: forall r. String -> Event (Attribute (Indexed (coords :: String | r)))
_coords_ = _coords <<< Applicative.pure

_ping :: forall r. Event String -> Event (Attribute (Indexed (ping :: String | r)))
_ping = Functor.map (unsafeAttribute <<< { key: "ping", value: _ } <<< Deku.Attribute.prop')

_ping_ :: forall r. String -> Event (Attribute (Indexed (ping :: String | r)))
_ping_ = _ping <<< Applicative.pure

_download :: forall r. Event String -> Event (Attribute (Indexed (download :: String | r)))
_download = Functor.map
  (unsafeAttribute <<< { key: "download", value: _ } <<< Deku.Attribute.prop')

_download_ :: forall r. String -> Event (Attribute (Indexed (download :: String | r)))
_download_ = _download <<< Applicative.pure

_datetime :: forall r. Event String -> Event (Attribute (Indexed (datetime :: String | r)))
_datetime = Functor.map
  (unsafeAttribute <<< { key: "datetime", value: _ } <<< Deku.Attribute.prop')

_datetime_ :: forall r. String -> Event (Attribute (Indexed (datetime :: String | r)))
_datetime_ = _datetime <<< Applicative.pure

_clear :: forall r. Event String -> Event (Attribute (Indexed (clear :: String | r)))
_clear = Functor.map (unsafeAttribute <<< { key: "clear", value: _ } <<< Deku.Attribute.prop')

_clear_ :: forall r. String -> Event (Attribute (Indexed (clear :: String | r)))
_clear_ = _clear <<< Applicative.pure

_height :: forall r. Event String -> Event (Attribute (Indexed (height :: String | r)))
_height = Functor.map (unsafeAttribute <<< { key: "height", value: _ } <<< Deku.Attribute.prop')

_height_ :: forall r. String -> Event (Attribute (Indexed (height :: String | r)))
_height_ = _height <<< Applicative.pure

_src :: forall r. Event String -> Event (Attribute (Indexed (src :: String | r)))
_src = Functor.map (unsafeAttribute <<< { key: "src", value: _ } <<< Deku.Attribute.prop')

_src_ :: forall r. String -> Event (Attribute (Indexed (src :: String | r)))
_src_ = _src <<< Applicative.pure

_srcset :: forall r. Event String -> Event (Attribute (Indexed (srcset :: String | r)))
_srcset = Functor.map (unsafeAttribute <<< { key: "srcset", value: _ } <<< Deku.Attribute.prop')

_srcset_ :: forall r. String -> Event (Attribute (Indexed (srcset :: String | r)))
_srcset_ = _srcset <<< Applicative.pure

_vspace :: forall r. Event String -> Event (Attribute (Indexed (vspace :: String | r)))
_vspace = Functor.map (unsafeAttribute <<< { key: "vspace", value: _ } <<< Deku.Attribute.prop')

_vspace_ :: forall r. String -> Event (Attribute (Indexed (vspace :: String | r)))
_vspace_ = _vspace <<< Applicative.pure

_hspace :: forall r. Event String -> Event (Attribute (Indexed (hspace :: String | r)))
_hspace = Functor.map (unsafeAttribute <<< { key: "hspace", value: _ } <<< Deku.Attribute.prop')

_hspace_ :: forall r. String -> Event (Attribute (Indexed (hspace :: String | r)))
_hspace_ = _hspace <<< Applicative.pure

_border :: forall r. Event String -> Event (Attribute (Indexed (border :: String | r)))
_border = Functor.map (unsafeAttribute <<< { key: "border", value: _ } <<< Deku.Attribute.prop')

_border_ :: forall r. String -> Event (Attribute (Indexed (border :: String | r)))
_border_ = _border <<< Applicative.pure

_lowsrc :: forall r. Event String -> Event (Attribute (Indexed (lowsrc :: String | r)))
_lowsrc = Functor.map (unsafeAttribute <<< { key: "lowsrc", value: _ } <<< Deku.Attribute.prop')

_lowsrc_ :: forall r. String -> Event (Attribute (Indexed (lowsrc :: String | r)))
_lowsrc_ = _lowsrc <<< Applicative.pure

_longdesc :: forall r. Event String -> Event (Attribute (Indexed (longdesc :: String | r)))
_longdesc = Functor.map
  (unsafeAttribute <<< { key: "longdesc", value: _ } <<< Deku.Attribute.prop')

_longdesc_ :: forall r. String -> Event (Attribute (Indexed (longdesc :: String | r)))
_longdesc_ = _longdesc <<< Applicative.pure

_usemap :: forall r. Event String -> Event (Attribute (Indexed (usemap :: String | r)))
_usemap = Functor.map (unsafeAttribute <<< { key: "usemap", value: _ } <<< Deku.Attribute.prop')

_usemap_ :: forall r. String -> Event (Attribute (Indexed (usemap :: String | r)))
_usemap_ = _usemap <<< Applicative.pure

_ismap :: forall r. Event String -> Event (Attribute (Indexed (ismap :: String | r)))
_ismap = Functor.map (unsafeAttribute <<< { key: "ismap", value: _ } <<< Deku.Attribute.prop')

_ismap_ :: forall r. String -> Event (Attribute (Indexed (ismap :: String | r)))
_ismap_ = _ismap <<< Applicative.pure

_alt :: forall r. Event String -> Event (Attribute (Indexed (alt :: String | r)))
_alt = Functor.map (unsafeAttribute <<< { key: "alt", value: _ } <<< Deku.Attribute.prop')

_alt_ :: forall r. String -> Event (Attribute (Indexed (alt :: String | r)))
_alt_ = _alt <<< Applicative.pure

_scrolling :: forall r. Event String -> Event (Attribute (Indexed (scrolling :: String | r)))
_scrolling = Functor.map
  (unsafeAttribute <<< { key: "scrolling", value: _ } <<< Deku.Attribute.prop')

_scrolling_ :: forall r. String -> Event (Attribute (Indexed (scrolling :: String | r)))
_scrolling_ = _scrolling <<< Applicative.pure

_framespacing :: forall r. Event String -> Event (Attribute (Indexed (framespacing :: String | r)))
_framespacing = Functor.map
  (unsafeAttribute <<< { key: "framespacing", value: _ } <<< Deku.Attribute.prop')

_framespacing_ :: forall r. String -> Event (Attribute (Indexed (framespacing :: String | r)))
_framespacing_ = _framespacing <<< Applicative.pure

_frameborder :: forall r. Event String -> Event (Attribute (Indexed (frameborder :: String | r)))
_frameborder = Functor.map
  (unsafeAttribute <<< { key: "frameborder", value: _ } <<< Deku.Attribute.prop')

_frameborder_ :: forall r. String -> Event (Attribute (Indexed (frameborder :: String | r)))
_frameborder_ = _frameborder <<< Applicative.pure

_allowtransparency
  :: forall r. Event String -> Event (Attribute (Indexed (allowtransparency :: String | r)))
_allowtransparency = Functor.map
  (unsafeAttribute <<< { key: "allowtransparency", value: _ } <<< Deku.Attribute.prop')

_allowtransparency_
  :: forall r. String -> Event (Attribute (Indexed (allowtransparency :: String | r)))
_allowtransparency_ = _allowtransparency <<< Applicative.pure

_allowfullscreen
  :: forall r. Event String -> Event (Attribute (Indexed (allowfullscreen :: String | r)))
_allowfullscreen = Functor.map
  (unsafeAttribute <<< { key: "allowfullscreen", value: _ } <<< Deku.Attribute.prop')

_allowfullscreen_
  :: forall r. String -> Event (Attribute (Indexed (allowfullscreen :: String | r)))
_allowfullscreen_ = _allowfullscreen <<< Applicative.pure

_allow :: forall r. Event String -> Event (Attribute (Indexed (allow :: String | r)))
_allow = Functor.map (unsafeAttribute <<< { key: "allow", value: _ } <<< Deku.Attribute.prop')

_allow_ :: forall r. String -> Event (Attribute (Indexed (allow :: String | r)))
_allow_ = _allow <<< Applicative.pure

_srcdoc :: forall r. Event String -> Event (Attribute (Indexed (srcdoc :: String | r)))
_srcdoc = Functor.map (unsafeAttribute <<< { key: "srcdoc", value: _ } <<< Deku.Attribute.prop')

_srcdoc_ :: forall r. String -> Event (Attribute (Indexed (srcdoc :: String | r)))
_srcdoc_ = _srcdoc <<< Applicative.pure

_typemustmatch
  :: forall r. Event String -> Event (Attribute (Indexed (typemustmatch :: String | r)))
_typemustmatch = Functor.map
  (unsafeAttribute <<< { key: "typemustmatch", value: _ } <<< Deku.Attribute.prop')

_typemustmatch_ :: forall r. String -> Event (Attribute (Indexed (typemustmatch :: String | r)))
_typemustmatch_ = _typemustmatch <<< Applicative.pure

_standby :: forall r. Event String -> Event (Attribute (Indexed (standby :: String | r)))
_standby = Functor.map (unsafeAttribute <<< { key: "standby", value: _ } <<< Deku.Attribute.prop')

_standby_ :: forall r. String -> Event (Attribute (Indexed (standby :: String | r)))
_standby_ = _standby <<< Applicative.pure

_declare :: forall r. Event String -> Event (Attribute (Indexed (declare :: String | r)))
_declare = Functor.map (unsafeAttribute <<< { key: "declare", value: _ } <<< Deku.Attribute.prop')

_declare_ :: forall r. String -> Event (Attribute (Indexed (declare :: String | r)))
_declare_ = _declare <<< Applicative.pure

_codetype :: forall r. Event String -> Event (Attribute (Indexed (codetype :: String | r)))
_codetype = Functor.map
  (unsafeAttribute <<< { key: "codetype", value: _ } <<< Deku.Attribute.prop')

_codetype_ :: forall r. String -> Event (Attribute (Indexed (codetype :: String | r)))
_codetype_ = _codetype <<< Applicative.pure

_codebase :: forall r. Event String -> Event (Attribute (Indexed (codebase :: String | r)))
_codebase = Functor.map
  (unsafeAttribute <<< { key: "codebase", value: _ } <<< Deku.Attribute.prop')

_codebase_ :: forall r. String -> Event (Attribute (Indexed (codebase :: String | r)))
_codebase_ = _codebase <<< Applicative.pure

_code :: forall r. Event String -> Event (Attribute (Indexed (code :: String | r)))
_code = Functor.map (unsafeAttribute <<< { key: "code", value: _ } <<< Deku.Attribute.prop')

_code_ :: forall r. String -> Event (Attribute (Indexed (code :: String | r)))
_code_ = _code <<< Applicative.pure

_classid :: forall r. Event String -> Event (Attribute (Indexed (classid :: String | r)))
_classid = Functor.map (unsafeAttribute <<< { key: "classid", value: _ } <<< Deku.Attribute.prop')

_classid_ :: forall r. String -> Event (Attribute (Indexed (classid :: String | r)))
_classid_ = _classid <<< Applicative.pure

_archive :: forall r. Event String -> Event (Attribute (Indexed (archive :: String | r)))
_archive = Functor.map (unsafeAttribute <<< { key: "archive", value: _ } <<< Deku.Attribute.prop')

_archive_ :: forall r. String -> Event (Attribute (Indexed (archive :: String | r)))
_archive_ = _archive <<< Applicative.pure

_dirname :: forall r. Event String -> Event (Attribute (Indexed (dirname :: String | r)))
_dirname = Functor.map (unsafeAttribute <<< { key: "dirname", value: _ } <<< Deku.Attribute.prop')

_dirname_ :: forall r. String -> Event (Attribute (Indexed (dirname :: String | r)))
_dirname_ = _dirname <<< Applicative.pure

_form :: forall r. Event String -> Event (Attribute (Indexed (form :: String | r)))
_form = Functor.map (unsafeAttribute <<< { key: "form", value: _ } <<< Deku.Attribute.prop')

_form_ :: forall r. String -> Event (Attribute (Indexed (form :: String | r)))
_form_ = _form <<< Applicative.pure

_data :: forall r. Event String -> Event (Attribute (Indexed (data :: String | r)))
_data = Functor.map (unsafeAttribute <<< { key: "data", value: _ } <<< Deku.Attribute.prop')

_data_ :: forall r. String -> Event (Attribute (Indexed (data :: String | r)))
_data_ = _data <<< Applicative.pure

_muted :: forall r. Event String -> Event (Attribute (Indexed (muted :: String | r)))
_muted = Functor.map (unsafeAttribute <<< { key: "muted", value: _ } <<< Deku.Attribute.prop')

_muted_ :: forall r. String -> Event (Attribute (Indexed (muted :: String | r)))
_muted_ = _muted <<< Applicative.pure

_controls :: forall r. Event String -> Event (Attribute (Indexed (controls :: String | r)))
_controls = Functor.map
  (unsafeAttribute <<< { key: "controls", value: _ } <<< Deku.Attribute.prop')

_controls_ :: forall r. String -> Event (Attribute (Indexed (controls :: String | r)))
_controls_ = _controls <<< Applicative.pure

_autoplay :: forall r. Event String -> Event (Attribute (Indexed (autoplay :: String | r)))
_autoplay = Functor.map
  (unsafeAttribute <<< { key: "autoplay", value: _ } <<< Deku.Attribute.prop')

_autoplay_ :: forall r. String -> Event (Attribute (Indexed (autoplay :: String | r)))
_autoplay_ = _autoplay <<< Applicative.pure

_loop :: forall r. Event String -> Event (Attribute (Indexed (loop :: String | r)))
_loop = Functor.map (unsafeAttribute <<< { key: "loop", value: _ } <<< Deku.Attribute.prop')

_loop_ :: forall r. String -> Event (Attribute (Indexed (loop :: String | r)))
_loop_ = _loop <<< Applicative.pure

_playsinline :: forall r. Event String -> Event (Attribute (Indexed (playsinline :: String | r)))
_playsinline = Functor.map
  (unsafeAttribute <<< { key: "playsinline", value: _ } <<< Deku.Attribute.prop')

_playsinline_ :: forall r. String -> Event (Attribute (Indexed (playsinline :: String | r)))
_playsinline_ = _playsinline <<< Applicative.pure

_poster :: forall r. Event String -> Event (Attribute (Indexed (poster :: String | r)))
_poster = Functor.map (unsafeAttribute <<< { key: "poster", value: _ } <<< Deku.Attribute.prop')

_poster_ :: forall r. String -> Event (Attribute (Indexed (poster :: String | r)))
_poster_ = _poster <<< Applicative.pure

_default :: forall r. Event String -> Event (Attribute (Indexed (default :: String | r)))
_default = Functor.map (unsafeAttribute <<< { key: "default", value: _ } <<< Deku.Attribute.prop')

_default_ :: forall r. String -> Event (Attribute (Indexed (default :: String | r)))
_default_ = _default <<< Applicative.pure

_srclang :: forall r. Event String -> Event (Attribute (Indexed (srclang :: String | r)))
_srclang = Functor.map (unsafeAttribute <<< { key: "srclang", value: _ } <<< Deku.Attribute.prop')

_srclang_ :: forall r. String -> Event (Attribute (Indexed (srclang :: String | r)))
_srclang_ = _srclang <<< Applicative.pure

_nohref :: forall r. Event String -> Event (Attribute (Indexed (nohref :: String | r)))
_nohref = Functor.map (unsafeAttribute <<< { key: "nohref", value: _ } <<< Deku.Attribute.prop')

_nohref_ :: forall r. String -> Event (Attribute (Indexed (nohref :: String | r)))
_nohref_ = _nohref <<< Applicative.pure

_rules :: forall r. Event String -> Event (Attribute (Indexed (rules :: String | r)))
_rules = Functor.map (unsafeAttribute <<< { key: "rules", value: _ } <<< Deku.Attribute.prop')

_rules_ :: forall r. String -> Event (Attribute (Indexed (rules :: String | r)))
_rules_ = _rules <<< Applicative.pure

_frame :: forall r. Event String -> Event (Attribute (Indexed (frame :: String | r)))
_frame = Functor.map (unsafeAttribute <<< { key: "frame", value: _ } <<< Deku.Attribute.prop')

_frame_ :: forall r. String -> Event (Attribute (Indexed (frame :: String | r)))
_frame_ = _frame <<< Applicative.pure

_cellspacing :: forall r. Event String -> Event (Attribute (Indexed (cellspacing :: String | r)))
_cellspacing = Functor.map
  (unsafeAttribute <<< { key: "cellspacing", value: _ } <<< Deku.Attribute.prop')

_cellspacing_ :: forall r. String -> Event (Attribute (Indexed (cellspacing :: String | r)))
_cellspacing_ = _cellspacing <<< Applicative.pure

_cellpadding :: forall r. Event String -> Event (Attribute (Indexed (cellpadding :: String | r)))
_cellpadding = Functor.map
  (unsafeAttribute <<< { key: "cellpadding", value: _ } <<< Deku.Attribute.prop')

_cellpadding_ :: forall r. String -> Event (Attribute (Indexed (cellpadding :: String | r)))
_cellpadding_ = _cellpadding <<< Applicative.pure

_bordercolor :: forall r. Event String -> Event (Attribute (Indexed (bordercolor :: String | r)))
_bordercolor = Functor.map
  (unsafeAttribute <<< { key: "bordercolor", value: _ } <<< Deku.Attribute.prop')

_bordercolor_ :: forall r. String -> Event (Attribute (Indexed (bordercolor :: String | r)))
_bordercolor_ = _bordercolor <<< Applicative.pure

_summary :: forall r. Event String -> Event (Attribute (Indexed (summary :: String | r)))
_summary = Functor.map (unsafeAttribute <<< { key: "summary", value: _ } <<< Deku.Attribute.prop')

_summary_ :: forall r. String -> Event (Attribute (Indexed (summary :: String | r)))
_summary_ = _summary <<< Applicative.pure

_datapagesize :: forall r. Event String -> Event (Attribute (Indexed (datapagesize :: String | r)))
_datapagesize = Functor.map
  (unsafeAttribute <<< { key: "datapagesize", value: _ } <<< Deku.Attribute.prop')

_datapagesize_ :: forall r. String -> Event (Attribute (Indexed (datapagesize :: String | r)))
_datapagesize_ = _datapagesize <<< Applicative.pure

_span :: forall r. Event String -> Event (Attribute (Indexed (span :: String | r)))
_span = Functor.map (unsafeAttribute <<< { key: "span", value: _ } <<< Deku.Attribute.prop')

_span_ :: forall r. String -> Event (Attribute (Indexed (span :: String | r)))
_span_ = _span <<< Applicative.pure

_valign :: forall r. Event String -> Event (Attribute (Indexed (valign :: String | r)))
_valign = Functor.map (unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop')

_valign_ :: forall r. String -> Event (Attribute (Indexed (valign :: String | r)))
_valign_ = _valign <<< Applicative.pure

_charoff :: forall r. Event String -> Event (Attribute (Indexed (charoff :: String | r)))
_charoff = Functor.map (unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop')

_charoff_ :: forall r. String -> Event (Attribute (Indexed (charoff :: String | r)))
_charoff_ = _charoff <<< Applicative.pure

_char :: forall r. Event String -> Event (Attribute (Indexed (char :: String | r)))
_char = Functor.map (unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop')

_char_ :: forall r. String -> Event (Attribute (Indexed (char :: String | r)))
_char_ = _char <<< Applicative.pure

_nowrap :: forall r. Event String -> Event (Attribute (Indexed (nowrap :: String | r)))
_nowrap = Functor.map (unsafeAttribute <<< { key: "nowrap", value: _ } <<< Deku.Attribute.prop')

_nowrap_ :: forall r. String -> Event (Attribute (Indexed (nowrap :: String | r)))
_nowrap_ = _nowrap <<< Applicative.pure

_axis :: forall r. Event String -> Event (Attribute (Indexed (axis :: String | r)))
_axis = Functor.map (unsafeAttribute <<< { key: "axis", value: _ } <<< Deku.Attribute.prop')

_axis_ :: forall r. String -> Event (Attribute (Indexed (axis :: String | r)))
_axis_ = _axis <<< Applicative.pure

_abbr :: forall r. Event String -> Event (Attribute (Indexed (abbr :: String | r)))
_abbr = Functor.map (unsafeAttribute <<< { key: "abbr", value: _ } <<< Deku.Attribute.prop')

_abbr_ :: forall r. String -> Event (Attribute (Indexed (abbr :: String | r)))
_abbr_ = _abbr <<< Applicative.pure

_headers :: forall r. Event String -> Event (Attribute (Indexed (headers :: String | r)))
_headers = Functor.map (unsafeAttribute <<< { key: "headers", value: _ } <<< Deku.Attribute.prop')

_headers_ :: forall r. String -> Event (Attribute (Indexed (headers :: String | r)))
_headers_ = _headers <<< Applicative.pure

_rowspan :: forall r. Event String -> Event (Attribute (Indexed (rowspan :: String | r)))
_rowspan = Functor.map (unsafeAttribute <<< { key: "rowspan", value: _ } <<< Deku.Attribute.prop')

_rowspan_ :: forall r. String -> Event (Attribute (Indexed (rowspan :: String | r)))
_rowspan_ = _rowspan <<< Applicative.pure

_colspan :: forall r. Event String -> Event (Attribute (Indexed (colspan :: String | r)))
_colspan = Functor.map (unsafeAttribute <<< { key: "colspan", value: _ } <<< Deku.Attribute.prop')

_colspan_ :: forall r. String -> Event (Attribute (Indexed (colspan :: String | r)))
_colspan_ = _colspan <<< Applicative.pure

_accept :: forall r. Event String -> Event (Attribute (Indexed (accept :: String | r)))
_accept = Functor.map (unsafeAttribute <<< { key: "accept", value: _ } <<< Deku.Attribute.prop')

_accept_ :: forall r. String -> Event (Attribute (Indexed (accept :: String | r)))
_accept_ = _accept <<< Applicative.pure

_formnovalidate
  :: forall r. Event String -> Event (Attribute (Indexed (formnovalidate :: String | r)))
_formnovalidate = Functor.map
  (unsafeAttribute <<< { key: "formnovalidate", value: _ } <<< Deku.Attribute.prop')

_formnovalidate_ :: forall r. String -> Event (Attribute (Indexed (formnovalidate :: String | r)))
_formnovalidate_ = _formnovalidate <<< Applicative.pure

_novalidate :: forall r. Event String -> Event (Attribute (Indexed (novalidate :: String | r)))
_novalidate = Functor.map
  (unsafeAttribute <<< { key: "novalidate", value: _ } <<< Deku.Attribute.prop')

_novalidate_ :: forall r. String -> Event (Attribute (Indexed (novalidate :: String | r)))
_novalidate_ = _novalidate <<< Applicative.pure

_formtarget :: forall r. Event String -> Event (Attribute (Indexed (formtarget :: String | r)))
_formtarget = Functor.map
  (unsafeAttribute <<< { key: "formtarget", value: _ } <<< Deku.Attribute.prop')

_formtarget_ :: forall r. String -> Event (Attribute (Indexed (formtarget :: String | r)))
_formtarget_ = _formtarget <<< Applicative.pure

_formenctype :: forall r. Event String -> Event (Attribute (Indexed (formenctype :: String | r)))
_formenctype = Functor.map
  (unsafeAttribute <<< { key: "formenctype", value: _ } <<< Deku.Attribute.prop')

_formenctype_ :: forall r. String -> Event (Attribute (Indexed (formenctype :: String | r)))
_formenctype_ = _formenctype <<< Applicative.pure

_formmethod :: forall r. Event String -> Event (Attribute (Indexed (formmethod :: String | r)))
_formmethod = Functor.map
  (unsafeAttribute <<< { key: "formmethod", value: _ } <<< Deku.Attribute.prop')

_formmethod_ :: forall r. String -> Event (Attribute (Indexed (formmethod :: String | r)))
_formmethod_ = _formmethod <<< Applicative.pure

_formaction :: forall r. Event String -> Event (Attribute (Indexed (formaction :: String | r)))
_formaction = Functor.map
  (unsafeAttribute <<< { key: "formaction", value: _ } <<< Deku.Attribute.prop')

_formaction_ :: forall r. String -> Event (Attribute (Indexed (formaction :: String | r)))
_formaction_ = _formaction <<< Applicative.pure

_action :: forall r. Event String -> Event (Attribute (Indexed (action :: String | r)))
_action = Functor.map (unsafeAttribute <<< { key: "action", value: _ } <<< Deku.Attribute.prop')

_action_ :: forall r. String -> Event (Attribute (Indexed (action :: String | r)))
_action_ = _action <<< Applicative.pure

_acceptCharset
  :: forall r. Event String -> Event (Attribute (Indexed (acceptCharset :: String | r)))
_acceptCharset = Functor.map
  (unsafeAttribute <<< { key: "accept-charset", value: _ } <<< Deku.Attribute.prop')

_acceptCharset_ :: forall r. String -> Event (Attribute (Indexed (acceptCharset :: String | r)))
_acceptCharset_ = _acceptCharset <<< Applicative.pure

_for :: forall r. Event String -> Event (Attribute (Indexed (for :: String | r)))
_for = Functor.map (unsafeAttribute <<< { key: "for", value: _ } <<< Deku.Attribute.prop')

_for_ :: forall r. String -> Event (Attribute (Indexed (for :: String | r)))
_for_ = _for <<< Applicative.pure

_capture :: forall r. Event String -> Event (Attribute (Indexed (capture :: String | r)))
_capture = Functor.map (unsafeAttribute <<< { key: "capture", value: _ } <<< Deku.Attribute.prop')

_capture_ :: forall r. String -> Event (Attribute (Indexed (capture :: String | r)))
_capture_ = _capture <<< Applicative.pure

_minlength :: forall r. Event String -> Event (Attribute (Indexed (minlength :: String | r)))
_minlength = Functor.map
  (unsafeAttribute <<< { key: "minlength", value: _ } <<< Deku.Attribute.prop')

_minlength_ :: forall r. String -> Event (Attribute (Indexed (minlength :: String | r)))
_minlength_ = _minlength <<< Applicative.pure

_maxlength :: forall r. Event String -> Event (Attribute (Indexed (maxlength :: String | r)))
_maxlength = Functor.map
  (unsafeAttribute <<< { key: "maxlength", value: _ } <<< Deku.Attribute.prop')

_maxlength_ :: forall r. String -> Event (Attribute (Indexed (maxlength :: String | r)))
_maxlength_ = _maxlength <<< Applicative.pure

_placeholder :: forall r. Event String -> Event (Attribute (Indexed (placeholder :: String | r)))
_placeholder = Functor.map
  (unsafeAttribute <<< { key: "placeholder", value: _ } <<< Deku.Attribute.prop')

_placeholder_ :: forall r. String -> Event (Attribute (Indexed (placeholder :: String | r)))
_placeholder_ = _placeholder <<< Applicative.pure

_list :: forall r. Event String -> Event (Attribute (Indexed (list :: String | r)))
_list = Functor.map (unsafeAttribute <<< { key: "list", value: _ } <<< Deku.Attribute.prop')

_list_ :: forall r. String -> Event (Attribute (Indexed (list :: String | r)))
_list_ = _list <<< Applicative.pure

_step :: forall r. Event String -> Event (Attribute (Indexed (step :: String | r)))
_step = Functor.map (unsafeAttribute <<< { key: "step", value: _ } <<< Deku.Attribute.prop')

_step_ :: forall r. String -> Event (Attribute (Indexed (step :: String | r)))
_step_ = _step <<< Applicative.pure

_max :: forall r. Event String -> Event (Attribute (Indexed (max :: String | r)))
_max = Functor.map (unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop')

_max_ :: forall r. String -> Event (Attribute (Indexed (max :: String | r)))
_max_ = _max <<< Applicative.pure

_min :: forall r. Event String -> Event (Attribute (Indexed (min :: String | r)))
_min = Functor.map (unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop')

_min_ :: forall r. String -> Event (Attribute (Indexed (min :: String | r)))
_min_ = _min <<< Applicative.pure

_pattern :: forall r. Event String -> Event (Attribute (Indexed (pattern :: String | r)))
_pattern = Functor.map (unsafeAttribute <<< { key: "pattern", value: _ } <<< Deku.Attribute.prop')

_pattern_ :: forall r. String -> Event (Attribute (Indexed (pattern :: String | r)))
_pattern_ = _pattern <<< Applicative.pure

_multiple :: forall r. Event String -> Event (Attribute (Indexed (multiple :: String | r)))
_multiple = Functor.map
  (unsafeAttribute <<< { key: "multiple", value: _ } <<< Deku.Attribute.prop')

_multiple_ :: forall r. String -> Event (Attribute (Indexed (multiple :: String | r)))
_multiple_ = _multiple <<< Applicative.pure

_required :: forall r. Event String -> Event (Attribute (Indexed (required :: String | r)))
_required = Functor.map
  (unsafeAttribute <<< { key: "required", value: _ } <<< Deku.Attribute.prop')

_required_ :: forall r. String -> Event (Attribute (Indexed (required :: String | r)))
_required_ = _required <<< Applicative.pure

_readonly :: forall r. Event String -> Event (Attribute (Indexed (readonly :: String | r)))
_readonly = Functor.map
  (unsafeAttribute <<< { key: "readonly", value: _ } <<< Deku.Attribute.prop')

_readonly_ :: forall r. String -> Event (Attribute (Indexed (readonly :: String | r)))
_readonly_ = _readonly <<< Applicative.pure

_checked :: forall r. Event String -> Event (Attribute (Indexed (checked :: String | r)))
_checked = Functor.map (unsafeAttribute <<< { key: "checked", value: _ } <<< Deku.Attribute.prop')

_checked_ :: forall r. String -> Event (Attribute (Indexed (checked :: String | r)))
_checked_ = _checked <<< Applicative.pure

_selected :: forall r. Event String -> Event (Attribute (Indexed (selected :: String | r)))
_selected = Functor.map
  (unsafeAttribute <<< { key: "selected", value: _ } <<< Deku.Attribute.prop')

_selected_ :: forall r. String -> Event (Attribute (Indexed (selected :: String | r)))
_selected_ = _selected <<< Applicative.pure

_rows :: forall r. Event String -> Event (Attribute (Indexed (rows :: String | r)))
_rows = Functor.map (unsafeAttribute <<< { key: "rows", value: _ } <<< Deku.Attribute.prop')

_rows_ :: forall r. String -> Event (Attribute (Indexed (rows :: String | r)))
_rows_ = _rows <<< Applicative.pure

_cols :: forall r. Event String -> Event (Attribute (Indexed (cols :: String | r)))
_cols = Functor.map (unsafeAttribute <<< { key: "cols", value: _ } <<< Deku.Attribute.prop')

_cols_ :: forall r. String -> Event (Attribute (Indexed (cols :: String | r)))
_cols_ = _cols <<< Applicative.pure

_optimum :: forall r. Event String -> Event (Attribute (Indexed (optimum :: String | r)))
_optimum = Functor.map (unsafeAttribute <<< { key: "optimum", value: _ } <<< Deku.Attribute.prop')

_optimum_ :: forall r. String -> Event (Attribute (Indexed (optimum :: String | r)))
_optimum_ = _optimum <<< Applicative.pure

_high :: forall r. Event String -> Event (Attribute (Indexed (high :: String | r)))
_high = Functor.map (unsafeAttribute <<< { key: "high", value: _ } <<< Deku.Attribute.prop')

_high_ :: forall r. String -> Event (Attribute (Indexed (high :: String | r)))
_high_ = _high <<< Applicative.pure

_low :: forall r. Event String -> Event (Attribute (Indexed (low :: String | r)))
_low = Functor.map (unsafeAttribute <<< { key: "low", value: _ } <<< Deku.Attribute.prop')

_low_ :: forall r. String -> Event (Attribute (Indexed (low :: String | r)))
_low_ = _low <<< Applicative.pure

_open :: forall r. Event String -> Event (Attribute (Indexed (open :: String | r)))
_open = Functor.map (unsafeAttribute <<< { key: "open", value: _ } <<< Deku.Attribute.prop')

_open_ :: forall r. String -> Event (Attribute (Indexed (open :: String | r)))
_open_ = _open <<< Applicative.pure

_event :: forall r. Event String -> Event (Attribute (Indexed (event :: String | r)))
_event = Functor.map (unsafeAttribute <<< { key: "event", value: _ } <<< Deku.Attribute.prop')

_event_ :: forall r. String -> Event (Attribute (Indexed (event :: String | r)))
_event_ = _event <<< Applicative.pure

_language :: forall r. Event String -> Event (Attribute (Indexed (language :: String | r)))
_language = Functor.map
  (unsafeAttribute <<< { key: "language", value: _ } <<< Deku.Attribute.prop')

_language_ :: forall r. String -> Event (Attribute (Indexed (language :: String | r)))
_language_ = _language <<< Applicative.pure

_defer :: forall r. Event String -> Event (Attribute (Indexed (defer :: String | r)))
_defer = Functor.map (unsafeAttribute <<< { key: "defer", value: _ } <<< Deku.Attribute.prop')

_defer_ :: forall r. String -> Event (Attribute (Indexed (defer :: String | r)))
_defer_ = _defer <<< Applicative.pure

_async :: forall r. Event String -> Event (Attribute (Indexed (async :: String | r)))
_async = Functor.map (unsafeAttribute <<< { key: "async", value: _ } <<< Deku.Attribute.prop')

_async_ :: forall r. String -> Event (Attribute (Indexed (async :: String | r)))
_async_ = _async <<< Applicative.pure

_nomodule :: forall r. Event String -> Event (Attribute (Indexed (nomodule :: String | r)))
_nomodule = Functor.map
  (unsafeAttribute <<< { key: "nomodule", value: _ } <<< Deku.Attribute.prop')

_nomodule_ :: forall r. String -> Event (Attribute (Indexed (nomodule :: String | r)))
_nomodule_ = _nomodule <<< Applicative.pure

_truespeed :: forall r. Event String -> Event (Attribute (Indexed (truespeed :: String | r)))
_truespeed = Functor.map
  (unsafeAttribute <<< { key: "truespeed", value: _ } <<< Deku.Attribute.prop')

_truespeed_ :: forall r. String -> Event (Attribute (Indexed (truespeed :: String | r)))
_truespeed_ = _truespeed <<< Applicative.pure

_direction :: forall r. Event String -> Event (Attribute (Indexed (direction :: String | r)))
_direction = Functor.map
  (unsafeAttribute <<< { key: "direction", value: _ } <<< Deku.Attribute.prop')

_direction_ :: forall r. String -> Event (Attribute (Indexed (direction :: String | r)))
_direction_ = _direction <<< Applicative.pure

_behavior :: forall r. Event String -> Event (Attribute (Indexed (behavior :: String | r)))
_behavior = Functor.map
  (unsafeAttribute <<< { key: "behavior", value: _ } <<< Deku.Attribute.prop')

_behavior_ :: forall r. String -> Event (Attribute (Indexed (behavior :: String | r)))
_behavior_ = _behavior <<< Applicative.pure

_tabindex :: forall r. Event String -> Event (Attribute (Indexed (tabindex :: String | r)))
_tabindex = Functor.map
  (unsafeAttribute <<< { key: "tabindex", value: _ } <<< Deku.Attribute.prop')

_tabindex_ :: forall r. String -> Event (Attribute (Indexed (tabindex :: String | r)))
_tabindex_ = _tabindex <<< Applicative.pure

_nonce :: forall r. Event String -> Event (Attribute (Indexed (nonce :: String | r)))
_nonce = Functor.map (unsafeAttribute <<< { key: "nonce", value: _ } <<< Deku.Attribute.prop')

_nonce_ :: forall r. String -> Event (Attribute (Indexed (nonce :: String | r)))
_nonce_ = _nonce <<< Applicative.pure

_slot :: forall r. Event String -> Event (Attribute (Indexed (slot :: String | r)))
_slot = Functor.map (unsafeAttribute <<< { key: "slot", value: _ } <<< Deku.Attribute.prop')

_slot_ :: forall r. String -> Event (Attribute (Indexed (slot :: String | r)))
_slot_ = _slot <<< Applicative.pure

_id :: forall r. Event String -> Event (Attribute (Indexed (id :: String | r)))
_id = Functor.map (unsafeAttribute <<< { key: "id", value: _ } <<< Deku.Attribute.prop')

_id_ :: forall r. String -> Event (Attribute (Indexed (id :: String | r)))
_id_ = _id <<< Applicative.pure

_class :: forall r. Event String -> Event (Attribute (Indexed (class :: String | r)))
_class = Functor.map (unsafeAttribute <<< { key: "class", value: _ } <<< Deku.Attribute.prop')

_class_ :: forall r. String -> Event (Attribute (Indexed (class :: String | r)))
_class_ = _class <<< Applicative.pure

_popovertarget
  :: forall r. Event String -> Event (Attribute (Indexed (popovertarget :: String | r)))
_popovertarget = Functor.map
  (unsafeAttribute <<< { key: "popovertarget", value: _ } <<< Deku.Attribute.prop')

_popovertarget_ :: forall r. String -> Event (Attribute (Indexed (popovertarget :: String | r)))
_popovertarget_ = _popovertarget <<< Applicative.pure

_draggable :: forall r. Event String -> Event (Attribute (Indexed (draggable :: String | r)))
_draggable = Functor.map
  (unsafeAttribute <<< { key: "draggable", value: _ } <<< Deku.Attribute.prop')

_draggable_ :: forall r. String -> Event (Attribute (Indexed (draggable :: String | r)))
_draggable_ = _draggable <<< Applicative.pure

_spellcheck :: forall r. Event String -> Event (Attribute (Indexed (spellcheck :: String | r)))
_spellcheck = Functor.map
  (unsafeAttribute <<< { key: "spellcheck", value: _ } <<< Deku.Attribute.prop')

_spellcheck_ :: forall r. String -> Event (Attribute (Indexed (spellcheck :: String | r)))
_spellcheck_ = _spellcheck <<< Applicative.pure

_contenteditable
  :: forall r. Event String -> Event (Attribute (Indexed (contenteditable :: String | r)))
_contenteditable = Functor.map
  (unsafeAttribute <<< { key: "contenteditable", value: _ } <<< Deku.Attribute.prop')

_contenteditable_
  :: forall r. String -> Event (Attribute (Indexed (contenteditable :: String | r)))
_contenteditable_ = _contenteditable <<< Applicative.pure

_accesskey :: forall r. Event String -> Event (Attribute (Indexed (accesskey :: String | r)))
_accesskey = Functor.map
  (unsafeAttribute <<< { key: "accesskey", value: _ } <<< Deku.Attribute.prop')

_accesskey_ :: forall r. String -> Event (Attribute (Indexed (accesskey :: String | r)))
_accesskey_ = _accesskey <<< Applicative.pure

_autofocus :: forall r. Event String -> Event (Attribute (Indexed (autofocus :: String | r)))
_autofocus = Functor.map
  (unsafeAttribute <<< { key: "autofocus", value: _ } <<< Deku.Attribute.prop')

_autofocus_ :: forall r. String -> Event (Attribute (Indexed (autofocus :: String | r)))
_autofocus_ = _autofocus <<< Applicative.pure

_itemprop :: forall r. Event String -> Event (Attribute (Indexed (itemprop :: String | r)))
_itemprop = Functor.map
  (unsafeAttribute <<< { key: "itemprop", value: _ } <<< Deku.Attribute.prop')

_itemprop_ :: forall r. String -> Event (Attribute (Indexed (itemprop :: String | r)))
_itemprop_ = _itemprop <<< Applicative.pure

_itemref :: forall r. Event String -> Event (Attribute (Indexed (itemref :: String | r)))
_itemref = Functor.map (unsafeAttribute <<< { key: "itemref", value: _ } <<< Deku.Attribute.prop')

_itemref_ :: forall r. String -> Event (Attribute (Indexed (itemref :: String | r)))
_itemref_ = _itemref <<< Applicative.pure

_itemid :: forall r. Event String -> Event (Attribute (Indexed (itemid :: String | r)))
_itemid = Functor.map (unsafeAttribute <<< { key: "itemid", value: _ } <<< Deku.Attribute.prop')

_itemid_ :: forall r. String -> Event (Attribute (Indexed (itemid :: String | r)))
_itemid_ = _itemid <<< Applicative.pure

_itemtype :: forall r. Event String -> Event (Attribute (Indexed (itemtype :: String | r)))
_itemtype = Functor.map
  (unsafeAttribute <<< { key: "itemtype", value: _ } <<< Deku.Attribute.prop')

_itemtype_ :: forall r. String -> Event (Attribute (Indexed (itemtype :: String | r)))
_itemtype_ = _itemtype <<< Applicative.pure

_itemscope :: forall r. Event String -> Event (Attribute (Indexed (itemscope :: String | r)))
_itemscope = Functor.map
  (unsafeAttribute <<< { key: "itemscope", value: _ } <<< Deku.Attribute.prop')

_itemscope_ :: forall r. String -> Event (Attribute (Indexed (itemscope :: String | r)))
_itemscope_ = _itemscope <<< Applicative.pure

_is :: forall r. Event String -> Event (Attribute (Indexed (is :: String | r)))
_is = Functor.map (unsafeAttribute <<< { key: "is", value: _ } <<< Deku.Attribute.prop')

_is_ :: forall r. String -> Event (Attribute (Indexed (is :: String | r)))
_is_ = _is <<< Applicative.pure

_style :: forall r. Event String -> Event (Attribute (Indexed (style :: String | r)))
_style = Functor.map (unsafeAttribute <<< { key: "style", value: _ } <<< Deku.Attribute.prop')

_style_ :: forall r. String -> Event (Attribute (Indexed (style :: String | r)))
_style_ = _style <<< Applicative.pure

_translate :: forall r. Event String -> Event (Attribute (Indexed (translate :: String | r)))
_translate = Functor.map
  (unsafeAttribute <<< { key: "translate", value: _ } <<< Deku.Attribute.prop')

_translate_ :: forall r. String -> Event (Attribute (Indexed (translate :: String | r)))
_translate_ = _translate <<< Applicative.pure

_lang :: forall r. Event String -> Event (Attribute (Indexed (lang :: String | r)))
_lang = Functor.map (unsafeAttribute <<< { key: "lang", value: _ } <<< Deku.Attribute.prop')

_lang_ :: forall r. String -> Event (Attribute (Indexed (lang :: String | r)))
_lang_ = _lang <<< Applicative.pure

_onAnimationcancel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationcancel = Functor.map
  ( unsafeAttribute <<< { key: "onAnimationcancel", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onAnimationcancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationcancel_ = _onAnimationcancel <<< Applicative.pure

_onAnimationend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationend = Functor.map
  ( unsafeAttribute <<< { key: "onAnimationend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onAnimationend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationend_ = _onAnimationend <<< Applicative.pure

_onAnimationiteration
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onAnimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onAnimationiteration = Functor.map
  ( unsafeAttribute <<< { key: "onAnimationiteration", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onAnimationiteration_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onAnimationiteration :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onAnimationiteration_ = _onAnimationiteration <<< Applicative.pure

_onAnimationstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationstart = Functor.map
  ( unsafeAttribute <<< { key: "onAnimationstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onAnimationstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onAnimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onAnimationstart_ = _onAnimationstart <<< Applicative.pure

_onTransitioncancel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitioncancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitioncancel = Functor.map
  ( unsafeAttribute <<< { key: "onTransitioncancel", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTransitioncancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitioncancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitioncancel_ = _onTransitioncancel <<< Applicative.pure

_onTransitionend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionend = Functor.map
  ( unsafeAttribute <<< { key: "onTransitionend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTransitionend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionend_ = _onTransitionend <<< Applicative.pure

_onTransitionstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionstart = Functor.map
  ( unsafeAttribute <<< { key: "onTransitionstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTransitionstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionstart_ = _onTransitionstart <<< Applicative.pure

_onTransitionrun
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionrun :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionrun = Functor.map
  ( unsafeAttribute <<< { key: "onTransitionrun", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTransitionrun_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTransitionrun :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTransitionrun_ = _onTransitionrun <<< Applicative.pure

_onSelectionchange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSelectionchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectionchange = Functor.map
  ( unsafeAttribute <<< { key: "onSelectionchange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSelectionchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSelectionchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectionchange_ = _onSelectionchange <<< Applicative.pure

_onSelectstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSelectstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectstart = Functor.map
  ( unsafeAttribute <<< { key: "onSelectstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSelectstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSelectstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSelectstart_ = _onSelectstart <<< Applicative.pure

_onTouchcancel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTouchcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchcancel = Functor.map
  ( unsafeAttribute <<< { key: "onTouchcancel", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTouchcancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTouchcancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchcancel_ = _onTouchcancel <<< Applicative.pure

_onTouchmove
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onTouchmove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onTouchmove = Functor.map
  ( unsafeAttribute <<< { key: "onTouchmove", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTouchmove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onTouchmove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onTouchmove_ = _onTouchmove <<< Applicative.pure

_onTouchend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onTouchend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onTouchend = Functor.map
  ( unsafeAttribute <<< { key: "onTouchend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTouchend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onTouchend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onTouchend_ = _onTouchend <<< Applicative.pure

_onTouchstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTouchstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchstart = Functor.map
  ( unsafeAttribute <<< { key: "onTouchstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTouchstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTouchstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTouchstart_ = _onTouchstart <<< Applicative.pure

_onLostpointercapture
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onLostpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onLostpointercapture = Functor.map
  ( unsafeAttribute <<< { key: "onLostpointercapture", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onLostpointercapture_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onLostpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onLostpointercapture_ = _onLostpointercapture <<< Applicative.pure

_onGotpointercapture
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onGotpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onGotpointercapture = Functor.map
  ( unsafeAttribute <<< { key: "onGotpointercapture", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onGotpointercapture_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onGotpointercapture :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onGotpointercapture_ = _onGotpointercapture <<< Applicative.pure

_onPointerleave
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerleave = Functor.map
  ( unsafeAttribute <<< { key: "onPointerleave", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerleave_ = _onPointerleave <<< Applicative.pure

_onPointerout
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerout = Functor.map
  ( unsafeAttribute <<< { key: "onPointerout", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerout_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerout_ = _onPointerout <<< Applicative.pure

_onPointercancel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointercancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointercancel = Functor.map
  ( unsafeAttribute <<< { key: "onPointercancel", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointercancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointercancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointercancel_ = _onPointercancel <<< Applicative.pure

_onPointerup
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPointerup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPointerup = Functor.map
  ( unsafeAttribute <<< { key: "onPointerup", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPointerup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPointerup_ = _onPointerup <<< Applicative.pure

_onPointerrawupdate
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerrawupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerrawupdate = Functor.map
  ( unsafeAttribute <<< { key: "onPointerrawupdate", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerrawupdate_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerrawupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerrawupdate_ = _onPointerrawupdate <<< Applicative.pure

_onPointermove
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointermove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointermove = Functor.map
  ( unsafeAttribute <<< { key: "onPointermove", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointermove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointermove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointermove_ = _onPointermove <<< Applicative.pure

_onPointerdown
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerdown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerdown = Functor.map
  ( unsafeAttribute <<< { key: "onPointerdown", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerdown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerdown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerdown_ = _onPointerdown <<< Applicative.pure

_onPointerenter
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerenter = Functor.map
  ( unsafeAttribute <<< { key: "onPointerenter", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerenter_ = _onPointerenter <<< Applicative.pure

_onPointerover
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerover = Functor.map
  ( unsafeAttribute <<< { key: "onPointerover", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPointerover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onPointerover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onPointerover_ = _onPointerover <<< Applicative.pure

_onScrollend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onScrollend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onScrollend = Functor.map
  ( unsafeAttribute <<< { key: "onScrollend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onScrollend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onScrollend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onScrollend_ = _onScrollend <<< Applicative.pure

_onScroll
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onScroll :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onScroll = Functor.map
  (unsafeAttribute <<< { key: "onScroll", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onScroll_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onScroll :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onScroll_ = _onScroll <<< Applicative.pure

_onResize
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onResize :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onResize = Functor.map
  (unsafeAttribute <<< { key: "onResize", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onResize_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onResize :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onResize_ = _onResize <<< Applicative.pure

_onLoad
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onLoad :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onLoad = Functor.map
  (unsafeAttribute <<< { key: "onLoad", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onLoad_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onLoad :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onLoad_ = _onLoad <<< Applicative.pure

_onFocus
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onFocus :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onFocus = Functor.map
  (unsafeAttribute <<< { key: "onFocus", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onFocus_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onFocus :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onFocus_ = _onFocus <<< Applicative.pure

_onError
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onError :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onError = Functor.map
  (unsafeAttribute <<< { key: "onError", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onError_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onError :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onError_ = _onError <<< Applicative.pure

_onBlur
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onBlur :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onBlur = Functor.map
  (unsafeAttribute <<< { key: "onBlur", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onBlur_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onBlur :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onBlur_ = _onBlur <<< Applicative.pure

_onWheel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onWheel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onWheel = Functor.map
  (unsafeAttribute <<< { key: "onWheel", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onWheel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onWheel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onWheel_ = _onWheel <<< Applicative.pure

_onWebkittransitionend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkittransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkittransitionend = Functor.map
  ( unsafeAttribute <<< { key: "onWebkittransitionend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onWebkittransitionend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkittransitionend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkittransitionend_ = _onWebkittransitionend <<< Applicative.pure

_onWebkitanimationstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationstart = Functor.map
  ( unsafeAttribute <<< { key: "onWebkitanimationstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onWebkitanimationstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationstart_ = _onWebkitanimationstart <<< Applicative.pure

_onWebkitanimationiteration
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationiteration ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationiteration = Functor.map
  ( unsafeAttribute <<< { key: "onWebkitanimationiteration", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onWebkitanimationiteration_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationiteration ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationiteration_ = _onWebkitanimationiteration <<< Applicative.pure

_onWebkitanimationend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationend = Functor.map
  ( unsafeAttribute <<< { key: "onWebkitanimationend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onWebkitanimationend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onWebkitanimationend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onWebkitanimationend_ = _onWebkitanimationend <<< Applicative.pure

_onWaiting
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onWaiting :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onWaiting = Functor.map
  ( unsafeAttribute <<< { key: "onWaiting", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onWaiting_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onWaiting :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onWaiting_ = _onWaiting <<< Applicative.pure

_onVolumechange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onVolumechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onVolumechange = Functor.map
  ( unsafeAttribute <<< { key: "onVolumechange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onVolumechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onVolumechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onVolumechange_ = _onVolumechange <<< Applicative.pure

_onToggle
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onToggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onToggle = Functor.map
  (unsafeAttribute <<< { key: "onToggle", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onToggle_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onToggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onToggle_ = _onToggle <<< Applicative.pure

_onTimeupdate
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTimeupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTimeupdate = Functor.map
  ( unsafeAttribute <<< { key: "onTimeupdate", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onTimeupdate_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onTimeupdate :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onTimeupdate_ = _onTimeupdate <<< Applicative.pure

_onSuspend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSuspend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSuspend = Functor.map
  ( unsafeAttribute <<< { key: "onSuspend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSuspend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSuspend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSuspend_ = _onSuspend <<< Applicative.pure

_onSubmit
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSubmit :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSubmit = Functor.map
  (unsafeAttribute <<< { key: "onSubmit", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onSubmit_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSubmit :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSubmit_ = _onSubmit <<< Applicative.pure

_onStalled
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onStalled :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onStalled = Functor.map
  ( unsafeAttribute <<< { key: "onStalled", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onStalled_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onStalled :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onStalled_ = _onStalled <<< Applicative.pure

_onSlotchange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSlotchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSlotchange = Functor.map
  ( unsafeAttribute <<< { key: "onSlotchange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSlotchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onSlotchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onSlotchange_ = _onSlotchange <<< Applicative.pure

_onSelect
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSelect :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSelect = Functor.map
  (unsafeAttribute <<< { key: "onSelect", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onSelect_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSelect :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSelect_ = _onSelect <<< Applicative.pure

_onSeeking
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSeeking :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSeeking = Functor.map
  ( unsafeAttribute <<< { key: "onSeeking", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSeeking_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSeeking :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSeeking_ = _onSeeking <<< Applicative.pure

_onSeeked
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSeeked :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSeeked = Functor.map
  (unsafeAttribute <<< { key: "onSeeked", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onSeeked_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onSeeked :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onSeeked_ = _onSeeked <<< Applicative.pure

_onSecuritypolicyviolation
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onSecuritypolicyviolation ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onSecuritypolicyviolation = Functor.map
  ( unsafeAttribute <<< { key: "onSecuritypolicyviolation", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onSecuritypolicyviolation_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               ( onSecuritypolicyviolation ::
                   Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit
               | r
               )
           )
       )
_onSecuritypolicyviolation_ = _onSecuritypolicyviolation <<< Applicative.pure

_onReset
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onReset :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onReset = Functor.map
  (unsafeAttribute <<< { key: "onReset", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onReset_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onReset :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onReset_ = _onReset <<< Applicative.pure

_onRatechange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onRatechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onRatechange = Functor.map
  ( unsafeAttribute <<< { key: "onRatechange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onRatechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onRatechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onRatechange_ = _onRatechange <<< Applicative.pure

_onProgress
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onProgress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onProgress = Functor.map
  ( unsafeAttribute <<< { key: "onProgress", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onProgress_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onProgress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onProgress_ = _onProgress <<< Applicative.pure

_onPlaying
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPlaying :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPlaying = Functor.map
  ( unsafeAttribute <<< { key: "onPlaying", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onPlaying_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPlaying :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPlaying_ = _onPlaying <<< Applicative.pure

_onPlay
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPlay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPlay = Functor.map
  (unsafeAttribute <<< { key: "onPlay", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onPlay_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPlay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPlay_ = _onPlay <<< Applicative.pure

_onPause
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPause :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPause = Functor.map
  (unsafeAttribute <<< { key: "onPause", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onPause_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPause :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPause_ = _onPause <<< Applicative.pure

_onPaste
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPaste :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPaste = Functor.map
  (unsafeAttribute <<< { key: "onPaste", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onPaste_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onPaste :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onPaste_ = _onPaste <<< Applicative.pure

_onMouseup
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseup = Functor.map
  ( unsafeAttribute <<< { key: "onMouseup", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMouseup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseup_ = _onMouseup <<< Applicative.pure

_onMouseover
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseover = Functor.map
  ( unsafeAttribute <<< { key: "onMouseover", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMouseover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseover_ = _onMouseover <<< Applicative.pure

_onMouseout
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseout = Functor.map
  ( unsafeAttribute <<< { key: "onMouseout", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMouseout_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMouseout :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMouseout_ = _onMouseout <<< Applicative.pure

_onMousemove
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMousemove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMousemove = Functor.map
  ( unsafeAttribute <<< { key: "onMousemove", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMousemove_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMousemove :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMousemove_ = _onMousemove <<< Applicative.pure

_onMouseleave
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onMouseleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseleave = Functor.map
  ( unsafeAttribute <<< { key: "onMouseleave", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMouseleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onMouseleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseleave_ = _onMouseleave <<< Applicative.pure

_onMouseenter
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onMouseenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseenter = Functor.map
  ( unsafeAttribute <<< { key: "onMouseenter", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMouseenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onMouseenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onMouseenter_ = _onMouseenter <<< Applicative.pure

_onMousedown
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMousedown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMousedown = Functor.map
  ( unsafeAttribute <<< { key: "onMousedown", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onMousedown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onMousedown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onMousedown_ = _onMousedown <<< Applicative.pure

_onLoadstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onLoadstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onLoadstart = Functor.map
  ( unsafeAttribute <<< { key: "onLoadstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onLoadstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onLoadstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onLoadstart_ = _onLoadstart <<< Applicative.pure

_onLoadedmetadata
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onLoadedmetadata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadedmetadata = Functor.map
  ( unsafeAttribute <<< { key: "onLoadedmetadata", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onLoadedmetadata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onLoadedmetadata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadedmetadata_ = _onLoadedmetadata <<< Applicative.pure

_onLoadeddata
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onLoadeddata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadeddata = Functor.map
  ( unsafeAttribute <<< { key: "onLoadeddata", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onLoadeddata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onLoadeddata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onLoadeddata_ = _onLoadeddata <<< Applicative.pure

_onKeyup
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeyup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeyup = Functor.map
  (unsafeAttribute <<< { key: "onKeyup", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onKeyup_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeyup :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeyup_ = _onKeyup <<< Applicative.pure

_onKeypress
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeypress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeypress = Functor.map
  ( unsafeAttribute <<< { key: "onKeypress", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onKeypress_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeypress :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeypress_ = _onKeypress <<< Applicative.pure

_onKeydown
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeydown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeydown = Functor.map
  ( unsafeAttribute <<< { key: "onKeydown", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onKeydown_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onKeydown :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onKeydown_ = _onKeydown <<< Applicative.pure

_onInvalid
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onInvalid :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onInvalid = Functor.map
  ( unsafeAttribute <<< { key: "onInvalid", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onInvalid_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onInvalid :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onInvalid_ = _onInvalid <<< Applicative.pure

_onInput
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onInput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onInput = Functor.map
  (unsafeAttribute <<< { key: "onInput", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onInput_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onInput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onInput_ = _onInput <<< Applicative.pure

_onFormdata
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onFormdata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onFormdata = Functor.map
  ( unsafeAttribute <<< { key: "onFormdata", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onFormdata_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onFormdata :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onFormdata_ = _onFormdata <<< Applicative.pure

_onEnded
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onEnded :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onEnded = Functor.map
  (unsafeAttribute <<< { key: "onEnded", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onEnded_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onEnded :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onEnded_ = _onEnded <<< Applicative.pure

_onEmptied
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onEmptied :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onEmptied = Functor.map
  ( unsafeAttribute <<< { key: "onEmptied", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onEmptied_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onEmptied :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onEmptied_ = _onEmptied <<< Applicative.pure

_onDurationchange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onDurationchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDurationchange = Functor.map
  ( unsafeAttribute <<< { key: "onDurationchange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDurationchange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onDurationchange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onDurationchange_ = _onDurationchange <<< Applicative.pure

_onDrop
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDrop :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDrop = Functor.map
  (unsafeAttribute <<< { key: "onDrop", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onDrop_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDrop :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDrop_ = _onDrop <<< Applicative.pure

_onDragstart
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragstart = Functor.map
  ( unsafeAttribute <<< { key: "onDragstart", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDragstart_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragstart :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragstart_ = _onDragstart <<< Applicative.pure

_onDragover
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragover = Functor.map
  ( unsafeAttribute <<< { key: "onDragover", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDragover_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragover :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragover_ = _onDragover <<< Applicative.pure

_onDragleave
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragleave = Functor.map
  ( unsafeAttribute <<< { key: "onDragleave", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDragleave_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragleave :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragleave_ = _onDragleave <<< Applicative.pure

_onDragenter
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragenter = Functor.map
  ( unsafeAttribute <<< { key: "onDragenter", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDragenter_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragenter :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragenter_ = _onDragenter <<< Applicative.pure

_onDragend
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragend = Functor.map
  ( unsafeAttribute <<< { key: "onDragend", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDragend_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDragend :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDragend_ = _onDragend <<< Applicative.pure

_onDrag
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDrag :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDrag = Functor.map
  (unsafeAttribute <<< { key: "onDrag", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onDrag_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDrag :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDrag_ = _onDrag <<< Applicative.pure

_onDblclick
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDblclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDblclick = Functor.map
  ( unsafeAttribute <<< { key: "onDblclick", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onDblclick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onDblclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onDblclick_ = _onDblclick <<< Applicative.pure

_onCut
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCut :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCut = Functor.map
  (unsafeAttribute <<< { key: "onCut", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onCut_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCut :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCut_ = _onCut <<< Applicative.pure

_onCuechange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCuechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCuechange = Functor.map
  ( unsafeAttribute <<< { key: "onCuechange", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onCuechange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCuechange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCuechange_ = _onCuechange <<< Applicative.pure

_onCopy
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCopy :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCopy = Functor.map
  (unsafeAttribute <<< { key: "onCopy", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onCopy_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCopy :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCopy_ = _onCopy <<< Applicative.pure

_onContextrestored
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextrestored :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextrestored = Functor.map
  ( unsafeAttribute <<< { key: "onContextrestored", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onContextrestored_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextrestored :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextrestored_ = _onContextrestored <<< Applicative.pure

_onContextmenu
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextmenu :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextmenu = Functor.map
  ( unsafeAttribute <<< { key: "onContextmenu", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onContextmenu_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextmenu :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextmenu_ = _onContextmenu <<< Applicative.pure

_onContextlost
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextlost :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextlost = Functor.map
  ( unsafeAttribute <<< { key: "onContextlost", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onContextlost_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onContextlost :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onContextlost_ = _onContextlost <<< Applicative.pure

_onClose
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onClose :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onClose = Functor.map
  (unsafeAttribute <<< { key: "onClose", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onClose_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onClose :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onClose_ = _onClose <<< Applicative.pure

_onClick
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onClick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onClick = Functor.map
  (unsafeAttribute <<< { key: "onClick", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onClick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onClick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onClick_ = _onClick <<< Applicative.pure

_onChange
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onChange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onChange = Functor.map
  (unsafeAttribute <<< { key: "onChange", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onChange_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onChange :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onChange_ = _onChange <<< Applicative.pure

_onCanplaythrough
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onCanplaythrough :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplaythrough = Functor.map
  ( unsafeAttribute <<< { key: "onCanplaythrough", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onCanplaythrough_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onCanplaythrough :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onCanplaythrough_ = _onCanplaythrough <<< Applicative.pure

_onCanplay
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCanplay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCanplay = Functor.map
  ( unsafeAttribute <<< { key: "onCanplay", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onCanplay_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCanplay :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCanplay_ = _onCanplay <<< Applicative.pure

_onCancel
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCancel = Functor.map
  (unsafeAttribute <<< { key: "onCancel", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onCancel_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onCancel :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onCancel_ = _onCancel <<< Applicative.pure

_onBeforetoggle
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforetoggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforetoggle = Functor.map
  ( unsafeAttribute <<< { key: "onBeforetoggle", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onBeforetoggle_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforetoggle :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforetoggle_ = _onBeforetoggle <<< Applicative.pure

_onBeforematch
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforematch :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforematch = Functor.map
  ( unsafeAttribute <<< { key: "onBeforematch", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onBeforematch_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforematch :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforematch_ = _onBeforematch <<< Applicative.pure

_onBeforeinput
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforeinput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforeinput = Functor.map
  ( unsafeAttribute <<< { key: "onBeforeinput", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onBeforeinput_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           ( Indexed
               (onBeforeinput :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r)
           )
       )
_onBeforeinput_ = _onBeforeinput <<< Applicative.pure

_onAuxclick
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onAuxclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onAuxclick = Functor.map
  ( unsafeAttribute <<< { key: "onAuxclick", value: _ } <<<
      (Deku.Attribute.cb' <<< Deku.Attribute.cb)
  )

_onAuxclick_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onAuxclick :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onAuxclick_ = _onAuxclick <<< Applicative.pure

_onAbort
  :: forall r
   . Event (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onAbort :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onAbort = Functor.map
  (unsafeAttribute <<< { key: "onAbort", value: _ } <<< (Deku.Attribute.cb' <<< Deku.Attribute.cb))

_onAbort_
  :: forall r
   . (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit)
  -> Event
       ( Attribute
           (Indexed (onAbort :: Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit | r))
       )
_onAbort_ = _onAbort <<< Applicative.pure

_ariaValuetext
  :: forall r. Event String -> Event (Attribute (Indexed (ariaValuetext :: String | r)))
_ariaValuetext = Functor.map
  (unsafeAttribute <<< { key: "aria-valuetext", value: _ } <<< Deku.Attribute.prop')

_ariaValuetext_ :: forall r. String -> Event (Attribute (Indexed (ariaValuetext :: String | r)))
_ariaValuetext_ = _ariaValuetext <<< Applicative.pure

_ariaValuenow :: forall r. Event String -> Event (Attribute (Indexed (ariaValuenow :: String | r)))
_ariaValuenow = Functor.map
  (unsafeAttribute <<< { key: "aria-valuenow", value: _ } <<< Deku.Attribute.prop')

_ariaValuenow_ :: forall r. String -> Event (Attribute (Indexed (ariaValuenow :: String | r)))
_ariaValuenow_ = _ariaValuenow <<< Applicative.pure

_ariaValuemin :: forall r. Event String -> Event (Attribute (Indexed (ariaValuemin :: String | r)))
_ariaValuemin = Functor.map
  (unsafeAttribute <<< { key: "aria-valuemin", value: _ } <<< Deku.Attribute.prop')

_ariaValuemin_ :: forall r. String -> Event (Attribute (Indexed (ariaValuemin :: String | r)))
_ariaValuemin_ = _ariaValuemin <<< Applicative.pure

_ariaValuemax :: forall r. Event String -> Event (Attribute (Indexed (ariaValuemax :: String | r)))
_ariaValuemax = Functor.map
  (unsafeAttribute <<< { key: "aria-valuemax", value: _ } <<< Deku.Attribute.prop')

_ariaValuemax_ :: forall r. String -> Event (Attribute (Indexed (ariaValuemax :: String | r)))
_ariaValuemax_ = _ariaValuemax <<< Applicative.pure

_ariaSort :: forall r. Event String -> Event (Attribute (Indexed (ariaSort :: String | r)))
_ariaSort = Functor.map
  (unsafeAttribute <<< { key: "aria-sort", value: _ } <<< Deku.Attribute.prop')

_ariaSort_ :: forall r. String -> Event (Attribute (Indexed (ariaSort :: String | r)))
_ariaSort_ = _ariaSort <<< Applicative.pure

_ariaSetsize :: forall r. Event String -> Event (Attribute (Indexed (ariaSetsize :: String | r)))
_ariaSetsize = Functor.map
  (unsafeAttribute <<< { key: "aria-setsize", value: _ } <<< Deku.Attribute.prop')

_ariaSetsize_ :: forall r. String -> Event (Attribute (Indexed (ariaSetsize :: String | r)))
_ariaSetsize_ = _ariaSetsize <<< Applicative.pure

_ariaSelected :: forall r. Event String -> Event (Attribute (Indexed (ariaSelected :: String | r)))
_ariaSelected = Functor.map
  (unsafeAttribute <<< { key: "aria-selected", value: _ } <<< Deku.Attribute.prop')

_ariaSelected_ :: forall r. String -> Event (Attribute (Indexed (ariaSelected :: String | r)))
_ariaSelected_ = _ariaSelected <<< Applicative.pure

_ariaRowspan :: forall r. Event String -> Event (Attribute (Indexed (ariaRowspan :: String | r)))
_ariaRowspan = Functor.map
  (unsafeAttribute <<< { key: "aria-rowspan", value: _ } <<< Deku.Attribute.prop')

_ariaRowspan_ :: forall r. String -> Event (Attribute (Indexed (ariaRowspan :: String | r)))
_ariaRowspan_ = _ariaRowspan <<< Applicative.pure

_ariaRowindextext
  :: forall r. Event String -> Event (Attribute (Indexed (ariaRowindextext :: String | r)))
_ariaRowindextext = Functor.map
  (unsafeAttribute <<< { key: "aria-rowindextext", value: _ } <<< Deku.Attribute.prop')

_ariaRowindextext_
  :: forall r. String -> Event (Attribute (Indexed (ariaRowindextext :: String | r)))
_ariaRowindextext_ = _ariaRowindextext <<< Applicative.pure

_ariaRowindex :: forall r. Event String -> Event (Attribute (Indexed (ariaRowindex :: String | r)))
_ariaRowindex = Functor.map
  (unsafeAttribute <<< { key: "aria-rowindex", value: _ } <<< Deku.Attribute.prop')

_ariaRowindex_ :: forall r. String -> Event (Attribute (Indexed (ariaRowindex :: String | r)))
_ariaRowindex_ = _ariaRowindex <<< Applicative.pure

_ariaRowcount :: forall r. Event String -> Event (Attribute (Indexed (ariaRowcount :: String | r)))
_ariaRowcount = Functor.map
  (unsafeAttribute <<< { key: "aria-rowcount", value: _ } <<< Deku.Attribute.prop')

_ariaRowcount_ :: forall r. String -> Event (Attribute (Indexed (ariaRowcount :: String | r)))
_ariaRowcount_ = _ariaRowcount <<< Applicative.pure

_ariaRoledescription
  :: forall r. Event String -> Event (Attribute (Indexed (ariaRoledescription :: String | r)))
_ariaRoledescription = Functor.map
  (unsafeAttribute <<< { key: "aria-roledescription", value: _ } <<< Deku.Attribute.prop')

_ariaRoledescription_
  :: forall r. String -> Event (Attribute (Indexed (ariaRoledescription :: String | r)))
_ariaRoledescription_ = _ariaRoledescription <<< Applicative.pure

_ariaRequired :: forall r. Event String -> Event (Attribute (Indexed (ariaRequired :: String | r)))
_ariaRequired = Functor.map
  (unsafeAttribute <<< { key: "aria-required", value: _ } <<< Deku.Attribute.prop')

_ariaRequired_ :: forall r. String -> Event (Attribute (Indexed (ariaRequired :: String | r)))
_ariaRequired_ = _ariaRequired <<< Applicative.pure

_ariaReadonly :: forall r. Event String -> Event (Attribute (Indexed (ariaReadonly :: String | r)))
_ariaReadonly = Functor.map
  (unsafeAttribute <<< { key: "aria-readonly", value: _ } <<< Deku.Attribute.prop')

_ariaReadonly_ :: forall r. String -> Event (Attribute (Indexed (ariaReadonly :: String | r)))
_ariaReadonly_ = _ariaReadonly <<< Applicative.pure

_ariaPressed :: forall r. Event String -> Event (Attribute (Indexed (ariaPressed :: String | r)))
_ariaPressed = Functor.map
  (unsafeAttribute <<< { key: "aria-pressed", value: _ } <<< Deku.Attribute.prop')

_ariaPressed_ :: forall r. String -> Event (Attribute (Indexed (ariaPressed :: String | r)))
_ariaPressed_ = _ariaPressed <<< Applicative.pure

_ariaPosinset :: forall r. Event String -> Event (Attribute (Indexed (ariaPosinset :: String | r)))
_ariaPosinset = Functor.map
  (unsafeAttribute <<< { key: "aria-posinset", value: _ } <<< Deku.Attribute.prop')

_ariaPosinset_ :: forall r. String -> Event (Attribute (Indexed (ariaPosinset :: String | r)))
_ariaPosinset_ = _ariaPosinset <<< Applicative.pure

_ariaPlaceholder
  :: forall r. Event String -> Event (Attribute (Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder = Functor.map
  (unsafeAttribute <<< { key: "aria-placeholder", value: _ } <<< Deku.Attribute.prop')

_ariaPlaceholder_
  :: forall r. String -> Event (Attribute (Indexed (ariaPlaceholder :: String | r)))
_ariaPlaceholder_ = _ariaPlaceholder <<< Applicative.pure

_ariaOwns :: forall r. Event String -> Event (Attribute (Indexed (ariaOwns :: String | r)))
_ariaOwns = Functor.map
  (unsafeAttribute <<< { key: "aria-owns", value: _ } <<< Deku.Attribute.prop')

_ariaOwns_ :: forall r. String -> Event (Attribute (Indexed (ariaOwns :: String | r)))
_ariaOwns_ = _ariaOwns <<< Applicative.pure

_ariaOrientation
  :: forall r. Event String -> Event (Attribute (Indexed (ariaOrientation :: String | r)))
_ariaOrientation = Functor.map
  (unsafeAttribute <<< { key: "aria-orientation", value: _ } <<< Deku.Attribute.prop')

_ariaOrientation_
  :: forall r. String -> Event (Attribute (Indexed (ariaOrientation :: String | r)))
_ariaOrientation_ = _ariaOrientation <<< Applicative.pure

_ariaMultiselectable
  :: forall r. Event String -> Event (Attribute (Indexed (ariaMultiselectable :: String | r)))
_ariaMultiselectable = Functor.map
  (unsafeAttribute <<< { key: "aria-multiselectable", value: _ } <<< Deku.Attribute.prop')

_ariaMultiselectable_
  :: forall r. String -> Event (Attribute (Indexed (ariaMultiselectable :: String | r)))
_ariaMultiselectable_ = _ariaMultiselectable <<< Applicative.pure

_ariaMultiline
  :: forall r. Event String -> Event (Attribute (Indexed (ariaMultiline :: String | r)))
_ariaMultiline = Functor.map
  (unsafeAttribute <<< { key: "aria-multiline", value: _ } <<< Deku.Attribute.prop')

_ariaMultiline_ :: forall r. String -> Event (Attribute (Indexed (ariaMultiline :: String | r)))
_ariaMultiline_ = _ariaMultiline <<< Applicative.pure

_ariaModal :: forall r. Event String -> Event (Attribute (Indexed (ariaModal :: String | r)))
_ariaModal = Functor.map
  (unsafeAttribute <<< { key: "aria-modal", value: _ } <<< Deku.Attribute.prop')

_ariaModal_ :: forall r. String -> Event (Attribute (Indexed (ariaModal :: String | r)))
_ariaModal_ = _ariaModal <<< Applicative.pure

_ariaLive :: forall r. Event String -> Event (Attribute (Indexed (ariaLive :: String | r)))
_ariaLive = Functor.map
  (unsafeAttribute <<< { key: "aria-live", value: _ } <<< Deku.Attribute.prop')

_ariaLive_ :: forall r. String -> Event (Attribute (Indexed (ariaLive :: String | r)))
_ariaLive_ = _ariaLive <<< Applicative.pure

_ariaLevel :: forall r. Event String -> Event (Attribute (Indexed (ariaLevel :: String | r)))
_ariaLevel = Functor.map
  (unsafeAttribute <<< { key: "aria-level", value: _ } <<< Deku.Attribute.prop')

_ariaLevel_ :: forall r. String -> Event (Attribute (Indexed (ariaLevel :: String | r)))
_ariaLevel_ = _ariaLevel <<< Applicative.pure

_ariaLabelledby
  :: forall r. Event String -> Event (Attribute (Indexed (ariaLabelledby :: String | r)))
_ariaLabelledby = Functor.map
  (unsafeAttribute <<< { key: "aria-labelledby", value: _ } <<< Deku.Attribute.prop')

_ariaLabelledby_ :: forall r. String -> Event (Attribute (Indexed (ariaLabelledby :: String | r)))
_ariaLabelledby_ = _ariaLabelledby <<< Applicative.pure

_ariaLabel :: forall r. Event String -> Event (Attribute (Indexed (ariaLabel :: String | r)))
_ariaLabel = Functor.map
  (unsafeAttribute <<< { key: "aria-label", value: _ } <<< Deku.Attribute.prop')

_ariaLabel_ :: forall r. String -> Event (Attribute (Indexed (ariaLabel :: String | r)))
_ariaLabel_ = _ariaLabel <<< Applicative.pure

_ariaKeyshortcuts
  :: forall r. Event String -> Event (Attribute (Indexed (ariaKeyshortcuts :: String | r)))
_ariaKeyshortcuts = Functor.map
  (unsafeAttribute <<< { key: "aria-keyshortcuts", value: _ } <<< Deku.Attribute.prop')

_ariaKeyshortcuts_
  :: forall r. String -> Event (Attribute (Indexed (ariaKeyshortcuts :: String | r)))
_ariaKeyshortcuts_ = _ariaKeyshortcuts <<< Applicative.pure

_ariaInvalid :: forall r. Event String -> Event (Attribute (Indexed (ariaInvalid :: String | r)))
_ariaInvalid = Functor.map
  (unsafeAttribute <<< { key: "aria-invalid", value: _ } <<< Deku.Attribute.prop')

_ariaInvalid_ :: forall r. String -> Event (Attribute (Indexed (ariaInvalid :: String | r)))
_ariaInvalid_ = _ariaInvalid <<< Applicative.pure

_ariaHidden :: forall r. Event String -> Event (Attribute (Indexed (ariaHidden :: String | r)))
_ariaHidden = Functor.map
  (unsafeAttribute <<< { key: "aria-hidden", value: _ } <<< Deku.Attribute.prop')

_ariaHidden_ :: forall r. String -> Event (Attribute (Indexed (ariaHidden :: String | r)))
_ariaHidden_ = _ariaHidden <<< Applicative.pure

_ariaHaspopup :: forall r. Event String -> Event (Attribute (Indexed (ariaHaspopup :: String | r)))
_ariaHaspopup = Functor.map
  (unsafeAttribute <<< { key: "aria-haspopup", value: _ } <<< Deku.Attribute.prop')

_ariaHaspopup_ :: forall r. String -> Event (Attribute (Indexed (ariaHaspopup :: String | r)))
_ariaHaspopup_ = _ariaHaspopup <<< Applicative.pure

_ariaFlowto :: forall r. Event String -> Event (Attribute (Indexed (ariaFlowto :: String | r)))
_ariaFlowto = Functor.map
  (unsafeAttribute <<< { key: "aria-flowto", value: _ } <<< Deku.Attribute.prop')

_ariaFlowto_ :: forall r. String -> Event (Attribute (Indexed (ariaFlowto :: String | r)))
_ariaFlowto_ = _ariaFlowto <<< Applicative.pure

_ariaExpanded :: forall r. Event String -> Event (Attribute (Indexed (ariaExpanded :: String | r)))
_ariaExpanded = Functor.map
  (unsafeAttribute <<< { key: "aria-expanded", value: _ } <<< Deku.Attribute.prop')

_ariaExpanded_ :: forall r. String -> Event (Attribute (Indexed (ariaExpanded :: String | r)))
_ariaExpanded_ = _ariaExpanded <<< Applicative.pure

_ariaErrormessage
  :: forall r. Event String -> Event (Attribute (Indexed (ariaErrormessage :: String | r)))
_ariaErrormessage = Functor.map
  (unsafeAttribute <<< { key: "aria-errormessage", value: _ } <<< Deku.Attribute.prop')

_ariaErrormessage_
  :: forall r. String -> Event (Attribute (Indexed (ariaErrormessage :: String | r)))
_ariaErrormessage_ = _ariaErrormessage <<< Applicative.pure

_ariaDisabled :: forall r. Event String -> Event (Attribute (Indexed (ariaDisabled :: String | r)))
_ariaDisabled = Functor.map
  (unsafeAttribute <<< { key: "aria-disabled", value: _ } <<< Deku.Attribute.prop')

_ariaDisabled_ :: forall r. String -> Event (Attribute (Indexed (ariaDisabled :: String | r)))
_ariaDisabled_ = _ariaDisabled <<< Applicative.pure

_ariaDetails :: forall r. Event String -> Event (Attribute (Indexed (ariaDetails :: String | r)))
_ariaDetails = Functor.map
  (unsafeAttribute <<< { key: "aria-details", value: _ } <<< Deku.Attribute.prop')

_ariaDetails_ :: forall r. String -> Event (Attribute (Indexed (ariaDetails :: String | r)))
_ariaDetails_ = _ariaDetails <<< Applicative.pure

_ariaDescription
  :: forall r. Event String -> Event (Attribute (Indexed (ariaDescription :: String | r)))
_ariaDescription = Functor.map
  (unsafeAttribute <<< { key: "aria-description", value: _ } <<< Deku.Attribute.prop')

_ariaDescription_
  :: forall r. String -> Event (Attribute (Indexed (ariaDescription :: String | r)))
_ariaDescription_ = _ariaDescription <<< Applicative.pure

_ariaDescribedby
  :: forall r. Event String -> Event (Attribute (Indexed (ariaDescribedby :: String | r)))
_ariaDescribedby = Functor.map
  (unsafeAttribute <<< { key: "aria-describedby", value: _ } <<< Deku.Attribute.prop')

_ariaDescribedby_
  :: forall r. String -> Event (Attribute (Indexed (ariaDescribedby :: String | r)))
_ariaDescribedby_ = _ariaDescribedby <<< Applicative.pure

_ariaCurrent :: forall r. Event String -> Event (Attribute (Indexed (ariaCurrent :: String | r)))
_ariaCurrent = Functor.map
  (unsafeAttribute <<< { key: "aria-current", value: _ } <<< Deku.Attribute.prop')

_ariaCurrent_ :: forall r. String -> Event (Attribute (Indexed (ariaCurrent :: String | r)))
_ariaCurrent_ = _ariaCurrent <<< Applicative.pure

_ariaControls :: forall r. Event String -> Event (Attribute (Indexed (ariaControls :: String | r)))
_ariaControls = Functor.map
  (unsafeAttribute <<< { key: "aria-controls", value: _ } <<< Deku.Attribute.prop')

_ariaControls_ :: forall r. String -> Event (Attribute (Indexed (ariaControls :: String | r)))
_ariaControls_ = _ariaControls <<< Applicative.pure

_ariaColspan :: forall r. Event String -> Event (Attribute (Indexed (ariaColspan :: String | r)))
_ariaColspan = Functor.map
  (unsafeAttribute <<< { key: "aria-colspan", value: _ } <<< Deku.Attribute.prop')

_ariaColspan_ :: forall r. String -> Event (Attribute (Indexed (ariaColspan :: String | r)))
_ariaColspan_ = _ariaColspan <<< Applicative.pure

_ariaColindextext
  :: forall r. Event String -> Event (Attribute (Indexed (ariaColindextext :: String | r)))
_ariaColindextext = Functor.map
  (unsafeAttribute <<< { key: "aria-colindextext", value: _ } <<< Deku.Attribute.prop')

_ariaColindextext_
  :: forall r. String -> Event (Attribute (Indexed (ariaColindextext :: String | r)))
_ariaColindextext_ = _ariaColindextext <<< Applicative.pure

_ariaColindex :: forall r. Event String -> Event (Attribute (Indexed (ariaColindex :: String | r)))
_ariaColindex = Functor.map
  (unsafeAttribute <<< { key: "aria-colindex", value: _ } <<< Deku.Attribute.prop')

_ariaColindex_ :: forall r. String -> Event (Attribute (Indexed (ariaColindex :: String | r)))
_ariaColindex_ = _ariaColindex <<< Applicative.pure

_ariaColcount :: forall r. Event String -> Event (Attribute (Indexed (ariaColcount :: String | r)))
_ariaColcount = Functor.map
  (unsafeAttribute <<< { key: "aria-colcount", value: _ } <<< Deku.Attribute.prop')

_ariaColcount_ :: forall r. String -> Event (Attribute (Indexed (ariaColcount :: String | r)))
_ariaColcount_ = _ariaColcount <<< Applicative.pure

_ariaChecked :: forall r. Event String -> Event (Attribute (Indexed (ariaChecked :: String | r)))
_ariaChecked = Functor.map
  (unsafeAttribute <<< { key: "aria-checked", value: _ } <<< Deku.Attribute.prop')

_ariaChecked_ :: forall r. String -> Event (Attribute (Indexed (ariaChecked :: String | r)))
_ariaChecked_ = _ariaChecked <<< Applicative.pure

_ariaBusy :: forall r. Event String -> Event (Attribute (Indexed (ariaBusy :: String | r)))
_ariaBusy = Functor.map
  (unsafeAttribute <<< { key: "aria-busy", value: _ } <<< Deku.Attribute.prop')

_ariaBusy_ :: forall r. String -> Event (Attribute (Indexed (ariaBusy :: String | r)))
_ariaBusy_ = _ariaBusy <<< Applicative.pure

_ariaAutocomplete
  :: forall r. Event String -> Event (Attribute (Indexed (ariaAutocomplete :: String | r)))
_ariaAutocomplete = Functor.map
  (unsafeAttribute <<< { key: "aria-autocomplete", value: _ } <<< Deku.Attribute.prop')

_ariaAutocomplete_
  :: forall r. String -> Event (Attribute (Indexed (ariaAutocomplete :: String | r)))
_ariaAutocomplete_ = _ariaAutocomplete <<< Applicative.pure

_ariaAtomic :: forall r. Event String -> Event (Attribute (Indexed (ariaAtomic :: String | r)))
_ariaAtomic = Functor.map
  (unsafeAttribute <<< { key: "aria-atomic", value: _ } <<< Deku.Attribute.prop')

_ariaAtomic_ :: forall r. String -> Event (Attribute (Indexed (ariaAtomic :: String | r)))
_ariaAtomic_ = _ariaAtomic <<< Applicative.pure

_ariaActivedescendant
  :: forall r. Event String -> Event (Attribute (Indexed (ariaActivedescendant :: String | r)))
_ariaActivedescendant = Functor.map
  (unsafeAttribute <<< { key: "aria-activedescendant", value: _ } <<< Deku.Attribute.prop')

_ariaActivedescendant_
  :: forall r. String -> Event (Attribute (Indexed (ariaActivedescendant :: String | r)))
_ariaActivedescendant_ = _ariaActivedescendant <<< Applicative.pure

_role :: forall r. Event String -> Event (Attribute (Indexed (role :: String | r)))
_role = Functor.map (unsafeAttribute <<< { key: "role", value: _ } <<< Deku.Attribute.prop')

_role_ :: forall r. String -> Event (Attribute (Indexed (role :: String | r)))
_role_ = _role <<< Applicative.pure

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
