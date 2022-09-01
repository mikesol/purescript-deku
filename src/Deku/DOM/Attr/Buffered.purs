module Deku.DOM.Attr.Buffered where
import Deku.DOM.Elt.Audio(Audio_)
import Deku.DOM.Elt.Video(Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Buffered = Buffered
instance Attr Audio_ Buffered String where
  attr Buffered value = unsafeAttribute { key: "buffered", value: prop' value }

instance Attr Video_ Buffered String where
  attr Buffered value = unsafeAttribute { key: "buffered", value: prop' value }
