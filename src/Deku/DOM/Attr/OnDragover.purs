module Deku.DOM.Attr.OnDragover where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragover = OnDragover

instance Attr anything OnDragover Cb where
  attr OnDragover value = unsafeAttribute { key: "dragover", value: cb' value }

instance Attr anything OnDragover (Effect Unit) where
  attr OnDragover value = unsafeAttribute
    { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (Effect Boolean) where
  attr OnDragover value = unsafeAttribute
    { key: "dragover", value: cb' (Cb (const value)) }

type OnDragoverEffect =
  forall element
   . Attr element OnDragover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragover Unit where
  attr OnDragover _ = unsafeAttribute
    { key: "dragover", value: unset' }
