module Deku.DOM.Attr.TextDecoration where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data TextDecoration = TextDecoration

instance Deku.Attribute.Attr everything TextDecoration Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "text-decoration", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ TextDecoration String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text-decoration", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ TextDecoration String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text-decoration", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ TextDecoration String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "text-decoration", value: _ } <<<
    Deku.Attribute.prop'
