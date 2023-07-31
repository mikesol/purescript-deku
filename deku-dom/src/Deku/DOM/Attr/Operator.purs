module Deku.DOM.Attr.Operator where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)

data Operator = Operator

instance Deku.Attribute.Attr everything Operator Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "operator", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComposite_ Operator String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "operator", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ Operator String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "operator", value: _ } <<< Deku.Attribute.prop'
