module Deku.DOM.Attr.Z where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data Z = Z

instance Deku.Attribute.Attr everything Z Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "z", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FePointLight_ Z String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "z", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ Z String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "z", value: _ } <<< Deku.Attribute.prop'
