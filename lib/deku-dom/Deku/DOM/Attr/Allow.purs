module Deku.DOM.Attr.Allow where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Iframe (Iframe_)

data Allow = Allow

instance Deku.Attribute.Attr everything Allow Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "allow", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Iframe_ Allow String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "allow", value: _ } <<< Deku.Attribute.prop'
