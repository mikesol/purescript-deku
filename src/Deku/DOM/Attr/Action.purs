module Deku.DOM.Attr.Action where

import Prelude

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Action = Action

instance Attr Form_ Action String where
  attr Action value = unsafeAttribute { key: "action", value: prop' value }

instance Attr everything Action Unit where
  attr Action _ = unsafeAttribute
    { key: "action", value: unset' }
