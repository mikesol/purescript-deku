module Deku.DOM.Attr.OnScroll where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnScroll = OnScroll

instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }

instance Attr anything OnScroll (Effect Unit) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (Effect Boolean) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const value)) }

type OnScrollEffect =
  forall element
   . Attr element OnScroll (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnScroll Unit where
  attr OnScroll _ = unsafeAttribute
    { key: "scroll", value: unset' }
