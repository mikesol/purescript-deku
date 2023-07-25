module Deku.DOM.Attr.FilterUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Filter (Filter_)

data FilterUnits = FilterUnits

instance Deku.Attribute.Attr everything FilterUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "filterUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Filter_ FilterUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "filterUnits", value: _ } <<<
    Deku.Attribute.prop'
