module Deku.DOM.Attr.Accept where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)

data Accept = Accept

instance Deku.Attribute.Attr everything Accept Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "accept", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Form_ Accept String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "accept", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Accept String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "accept", value: _ } <<< Deku.Attribute.prop'
