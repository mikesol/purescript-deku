module Deku.DOM.Attr.Muted where
import Deku.DOM.Elt.Audio(Audio_)
import Deku.DOM.Elt.Video(Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Muted = Muted
instance Attr Audio_ Muted String where
  attr Muted value = unsafeAttribute { key: "muted", value: prop' value }

instance Attr Video_ Muted String where
  attr Muted value = unsafeAttribute { key: "muted", value: prop' value }
