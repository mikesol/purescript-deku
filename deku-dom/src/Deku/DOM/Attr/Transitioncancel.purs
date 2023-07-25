module Deku.DOM.Attr.Transitioncancel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Transitioncancel = Transitioncancel

instance Deku.Attribute.Attr everything Transitioncancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "transitioncancel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Transitioncancel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitioncancel", value: _ } <<<
    Deku.Attribute.prop'
