module Deku.DOM.Attr.RefY where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Symbol (Symbol_)

data RefY = RefY

instance Deku.Attribute.Attr everything RefY Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "refY", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ RefY String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "refY", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Symbol_ RefY String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "refY", value: _ } <<< Deku.Attribute.prop'
