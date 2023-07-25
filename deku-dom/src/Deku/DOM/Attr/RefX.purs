module Deku.DOM.Attr.RefX where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Symbol (Symbol_)

data RefX = RefX

instance Deku.Attribute.Attr everything RefX Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "refX", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ RefX String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "refX", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Symbol_ RefX String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "refX", value: _ } <<< Deku.Attribute.prop'
