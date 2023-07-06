module Deku.DOM.Attr.OnShow where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnShow = OnShow

instance Attr anything OnShow Cb where
  attr OnShow value = unsafeAttribute { key: "show ", value: cb' value }

instance Attr anything OnShow (Effect Unit) where
  attr OnShow value = unsafeAttribute
    { key: "show ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (Effect Boolean) where
  attr OnShow value = unsafeAttribute
    { key: "show ", value: cb' (Cb (const value)) }

type OnShowEffect =
  forall element. Attr element OnShow (Effect Unit) => Event (Attribute element)

instance Attr everything OnShow Unit where
  attr OnShow _ = unsafeAttribute
    { key: "show ", value: unset' }
