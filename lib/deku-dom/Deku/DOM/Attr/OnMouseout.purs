module Deku.DOM.Attr.OnMouseout where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMouseout = OnMouseout

instance Attr anything OnMouseout Cb where
  attr OnMouseout value = unsafeAttribute { key: "mouseout", value: cb' value }

instance Attr anything OnMouseout (Effect Unit) where
  attr OnMouseout value = unsafeAttribute
    { key: "mouseout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseout (Effect Boolean) where
  attr OnMouseout value = unsafeAttribute
    { key: "mouseout", value: cb' (Cb (const value)) }

type OnMouseoutEffect =
  forall element
   . Attr element OnMouseout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMouseout Unit where
  attr OnMouseout _ = unsafeAttribute
    { key: "mouseout", value: unset' }
