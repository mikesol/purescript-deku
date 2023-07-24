module Deku.DOM.Attr.StrokeDasharray where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeDasharray = StrokeDasharray

instance Deku.Attribute.Attr everything StrokeDasharray Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "stroke-dasharray", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeDasharray String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-dasharray", value: _ } <<<
    Deku.Attribute.prop'
