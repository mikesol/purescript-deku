module Deku.DOM.Attr.OnProgress where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnProgress = OnProgress
instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }
instance Attr anything OnProgress (Effect Unit) where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnProgress (Effect Boolean) where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' (Cb (const value)) }
instance Attr anything OnProgress (Zora Unit) where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnProgress (Zora Boolean) where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' (Cb (const (runImpure value))) }