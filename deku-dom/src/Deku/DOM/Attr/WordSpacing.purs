module Deku.DOM.Attr.WordSpacing where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data WordSpacing = WordSpacing

instance Deku.Attribute.Attr everything WordSpacing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "word-spacing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ WordSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "word-spacing", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ WordSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "word-spacing", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ WordSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "word-spacing", value: _ } <<<
    Deku.Attribute.prop'
