module Deku.DOM.Attr.OnDragend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDragend = OnDragend
instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' value }
instance Attr anything OnDragend (Effect Unit) where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragend (Effect Boolean) where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' (Cb (const value)) }
instance Attr anything OnDragend (Zora Unit) where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnDragend (Zora Boolean) where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' (Cb (const (runImpure value))) }