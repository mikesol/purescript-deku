module Deku.DOM.Attr.OnSeeked where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (Effect Unit) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (Effect Boolean) where
  attr OnSeeked value = unsafeAttribute
    { key: "seeked", value: cb' (Cb (const value)) }

type OnSeekedEffect =
  forall element
   . Attr element OnSeeked (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeked Unit where
  attr OnSeeked _ = unsafeAttribute
    { key: "seeked", value: unset' }
