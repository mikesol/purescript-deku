module Deku.DOM.Attr.BaselineShift where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data BaselineShift = BaselineShift

instance Deku.Attribute.Attr everything BaselineShift Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "baseline-shift", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ BaselineShift String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "baseline-shift", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ BaselineShift String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "baseline-shift", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ BaselineShift String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "baseline-shift", value: _ } <<<
    Deku.Attribute.prop'
