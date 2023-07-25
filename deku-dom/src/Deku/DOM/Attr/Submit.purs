module Deku.DOM.Attr.Submit where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Submit = Submit

instance Deku.Attribute.Attr everything Submit Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "submit", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Submit String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "submit", value: _ } <<< Deku.Attribute.prop'
