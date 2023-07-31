module Deku.DOM.Attr.Azimuth where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)

data Azimuth = Azimuth

instance Deku.Attribute.Attr everything Azimuth Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "azimuth", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDistantLight_ Azimuth String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "azimuth", value: _ } <<< Deku.Attribute.prop'
