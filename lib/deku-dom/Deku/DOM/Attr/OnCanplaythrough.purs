module Deku.DOM.Attr.OnCanplaythrough where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough Cb where
  attr OnCanplaythrough value = unsafeAttribute
    { key: "canplaythrough", value: cb' value }

instance Attr anything OnCanplaythrough (Effect Unit) where
  attr OnCanplaythrough value = unsafeAttribute
    { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplaythrough (Effect Boolean) where
  attr OnCanplaythrough value = unsafeAttribute
    { key: "canplaythrough", value: cb' (Cb (const value)) }

type OnCanplaythroughEffect =
  forall element
   . Attr element OnCanplaythrough (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplaythrough Unit where
  attr OnCanplaythrough _ = unsafeAttribute
    { key: "canplaythrough", value: unset' }
