module Deku.DOM.Attr.OnPointerlockerror where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnPointerlockerror (Zora Unit) where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror "
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnPointerlockerror (Zora Boolean) where
  attr OnPointerlockerror value = unsafeAttribute
    { key: "pointerlockerror ", value: cb' (Cb (const (runImpure value))) }