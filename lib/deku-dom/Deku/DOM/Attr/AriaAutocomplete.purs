module Deku.DOM.Attr.AriaAutocomplete where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaAutocomplete = AriaAutocomplete

instance Deku.Attribute.Attr everything AriaAutocomplete Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-autocomplete", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaAutocomplete String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-autocomplete", value: _ } <<<
    Deku.Attribute.prop'
