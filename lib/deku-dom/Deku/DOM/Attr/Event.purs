module Deku.DOM.Attr.Event where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Script (Script_)

data Event = Event

instance Deku.Attribute.Attr everything Event Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "event", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Script_ Event String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "event", value: _ } <<< Deku.Attribute.prop'
