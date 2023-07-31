module Deku.DOM.Attr.Truespeed where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marquee (Marquee_)

data Truespeed = Truespeed

instance Deku.Attribute.Attr everything Truespeed Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "truespeed", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marquee_ Truespeed String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "truespeed", value: _ } <<<
    Deku.Attribute.prop'
