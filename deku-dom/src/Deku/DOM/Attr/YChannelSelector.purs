module Deku.DOM.Attr.YChannelSelector where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)

data YChannelSelector = YChannelSelector

instance Deku.Attribute.Attr everything YChannelSelector Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "yChannelSelector", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDisplacementMap_ YChannelSelector String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "yChannelSelector", value: _ } <<<
    Deku.Attribute.prop'
