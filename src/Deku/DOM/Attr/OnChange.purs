module Deku.DOM.Attr.OnChange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnChange = OnChange

instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb' value }

instance Attr anything OnChange (Effect Unit) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (Effect Boolean) where
  attr OnChange value = unsafeAttribute
    { key: "change", value: cb' (Cb (const value)) }

type OnChangeEffect =
  forall element
   . Attr element OnChange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnChange Unit where
  attr OnChange _ = unsafeAttribute
    { key: "change", value: unset' }
