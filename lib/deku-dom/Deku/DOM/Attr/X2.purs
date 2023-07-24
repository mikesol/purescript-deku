module Deku.DOM.Attr.X2 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)

data X2 = X2

instance Deku.Attribute.Attr everything X2 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "x2", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Line_ X2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "x2", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ X2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "x2", value: _ } <<< Deku.Attribute.prop'
