module Deku.DOM.Attr.Hreflang where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)

data Hreflang = Hreflang

instance Deku.Attribute.Attr everything Hreflang Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "hreflang", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Hreflang String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hreflang", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Hreflang String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hreflang", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Hreflang String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "hreflang", value: _ } <<< Deku.Attribute.prop'
