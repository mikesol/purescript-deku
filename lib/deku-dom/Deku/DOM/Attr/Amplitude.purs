module Deku.DOM.Attr.Amplitude where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)

data Amplitude = Amplitude

instance Deku.Attribute.Attr everything Amplitude Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "amplitude", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ Amplitude String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "amplitude", value: _ } <<<
    Deku.Attribute.prop'
