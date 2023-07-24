module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Nav_

nav :: Array (FRP.Event.Event (Deku.Attribute.Attribute Nav_)) -> Array Nut -> Nut
nav = DC.elementify2 "nav"

nav_ :: Array Nut -> Nut
nav_ = nav empty

nav__ :: String -> Nut
nav__ t = nav_ [ DC.text_ t ]
