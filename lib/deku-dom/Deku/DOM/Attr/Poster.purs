module Deku.DOM.Attr.Poster where

import Prelude

import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Poster = Poster

instance Attr Video_ Poster String where
  attr Poster value = unsafeAttribute { key: "poster", value: prop' value }

instance Attr everything Poster Unit where
  attr Poster _ = unsafeAttribute
    { key: "poster", value: unset' }
