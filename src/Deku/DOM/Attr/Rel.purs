module Deku.DOM.Attr.Rel where

import Prelude

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rel = Rel

instance Attr A_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Area_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Link_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr everything Rel Unit where
  attr Rel _ = unsafeAttribute
    { key: "rel", value: unset' }
