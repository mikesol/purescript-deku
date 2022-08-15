module Deku.DOM.Attr.OnSeeking where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSeeking = OnSeeking
instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' value }
instance Attr anything OnSeeking (Effect Unit) where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeking (Effect Boolean) where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' (Cb (const value)) }
instance Attr anything OnSeeking (Zora Unit) where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnSeeking (Zora Boolean) where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' (Cb (const (runImpure value))) }