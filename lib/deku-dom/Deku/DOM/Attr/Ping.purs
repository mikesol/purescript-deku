module Deku.DOM.Attr.Ping where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)

data Ping = Ping

instance Deku.Attribute.Attr everything Ping Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ping", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr A_ Ping String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ping", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Area_ Ping String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ping", value: _ } <<< Deku.Attribute.prop'
