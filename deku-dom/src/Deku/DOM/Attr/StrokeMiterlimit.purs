module Deku.DOM.Attr.StrokeMiterlimit where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeMiterlimit = StrokeMiterlimit

instance Deku.Attribute.Attr everything StrokeMiterlimit Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "stroke-miterlimit", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeMiterlimit String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-miterlimit", value: _ } <<<
    Deku.Attribute.prop'
