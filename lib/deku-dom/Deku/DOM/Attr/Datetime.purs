module Deku.DOM.Attr.Datetime where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)

data Datetime = Datetime

instance Deku.Attribute.Attr everything Datetime Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "datetime", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Del_ Datetime String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "datetime", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ins_ Datetime String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "datetime", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Time_ Datetime String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "datetime", value: _ } <<< Deku.Attribute.prop'
