module Deku.DOM.Attr.K3 where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComposite (FeComposite_)

data K3 = K3

instance Deku.Attribute.Attr everything K3 Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "k3", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComposite_ K3 String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "k3", value: _ } <<< Deku.Attribute.prop'
