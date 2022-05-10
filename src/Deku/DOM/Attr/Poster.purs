module Deku.DOM.Attr.Poster where

import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Poster = Poster

instance Attr Video_ Poster String where
  attr Poster value = unsafeAttribute { key: "poster", value: prop' value }
