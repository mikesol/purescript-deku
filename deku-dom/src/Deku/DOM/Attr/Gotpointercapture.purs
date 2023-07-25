module Deku.DOM.Attr.Gotpointercapture where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Gotpointercapture = Gotpointercapture

instance Deku.Attribute.Attr everything Gotpointercapture Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "gotpointercapture", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Gotpointercapture String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "gotpointercapture", value: _ } <<<
    Deku.Attribute.prop'
