module Deku.DOM.Attr.OnLoadstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute
    { key: "loadstart", value: cb' value }

instance Attr anything OnLoadstart (Effect Unit) where
  attr OnLoadstart value = unsafeAttribute
    { key: "loadstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadstart (Effect Boolean) where
  attr OnLoadstart value = unsafeAttribute
    { key: "loadstart", value: cb' (Cb (const value)) }

type OnLoadstartEffect =
  forall element
   . Attr element OnLoadstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadstart Unit where
  attr OnLoadstart _ = unsafeAttribute
    { key: "loadstart", value: unset' }
