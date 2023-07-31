module Deku.DOM.Attr.DominantBaseline where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data DominantBaseline = DominantBaseline

instance Deku.Attribute.Attr everything DominantBaseline Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "dominant-baseline", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ DominantBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dominant-baseline", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ DominantBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dominant-baseline", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ DominantBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dominant-baseline", value: _ } <<<
    Deku.Attribute.prop'
