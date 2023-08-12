module Deku.DOM.Attr.OnKeydown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeydown = OnKeydown

instance Attr anything OnKeydown Cb where
  attr OnKeydown value = unsafeAttribute { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (Effect Unit) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (Effect Boolean) where
  attr OnKeydown value = unsafeAttribute
    { key: "keydown", value: cb' (Cb (const value)) }

type OnKeydownEffect =
  forall element
   . Attr element OnKeydown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeydown Unit where
  attr OnKeydown _ = unsafeAttribute
    { key: "keydown", value: unset' }
