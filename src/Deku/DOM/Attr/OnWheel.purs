module Deku.DOM.Attr.OnWheel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnWheel = OnWheel

instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' value }

instance Attr anything OnWheel (Effect Unit) where
  attr OnWheel value = unsafeAttribute
    { key: "wheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWheel (Effect Boolean) where
  attr OnWheel value = unsafeAttribute
    { key: "wheel", value: cb' (Cb (const value)) }

type OnWheelEffect =
  forall element
   . Attr element OnWheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWheel Unit where
  attr OnWheel _ = unsafeAttribute
    { key: "wheel", value: unset' }
