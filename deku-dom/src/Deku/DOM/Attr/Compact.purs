module Deku.DOM.Attr.Compact where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Dl (Dl_)
import Deku.DOM.Elt.Menu (Menu_)
import Deku.DOM.Elt.Ol (Ol_)
import Deku.DOM.Elt.Ul (Ul_)

data Compact = Compact

instance Deku.Attribute.Attr everything Compact Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "compact", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Dl_ Compact String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Menu_ Compact String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ol_ Compact String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ul_ Compact String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "compact", value: _ } <<< Deku.Attribute.prop'
