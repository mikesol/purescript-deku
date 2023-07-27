module Deku.DOM.Attr.Urn where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Link (Link_)

data Urn = Urn

instance Deku.Attribute.Attr everything Urn Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "urn", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Urn String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "urn", value: _ } <<< Deku.Attribute.prop'
