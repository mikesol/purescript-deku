module Deku.DOM.Attr.Action where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)

data Action = Action

instance Deku.Attribute.Attr everything Action Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "action", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Button_ Action String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "action", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Action String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "action", value: _ } <<< Deku.Attribute.prop'
