module Deku.DOM.Attr.Media where

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Media = Media

instance Attr A_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Area_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Link_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Source_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }

instance Attr Style_ Media String where
  attr Media value = unsafeAttribute { key: "media", value: prop' value }
