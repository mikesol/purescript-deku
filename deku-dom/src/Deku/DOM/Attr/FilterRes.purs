module Deku.DOM.Attr.FilterRes where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Filter (Filter_)

data FilterRes = FilterRes

instance Deku.Attribute.Attr everything FilterRes Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "filterRes", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Filter_ FilterRes String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "filterRes", value: _ } <<<
    Deku.Attribute.prop'
