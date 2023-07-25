module Deku.DOM.Attr.Defer where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Script (Script_)

data Defer = Defer

instance Deku.Attribute.Attr everything Defer Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "defer", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Script_ Defer String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "defer", value: _ } <<< Deku.Attribute.prop'
