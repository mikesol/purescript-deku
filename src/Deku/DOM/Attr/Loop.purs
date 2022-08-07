module Deku.DOM.Attr.Loop where

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Loop = Loop

instance Attr Audio_ Loop String where
  attr Loop value = unsafeAttribute { key: "loop", value: prop' value }

instance Attr Video_ Loop String where
  attr Loop value = unsafeAttribute { key: "loop", value: prop' value }
