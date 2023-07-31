module Deku.DOM.Attr.XChannelSelector where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)

data XChannelSelector = XChannelSelector

instance Deku.Attribute.Attr everything XChannelSelector Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "xChannelSelector", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDisplacementMap_ XChannelSelector String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "xChannelSelector", value: _ } <<<
    Deku.Attribute.prop'
