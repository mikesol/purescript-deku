module Deku.DOM.Attr.Popovertargetaction where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Popovertargetaction = Popovertargetaction

instance Deku.Attribute.Attr everything Popovertargetaction Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "popovertargetaction", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Popovertargetaction String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "popovertargetaction", value: _ } <<<
    Deku.Attribute.prop'
