module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel Cb where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' value }

instance Attr anything OnMousewheel (Effect Unit) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (Effect Boolean) where
  attr OnMousewheel value = unsafeAttribute
    { key: "mousewheel  ", value: cb' (Cb (const value)) }

type OnMousewheelEffect =
  forall element
   . Attr element OnMousewheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousewheel Unit where
  attr OnMousewheel _ = unsafeAttribute
    { key: "mousewheel  ", value: unset' }
