module Deku.DOM.Attr.OnTimeupdate where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (Effect Unit) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (Effect Boolean) where
  attr OnTimeupdate value = unsafeAttribute
    { key: "timeupdate", value: cb' (Cb (const value)) }

type OnTimeupdateEffect =
  forall element
   . Attr element OnTimeupdate (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTimeupdate Unit where
  attr OnTimeupdate _ = unsafeAttribute
    { key: "timeupdate", value: unset' }
