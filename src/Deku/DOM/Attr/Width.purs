module Deku.DOM.Attr.Width where
import Deku.DOM.Elt.Canvas(Canvas_)
import Deku.DOM.Elt.Embed(Embed_)
import Deku.DOM.Elt.Iframe(Iframe_)
import Deku.DOM.Elt.Img(Img_)
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Object(Object_)
import Deku.DOM.Elt.Video(Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Width = Width
instance Attr Canvas_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Embed_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Iframe_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Img_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Input_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Object_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }

instance Attr Video_ Width String where
  attr Width value = unsafeAttribute { key: "width", value: prop' value }
