module Deku.DOM.Attr.Popovertarget where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Popovertarget = Popovertarget

instance Deku.Attribute.Attr everything Popovertarget Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "popovertarget", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Popovertarget String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "popovertarget", value: _ } <<<
    Deku.Attribute.prop'
