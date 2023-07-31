module Deku.DOM.Attr.Blocking where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Style (Style_)

data Blocking = Blocking

instance Deku.Attribute.Attr everything Blocking Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "blocking", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Blocking String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "blocking", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Script_ Blocking String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "blocking", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Style_ Blocking String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "blocking", value: _ } <<< Deku.Attribute.prop'
