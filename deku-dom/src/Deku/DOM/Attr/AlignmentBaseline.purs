module Deku.DOM.Attr.AlignmentBaseline where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data AlignmentBaseline = AlignmentBaseline

instance Deku.Attribute.Attr everything AlignmentBaseline Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "alignment-baseline", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ AlignmentBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alignment-baseline", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ AlignmentBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alignment-baseline", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ AlignmentBaseline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alignment-baseline", value: _ } <<<
    Deku.Attribute.prop'
