module Deku.DOM.Attr.OnShow  where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnShow  = OnShow 
instance Attr anything OnShow  Cb where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' value }
instance Attr anything OnShow  (Effect Unit) where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnShow  (Effect Boolean) where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' (Cb (const value)) }
instance Attr anything OnShow  (Zora Unit) where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnShow  (Zora Boolean) where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' (Cb (const (runImpure value))) }