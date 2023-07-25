module Deku.DOM.Attr.Min where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)

data Min = Min

instance Deku.Attribute.Attr everything Min Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "min", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Min String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Min String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Min String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Min String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meter_ Min String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "min", value: _ } <<< Deku.Attribute.prop'
