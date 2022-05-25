module Deku.DOM.Attr.Preload where

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Preload = Preload

instance Attr Audio_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }

instance Attr Video_ Preload String where
  attr Preload value = unsafeAttribute { key: "preload", value: prop' value }
