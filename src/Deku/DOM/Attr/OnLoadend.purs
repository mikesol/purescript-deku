module Deku.DOM.Attr.OnLoadend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadend = OnLoadend

instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (Effect Unit) where
  attr OnLoadend value = unsafeAttribute
    { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (Effect Boolean) where
  attr OnLoadend value = unsafeAttribute
    { key: "loadend", value: cb' (Cb (const value)) }

type OnLoadendEffect =
  forall element
   . Attr element OnLoadend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadend Unit where
  attr OnLoadend _ = unsafeAttribute
    { key: "loadend", value: unset' }
