module Deku.DOM.Attr.OnContextmenu where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu Cb where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (Effect Unit) where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (Effect Boolean) where
  attr OnContextmenu value = unsafeAttribute
    { key: "contextmenu", value: cb' (Cb (const value)) }