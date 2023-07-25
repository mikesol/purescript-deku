module Deku.DOM.Attr.Bgcolor where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)

data Bgcolor = Bgcolor

instance Deku.Attribute.Attr everything Bgcolor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "bgcolor", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Bgcolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Table_ Bgcolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Bgcolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Bgcolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Bgcolor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "bgcolor", value: _ } <<< Deku.Attribute.prop'
