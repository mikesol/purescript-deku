module Deku.DOM.Attr.OnLoad where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoad = OnLoad

instance Attr anything OnLoad Cb where
  attr OnLoad value = unsafeAttribute { key: "load", value: cb' value }

instance Attr anything OnLoad (Effect Unit) where
  attr OnLoad value = unsafeAttribute
    { key: "load", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoad (Effect Boolean) where
  attr OnLoad value = unsafeAttribute
    { key: "load", value: cb' (Cb (const value)) }

type OnLoadEffect =
  forall element. Attr element OnLoad (Effect Unit) => Event (Attribute element)

instance Attr everything OnLoad Unit where
  attr OnLoad _ = unsafeAttribute
    { key: "load", value: unset' }
