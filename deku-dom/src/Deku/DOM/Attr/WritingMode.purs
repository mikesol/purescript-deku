module Deku.DOM.Attr.WritingMode where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data WritingMode = WritingMode

instance Deku.Attribute.Attr everything WritingMode Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "writing-mode", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ WritingMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "writing-mode", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ WritingMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "writing-mode", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ WritingMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "writing-mode", value: _ } <<<
    Deku.Attribute.prop'
