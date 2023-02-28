module Deku.DOM.Attr.OnTouchmove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove Cb where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' value }

instance Attr anything OnTouchmove (Effect Unit) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (Effect Boolean) where
  attr OnTouchmove value = unsafeAttribute
    { key: "touchmove  ", value: cb' (Cb (const value)) }

type OnTouchmoveEffect =
  forall element
   . Attr element OnTouchmove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchmove Unit where
  attr OnTouchmove _ = unsafeAttribute
    { key: "touchmove  ", value: unset' }
