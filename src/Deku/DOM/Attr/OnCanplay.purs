module Deku.DOM.Attr.OnCanplay where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCanplay = OnCanplay

instance Attr anything OnCanplay Cb where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' value }

instance Attr anything OnCanplay (Effect Unit) where
  attr OnCanplay value = unsafeAttribute
    { key: "canplay", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplay (Effect Boolean) where
  attr OnCanplay value = unsafeAttribute
    { key: "canplay", value: cb' (Cb (const value)) }

type OnCanplayEffect =
  forall element
   . Attr element OnCanplay (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplay Unit where
  attr OnCanplay _ = unsafeAttribute
    { key: "canplay", value: unset' }
