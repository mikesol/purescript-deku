module Deku.DOM.Attr.OnSelect where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelect = OnSelect

instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' value }

instance Attr anything OnSelect (Effect Unit) where
  attr OnSelect value = unsafeAttribute
    { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (Effect Boolean) where
  attr OnSelect value = unsafeAttribute
    { key: "select", value: cb' (Cb (const value)) }

type OnSelectEffect =
  forall element
   . Attr element OnSelect (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelect Unit where
  attr OnSelect _ = unsafeAttribute
    { key: "select", value: unset' }
