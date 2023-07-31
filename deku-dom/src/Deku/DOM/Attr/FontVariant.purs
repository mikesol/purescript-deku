module Deku.DOM.Attr.FontVariant where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data FontVariant = FontVariant

instance Deku.Attribute.Attr everything FontVariant Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "font-variant", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ FontVariant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-variant", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ FontVariant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-variant", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ FontVariant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "font-variant", value: _ } <<<
    Deku.Attribute.prop'
