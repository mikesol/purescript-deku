module Deku.DOM.Attr.OnSubmit where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSubmit = OnSubmit
instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' value }
instance Attr anything OnSubmit (Effect Unit) where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSubmit (Effect Boolean) where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' (Cb (const value)) }
instance Attr anything OnSubmit (Zora Unit) where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnSubmit (Zora Boolean) where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' (Cb (const (runImpure value))) }