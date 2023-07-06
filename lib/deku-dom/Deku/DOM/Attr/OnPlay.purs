module Deku.DOM.Attr.OnPlay where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPlay = OnPlay

instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' value }

instance Attr anything OnPlay (Effect Unit) where
  attr OnPlay value = unsafeAttribute
    { key: "play", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlay (Effect Boolean) where
  attr OnPlay value = unsafeAttribute
    { key: "play", value: cb' (Cb (const value)) }

type OnPlayEffect =
  forall element. Attr element OnPlay (Effect Unit) => Event (Attribute element)

instance Attr everything OnPlay Unit where
  attr OnPlay _ = unsafeAttribute
    { key: "play", value: unset' }
