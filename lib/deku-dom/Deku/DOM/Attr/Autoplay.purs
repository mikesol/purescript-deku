module Deku.DOM.Attr.Autoplay where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)

data Autoplay = Autoplay

instance Deku.Attribute.Attr everything Autoplay Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "autoplay", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Autoplay String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autoplay", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Autoplay String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autoplay", value: _ } <<< Deku.Attribute.prop'
