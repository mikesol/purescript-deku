module Deku.DOM.Attr.OnDragstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDragstart = OnDragstart

instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' value }

instance Attr anything OnDragstart (Effect Unit) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragstart (Effect Boolean) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const value)) }

instance Attr anything OnDragstart (Zora Unit) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnDragstart (Zora Boolean) where
  attr OnDragstart value = unsafeAttribute
    { key: "dragstart", value: cb' (Cb (const (runImpure value))) }