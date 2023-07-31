module Deku.DOM.Attr.Y1 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)

data Y1 = Y1

instance Deku.Attribute.Attr everything Y1 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "y1", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Line_ Y1 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "y1", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ Y1 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "y1", value: _ } <<< Deku.Attribute.prop'
