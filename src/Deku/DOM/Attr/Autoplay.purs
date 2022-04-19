module Deku.DOM.Attr.Autoplay where
import Deku.DOM.Elt.Audio(Audio_)
import Deku.DOM.Elt.Video(Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Autoplay = Autoplay
instance Attr Audio_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }

instance Attr Video_ Autoplay String where
  attr Autoplay value = unsafeAttribute { key: "autoplay", value: prop' value }
