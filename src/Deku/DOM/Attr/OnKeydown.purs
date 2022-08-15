module Deku.DOM.Attr.OnKeydown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnKeydown = OnKeydown

instance Attr anything OnKeydown Cb where
  attr OnKeydown value = unsafeAttribute { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (Effect Unit) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (Effect Boolean) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const value)) }

instance Attr anything OnKeydown (Zora Unit) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnKeydown (Zora Boolean) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const (runImpure value))) }