module Deku.DOM.Attr.FontFamily where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontFamily = FontFamily

instance Deku.Attribute.Attr everything FontFamily Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-family", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontFamily String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-family", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontFamily String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-family", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontFamily String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-family", value: _ } <<<
    Deku.Attribute.prop'
