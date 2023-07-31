module Deku.DOM.Attr.EdgeMode where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)

data EdgeMode = EdgeMode

instance Deku.Attribute.Attr everything EdgeMode Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "edgeMode", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeConvolveMatrix_ EdgeMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "edgeMode", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ EdgeMode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "edgeMode", value: _ } <<< Deku.Attribute.prop'
