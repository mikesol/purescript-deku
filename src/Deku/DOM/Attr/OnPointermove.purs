module Deku.DOM.Attr.OnPointermove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointermove = OnPointermove

instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (Effect Unit) where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (Effect Boolean) where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' (Cb (const value)) }

type OnPointermoveEffect =
  forall element
   . Attr element OnPointermove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointermove Unit where
  attr OnPointermove _ = unsafeAttribute
    { key: "pointermove", value: unset' }
