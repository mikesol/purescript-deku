module Deku.DOM.Attr.Scrolling where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Iframe (Iframe_)

data Scrolling = Scrolling

instance Deku.Attribute.Attr everything Scrolling Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scrolling", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Scrolling String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scrolling", value: _ } <<<
    Deku.Attribute.prop'
