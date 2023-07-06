module Deku.DOM.Attr.OnBlur where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnBlur = OnBlur

instance Attr anything OnBlur Cb where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' value }

instance Attr anything OnBlur (Effect Unit) where
  attr OnBlur value = unsafeAttribute
    { key: "blur", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnBlur (Effect Boolean) where
  attr OnBlur value = unsafeAttribute
    { key: "blur", value: cb' (Cb (const value)) }

type OnBlurEffect =
  forall element. Attr element OnBlur (Effect Unit) => Event (Attribute element)

instance Attr everything OnBlur Unit where
  attr OnBlur _ = unsafeAttribute
    { key: "blur", value: unset' }
