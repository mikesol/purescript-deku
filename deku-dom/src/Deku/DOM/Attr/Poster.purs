module Deku.DOM.Attr.Poster where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Video (Video_)

data Poster = Poster

instance Deku.Attribute.Attr everything Poster Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "poster", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Video_ Poster String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "poster", value: _ } <<< Deku.Attribute.prop'
