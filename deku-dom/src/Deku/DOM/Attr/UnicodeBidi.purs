module Deku.DOM.Attr.UnicodeBidi where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data UnicodeBidi = UnicodeBidi

instance Deku.Attribute.Attr everything UnicodeBidi Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "unicode-bidi", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ UnicodeBidi String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "unicode-bidi", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ UnicodeBidi String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "unicode-bidi", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ UnicodeBidi String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "unicode-bidi", value: _ } <<<
    Deku.Attribute.prop'
