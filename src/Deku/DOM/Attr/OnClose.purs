module Deku.DOM.Attr.OnClose where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnClose = OnClose

instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb' value }

instance Attr anything OnClose (Effect Unit) where
  attr OnClose value = unsafeAttribute
    { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (Effect Boolean) where
  attr OnClose value = unsafeAttribute
    { key: "close", value: cb' (Cb (const value)) }

type OnCloseEffect = forall element. Attr element OnClose (Effect Unit) => Event (Attribute element)
