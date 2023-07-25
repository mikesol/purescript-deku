module Deku.DOM.Attr.Loop where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Marquee (Marquee_)
import Deku.DOM.Elt.Video (Video_)

data Loop = Loop

instance Deku.Attribute.Attr everything Loop Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loop", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Audio_ Loop String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loop", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Marquee_ Loop String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loop", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Video_ Loop String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loop", value: _ } <<< Deku.Attribute.prop'
