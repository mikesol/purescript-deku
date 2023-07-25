module Deku.DOM.Attr.Srclang where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Track (Track_)

data Srclang = Srclang

instance Deku.Attribute.Attr everything Srclang Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "srclang", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Track_ Srclang String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "srclang", value: _ } <<< Deku.Attribute.prop'
