module Deku.DOM.Attr.Values where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)

data Values = Values

instance Deku.Attribute.Attr everything Values Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "values", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Animate_ Values String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "values", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateMotion_ Values String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "values", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Values String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "values", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Values String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "values", value: _ } <<< Deku.Attribute.prop'
