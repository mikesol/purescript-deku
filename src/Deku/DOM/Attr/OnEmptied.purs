module Deku.DOM.Attr.OnEmptied where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEmptied = OnEmptied

instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (Effect Unit) where
  attr OnEmptied value = unsafeAttribute
    { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (Effect Boolean) where
  attr OnEmptied value = unsafeAttribute
    { key: "emptied", value: cb' (Cb (const value)) }

type OnEmptiedEffect =
  forall element
   . Attr element OnEmptied (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEmptied Unit where
  attr OnEmptied _ = unsafeAttribute
    { key: "emptied", value: unset' }
