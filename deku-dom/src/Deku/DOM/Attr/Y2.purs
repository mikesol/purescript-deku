module Deku.DOM.Attr.Y2 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)

data Y2 = Y2

instance Deku.Attribute.Attr everything Y2 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "y2", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Line_ Y2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "y2", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ Y2 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "y2", value: _ } <<< Deku.Attribute.prop'
