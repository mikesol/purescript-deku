module Deku.DOM.Attr.Charset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Script (Script_)

data Charset = Charset

instance Deku.Attribute.Attr everything Charset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "charset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Charset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charset", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Meta_ Charset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charset", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Charset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charset", value: _ } <<< Deku.Attribute.prop'
