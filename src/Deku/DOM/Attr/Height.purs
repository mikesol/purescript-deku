module Deku.DOM.Attr.Height where

import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Height = Height

instance Attr Canvas_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Embed_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Iframe_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Img_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Input_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Object_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }

instance Attr Video_ Height String where
  attr Height value = unsafeAttribute { key: "height", value: prop' value }
