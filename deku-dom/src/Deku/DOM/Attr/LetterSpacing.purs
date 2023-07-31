module Deku.DOM.Attr.LetterSpacing where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)

data LetterSpacing = LetterSpacing

instance Deku.Attribute.Attr everything LetterSpacing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "letter-spacing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Text_ LetterSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "letter-spacing", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ LetterSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "letter-spacing", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ LetterSpacing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "letter-spacing", value: _ } <<<
    Deku.Attribute.prop'
