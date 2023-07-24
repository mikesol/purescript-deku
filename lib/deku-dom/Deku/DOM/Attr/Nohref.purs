module Deku.DOM.Attr.Nohref where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Area (Area_)

data Nohref = Nohref

instance Deku.Attribute.Attr everything Nohref Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "nohref", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Area_ Nohref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "nohref", value: _ } <<< Deku.Attribute.prop'
