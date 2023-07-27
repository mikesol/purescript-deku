module Deku.DOM.Attr.Rev where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Link (Link_)

data Rev = Rev

instance Deku.Attribute.Attr everything Rev Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rev", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Rev String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rev", value: _ } <<< Deku.Attribute.prop'
