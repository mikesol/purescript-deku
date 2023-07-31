module Deku.DOM.Attr.X1 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)

data X1 = X1

instance Deku.Attribute.Attr everything X1 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "x1", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Line_ X1 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "x1", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ X1 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "x1", value: _ } <<< Deku.Attribute.prop'
