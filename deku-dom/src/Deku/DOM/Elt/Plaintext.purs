module Deku.DOM.Elt.Plaintext where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Plaintext_

plaintext :: Array (FRP.Event.Event (Deku.Attribute.Attribute Plaintext_)) -> Array Nut -> Nut
plaintext = DC.elementify2 "plaintext"

plaintext_ :: Array Nut -> Nut
plaintext_ = plaintext empty

plaintext__ :: String -> Nut
plaintext__ t = plaintext_ [ DC.text_ t ]
