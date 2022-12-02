module Deku.DOM.Attr.OnPointerlockerror where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror Cb where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror ", value: cb' value }

instance Attr anything OnPointerlockerror (Effect Unit) where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockerror (Effect Boolean) where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror ", value: cb' (Cb (const value)) }

type OnPointerlockerrorEffect = forall element. Attr element OnPointerlockerror (Effect Unit) => Event (Attribute element)
