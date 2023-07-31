module Deku.DOM.Attr.Profile where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Head (Head_)

data Profile = Profile

instance Deku.Attribute.Attr everything Profile Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "profile", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Head_ Profile String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "profile", value: _ } <<< Deku.Attribute.prop'
