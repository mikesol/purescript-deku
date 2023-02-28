module Deku.DOM.Attr.OnClick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnClick = OnClick

instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb' value }

instance Attr anything OnClick (Effect Unit) where
  attr OnClick value = unsafeAttribute
    { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (Effect Boolean) where
  attr OnClick value = unsafeAttribute
    { key: "click", value: cb' (Cb (const value)) }

type OnClickEffect =
  forall element
   . Attr element OnClick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClick Unit where
  attr OnClick _ = unsafeAttribute
    { key: "click", value: unset' }
