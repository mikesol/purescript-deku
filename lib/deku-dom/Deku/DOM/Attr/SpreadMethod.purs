module Deku.DOM.Attr.SpreadMethod where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data SpreadMethod = SpreadMethod

instance Deku.Attribute.Attr everything SpreadMethod Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "spreadMethod", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr LinearGradient_ SpreadMethod String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "spreadMethod", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ SpreadMethod String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "spreadMethod", value: _ } <<<
    Deku.Attribute.prop'
