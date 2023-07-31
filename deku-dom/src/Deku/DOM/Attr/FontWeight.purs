module Deku.DOM.Attr.FontWeight where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontWeight = FontWeight

instance Deku.Attribute.Attr everything FontWeight Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-weight", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontWeight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-weight", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontWeight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-weight", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontWeight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-weight", value: _ } <<<
    Deku.Attribute.prop'
