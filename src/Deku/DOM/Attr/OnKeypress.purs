module Deku.DOM.Attr.OnKeypress where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnKeypress = OnKeypress
instance Attr anything OnKeypress Cb where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' value }
instance Attr anything OnKeypress (Effect Unit) where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeypress (Effect Boolean) where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' (Cb (const value)) }
instance Attr anything OnKeypress (Zora Unit) where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnKeypress (Zora Boolean) where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' (Cb (const (runImpure value))) }