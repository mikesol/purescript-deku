module Deku.DOM.Attr.Lostpointercapture where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Lostpointercapture = Lostpointercapture

instance Deku.Attribute.Attr everything Lostpointercapture Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "lostpointercapture", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Lostpointercapture String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lostpointercapture", value: _ } <<<
    Deku.Attribute.prop'
