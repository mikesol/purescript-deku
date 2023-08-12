module Deku.DOM.Attr.OnSeeking where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSeeking = OnSeeking

instance Attr anything OnSeeking Cb where
  attr OnSeeking value = unsafeAttribute { key: "seeking", value: cb' value }

instance Attr anything OnSeeking (Effect Unit) where
  attr OnSeeking value = unsafeAttribute
    { key: "seeking", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeking (Effect Boolean) where
  attr OnSeeking value = unsafeAttribute
    { key: "seeking", value: cb' (Cb (const value)) }

type OnSeekingEffect =
  forall element
   . Attr element OnSeeking (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeking Unit where
  attr OnSeeking _ = unsafeAttribute
    { key: "seeking", value: unset' }
