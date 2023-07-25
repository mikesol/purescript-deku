module Deku.DOM.Attr.Max where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Progress (Progress_)

data Max = Max

instance Deku.Attribute.Attr everything Max Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "max", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meter_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Progress_ Max String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "max", value: _ } <<< Deku.Attribute.prop'
