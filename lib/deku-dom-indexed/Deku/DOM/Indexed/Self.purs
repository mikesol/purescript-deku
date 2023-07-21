module Deku.DOM.Indexed.Self where

import Control.Applicative (pure) as Applicative
import Control.Category ((<<<))
import Data.Functor (map) as Functor
import Data.Unit (Unit)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Deku.Attribute (Cb(..), Attribute, unsafeAttribute, cb')
import Deku.DOM.Indexed.Index (Indexed)
import FRP.Event (Event)
import Type.Proxy (Proxy)
import Web.DOM.Element (Element) as Web
import Web.HTML.HTMLAnchorElement (HTMLAnchorElement) as Web
import Web.HTML.HTMLAreaElement (HTMLAreaElement) as Web
import Web.HTML.HTMLAudioElement (HTMLAudioElement) as Web
import Web.HTML.HTMLBRElement (HTMLBRElement) as Web
import Web.HTML.HTMLBaseElement (HTMLBaseElement) as Web
import Web.HTML.HTMLBodyElement (HTMLBodyElement) as Web
import Web.HTML.HTMLButtonElement (HTMLButtonElement) as Web
import Web.HTML.HTMLCanvasElement (HTMLCanvasElement) as Web
import Web.HTML.HTMLDivElement (HTMLDivElement) as Web
import Web.HTML.HTMLElement (HTMLElement) as Web
import Web.HTML.HTMLEmbedElement (HTMLEmbedElement) as Web
import Web.HTML.HTMLFormElement (HTMLFormElement) as Web
import Web.HTML.HTMLHRElement (HTMLHRElement) as Web
import Web.HTML.HTMLHeadElement (HTMLHeadElement) as Web
import Web.HTML.HTMLHtmlElement (HTMLHtmlElement) as Web
import Web.HTML.HTMLInputElement (HTMLInputElement) as Web
import Web.HTML.HTMLLabelElement (HTMLLabelElement) as Web
import Web.HTML.HTMLLegendElement (HTMLLegendElement) as Web
import Web.HTML.HTMLLinkElement (HTMLLinkElement) as Web
import Web.HTML.HTMLMapElement (HTMLMapElement) as Web
import Web.HTML.HTMLMetaElement (HTMLMetaElement) as Web
import Web.HTML.HTMLMeterElement (HTMLMeterElement) as Web
import Web.HTML.HTMLObjectElement (HTMLObjectElement) as Web
import Web.HTML.HTMLOptionElement (HTMLOptionElement) as Web
import Web.HTML.HTMLOutputElement (HTMLOutputElement) as Web
import Web.HTML.HTMLParagraphElement (HTMLParagraphElement) as Web
import Web.HTML.HTMLParamElement (HTMLParamElement) as Web
import Web.HTML.HTMLPreElement (HTMLPreElement) as Web
import Web.HTML.HTMLProgressElement (HTMLProgressElement) as Web
import Web.HTML.HTMLScriptElement (HTMLScriptElement) as Web
import Web.HTML.HTMLSelectElement (HTMLSelectElement) as Web
import Web.HTML.HTMLSourceElement (HTMLSourceElement) as Web
import Web.HTML.HTMLSpanElement (HTMLSpanElement) as Web
import Web.HTML.HTMLStyleElement (HTMLStyleElement) as Web
import Web.HTML.HTMLTableDataCellElement (HTMLTableDataCellElement) as Web
import Web.HTML.HTMLTableElement (HTMLTableElement) as Web
import Web.HTML.HTMLTemplateElement (HTMLTemplateElement) as Web
import Web.HTML.HTMLTextAreaElement (HTMLTextAreaElement) as Web
import Web.HTML.HTMLTimeElement (HTMLTimeElement) as Web
import Web.HTML.HTMLTitleElement (HTMLTitleElement) as Web
import Web.HTML.HTMLTrackElement (HTMLTrackElement) as Web
import Web.HTML.HTMLVideoElement (HTMLVideoElement) as Web

class IsSelf (element :: Type) (name :: Symbol) | element -> name

self
  :: forall name e r
   . IsSelf e name
  => Event (e -> Effect Unit)
  -> Event (Attribute (Indexed (__nominal :: Proxy name | r)))
self = Functor.map
  (unsafeAttribute <<< { key: "@self@", value: _ } <<< (cb' <<< Cb <<< unsafeCoerce))

self_
  :: forall name e r
   . IsSelf e name
  => (e -> Effect Unit)
  -> Event (Attribute (Indexed (__nominal :: Proxy name | r)))
self_ = self <<< Applicative.pure

instance IsSelf Web.Element "global"
instance IsSelf Web.HTMLAnchorElement "HTMLAnchorElement"
instance IsSelf Web.HTMLAreaElement "HTMLAreaElement"
instance IsSelf Web.HTMLAudioElement "HTMLAudioElement"
instance IsSelf Web.HTMLBRElement "HTMLBRElement"
instance IsSelf Web.HTMLBaseElement "HTMLBaseElement"
instance IsSelf Web.HTMLBodyElement "HTMLBodyElement"
instance IsSelf Web.HTMLButtonElement "HTMLButtonElement"
instance IsSelf Web.HTMLCanvasElement "HTMLCanvasElement"
instance IsSelf Web.HTMLDivElement "HTMLDivElement"
instance IsSelf Web.HTMLElement "HTMLElement"
instance IsSelf Web.HTMLEmbedElement "HTMLEmbedElement"
instance IsSelf Web.HTMLFormElement "HTMLFormElement"
instance IsSelf Web.HTMLHRElement "HTMLHRElement"
instance IsSelf Web.HTMLHeadElement "HTMLHeadElement"
instance IsSelf Web.HTMLHtmlElement "HTMLHtmlElement"
instance IsSelf Web.HTMLInputElement "HTMLInputElement"
instance IsSelf Web.HTMLLabelElement "HTMLLabelElement"
instance IsSelf Web.HTMLLegendElement "HTMLLegendElement"
instance IsSelf Web.HTMLLinkElement "HTMLLinkElement"
instance IsSelf Web.HTMLMapElement "HTMLMapElement"
instance IsSelf Web.HTMLMetaElement "HTMLMetaElement"
instance IsSelf Web.HTMLMeterElement "HTMLMeterElement"
instance IsSelf Web.HTMLObjectElement "HTMLObjectElement"
instance IsSelf Web.HTMLOptionElement "HTMLOptionElement"
instance IsSelf Web.HTMLOutputElement "HTMLOutputElement"
instance IsSelf Web.HTMLParagraphElement "HTMLParagraphElement"
instance IsSelf Web.HTMLParamElement "HTMLParamElement"
instance IsSelf Web.HTMLPreElement "HTMLPreElement"
instance IsSelf Web.HTMLProgressElement "HTMLProgressElement"
instance IsSelf Web.HTMLScriptElement "HTMLScriptElement"
instance IsSelf Web.HTMLSelectElement "HTMLSelectElement"
instance IsSelf Web.HTMLSourceElement "HTMLSourceElement"
instance IsSelf Web.HTMLSpanElement "HTMLSpanElement"
instance IsSelf Web.HTMLStyleElement "HTMLStyleElement"
instance IsSelf Web.HTMLTableDataCellElement "HTMLTableDataCellElement"
instance IsSelf Web.HTMLTableElement "HTMLTableElement"
instance IsSelf Web.HTMLTemplateElement "HTMLTemplateElement"
instance IsSelf Web.HTMLTextAreaElement "HTMLTextAreaElement"
instance IsSelf Web.HTMLTimeElement "HTMLTimeElement"
instance IsSelf Web.HTMLTitleElement "HTMLTitleElement"
instance IsSelf Web.HTMLTrackElement "HTMLTrackElement"
instance IsSelf Web.HTMLVideoElement "HTMLVideoElement"
