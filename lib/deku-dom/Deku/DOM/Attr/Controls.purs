module Deku.DOM.Attr.Controls where

import Prelude

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Controls = Controls

instance Attr Audio_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr Video_ Controls String where
  attr Controls value = unsafeAttribute { key: "controls", value: prop' value }

instance Attr everything Controls Unit where
  attr Controls _ = unsafeAttribute
    { key: "controls", value: unset' }
