module Deku.DOM.Attr.Allowfullscreen where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Iframe (Iframe_)

data Allowfullscreen = Allowfullscreen

instance Deku.Attribute.Attr everything Allowfullscreen Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "allowfullscreen", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Allowfullscreen String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "allowfullscreen", value: _ } <<<
    Deku.Attribute.prop'
