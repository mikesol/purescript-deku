module Deku.DOM.Attr.OnProgress where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnProgress = OnProgress

instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }

instance Attr anything OnProgress (Effect Unit) where
  attr OnProgress value = unsafeAttribute
    { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (Effect Boolean) where
  attr OnProgress value = unsafeAttribute
    { key: "progress", value: cb' (Cb (const value)) }

type OnProgressEffect = forall element. Attr element OnProgress (Effect Unit) => Event (Attribute element)
