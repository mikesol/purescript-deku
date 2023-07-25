module Deku.DOM.Attr.FontStretch where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontStretch = FontStretch

instance Deku.Attribute.Attr everything FontStretch Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-stretch", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontStretch String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-stretch", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontStretch String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-stretch", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontStretch String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-stretch", value: _ } <<<
    Deku.Attribute.prop'
