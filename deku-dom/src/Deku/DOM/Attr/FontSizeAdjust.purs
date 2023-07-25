module Deku.DOM.Attr.FontSizeAdjust where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontSizeAdjust = FontSizeAdjust

instance Deku.Attribute.Attr everything FontSizeAdjust Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "font-size-adjust", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontSizeAdjust String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size-adjust", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontSizeAdjust String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size-adjust", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontSizeAdjust String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-size-adjust", value: _ } <<<
    Deku.Attribute.prop'
