module Deku.DOM.Attr.Muted where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)

data Muted = Muted

instance Deku.Attribute.Attr everything Muted Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "muted", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Muted String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "muted", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Muted String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "muted", value: _ } <<< Deku.Attribute.prop'
