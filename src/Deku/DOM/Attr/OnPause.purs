module Deku.DOM.Attr.OnPause where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPause = OnPause

instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' value }

instance Attr anything OnPause (Effect Unit) where
  attr OnPause value = unsafeAttribute
    { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (Effect Boolean) where
  attr OnPause value = unsafeAttribute
    { key: "pause", value: cb' (Cb (const value)) }

type OnPauseEffect =
  forall element
   . Attr element OnPause (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPause Unit where
  attr OnPause _ = unsafeAttribute
    { key: "pause", value: unset' }
