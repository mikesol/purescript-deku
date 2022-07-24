module Deku.DOM.Attr.Crossorigin where

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Crossorigin = Crossorigin

instance Attr Audio_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin String where
  attr Crossorigin value = unsafeAttribute
    { key: "crossorigin", value: prop' value }
