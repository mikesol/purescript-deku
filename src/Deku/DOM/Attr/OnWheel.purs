module Deku.DOM.Attr.OnWheel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnWheel = OnWheel
instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' value }
instance Attr anything OnWheel (Effect Unit) where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWheel (Effect Boolean) where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' (Cb (const value)) }
instance Attr anything OnWheel (Zora Unit) where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnWheel (Zora Boolean) where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' (Cb (const (runImpure value))) }