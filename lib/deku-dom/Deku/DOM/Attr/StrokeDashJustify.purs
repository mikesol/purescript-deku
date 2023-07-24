module Deku.DOM.Attr.StrokeDashJustify where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeDashJustify = StrokeDashJustify

instance Deku.Attribute.Attr everything StrokeDashJustify Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "stroke-dash-justify", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeDashJustify String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-dash-justify", value: _ } <<<
    Deku.Attribute.prop'
