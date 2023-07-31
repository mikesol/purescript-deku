module Deku.DOM.Attr.Label where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Menu (Menu_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Track (Track_)

data Label = Label

instance Deku.Attribute.Attr everything Label Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "label", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Menu_ Label String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Optgroup_ Label String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Option_ Label String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Track_ Label String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "label", value: _ } <<< Deku.Attribute.prop'
