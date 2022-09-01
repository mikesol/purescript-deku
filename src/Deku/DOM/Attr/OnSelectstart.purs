module Deku.DOM.Attr.OnSelectstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnSelectstart = OnSelectstart
instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb' value }
instance Attr anything OnSelectstart (Effect Unit) where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectstart (Effect Boolean) where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb' (Cb (const value)) }