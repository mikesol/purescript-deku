module Deku.DOM.Attr.As where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Link (Link_)

data As = As

instance Deku.Attribute.Attr everything As Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "as", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ As String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "as", value: _ } <<< Deku.Attribute.prop'
