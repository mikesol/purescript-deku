module Deku.DOM.Attr.RepeatDur where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)

data RepeatDur = RepeatDur

instance Deku.Attribute.Attr everything RepeatDur Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "repeatDur", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ RepeatDur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatDur", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ RepeatDur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatDur", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ RepeatDur String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "repeatDur", value: _ } <<<
    Deku.Attribute.prop'
