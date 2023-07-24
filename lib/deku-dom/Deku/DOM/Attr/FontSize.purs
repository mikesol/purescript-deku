module Deku.DOM.Attr.FontSize where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontSize = FontSize

instance Deku.Attribute.Attr everything FontSize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-size", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size", value: _ } <<<
    Deku.Attribute.prop'
