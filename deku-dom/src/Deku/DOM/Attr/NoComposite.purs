module Deku.DOM.Attr.NoComposite where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeBlend (FeBlend_)

data NoComposite = NoComposite

instance Deku.Attribute.Attr everything NoComposite Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "no-composite", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeBlend_ NoComposite String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "no-composite", value: _ } <<<
    Deku.Attribute.prop'
