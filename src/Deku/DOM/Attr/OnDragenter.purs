module Deku.DOM.Attr.OnDragenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDragenter = OnDragenter
instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' value }
instance Attr anything OnDragenter (Effect Unit) where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragenter (Effect Boolean) where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' (Cb (const value)) }
instance Attr anything OnDragenter (Zora Unit) where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnDragenter (Zora Boolean) where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' (Cb (const (runImpure value))) }