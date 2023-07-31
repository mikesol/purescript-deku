module Deku.DOM.Attr.FontStyle where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontStyle = FontStyle

instance Deku.Attribute.Attr everything FontStyle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-style", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontStyle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-style", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontStyle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-style", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontStyle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-style", value: _ } <<<
    Deku.Attribute.prop'
