module Deku.DOM.Attr.For where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Script (Script_)

data For = For

instance Deku.Attribute.Attr everything For Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "for", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Label_ For String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "for", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Output_ For String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "for", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ For String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "for", value: _ } <<< Deku.Attribute.prop'
