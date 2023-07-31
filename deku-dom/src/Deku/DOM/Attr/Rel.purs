module Deku.DOM.Attr.Rel where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Link (Link_)

data Rel = Rel

instance Deku.Attribute.Attr everything Rel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Rel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rel", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Rel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rel", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Form_ Rel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rel", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Link_ Rel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rel", value: _ } <<< Deku.Attribute.prop'
