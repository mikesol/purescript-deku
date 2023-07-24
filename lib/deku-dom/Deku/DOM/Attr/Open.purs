module Deku.DOM.Attr.Open where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)

data Open = Open

instance Deku.Attribute.Attr everything Open Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "open", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Details_ Open String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "open", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Dialog_ Open String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "open", value: _ } <<< Deku.Attribute.prop'
