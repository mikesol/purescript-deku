module Deku.DOM.Attr.Intercept where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)

data Intercept = Intercept

instance Deku.Attribute.Attr everything Intercept Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "intercept", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ Intercept String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "intercept", value: _ } <<<
    Deku.Attribute.prop'
