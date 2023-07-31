module Deku.DOM.Attr.AriaBusy where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaBusy = AriaBusy

instance Deku.Attribute.Attr everything AriaBusy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-busy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaBusy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-busy", value: _ } <<<
    Deku.Attribute.prop'
