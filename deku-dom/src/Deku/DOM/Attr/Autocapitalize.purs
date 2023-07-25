module Deku.DOM.Attr.Autocapitalize where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Autocapitalize = Autocapitalize

instance Deku.Attribute.Attr everything Autocapitalize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "autocapitalize", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Autocapitalize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autocapitalize", value: _ } <<<
    Deku.Attribute.prop'
