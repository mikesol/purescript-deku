module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Nav_

nav
  :: Event (Attribute Nav_)
  -> Array Domable
  -> Domable
nav = DC.elementify2 "nav"

nav_
  :: Array Domable
  -> Domable
nav_ = nav empty

nav__
  :: String
  -> Domable
nav__ t = nav_ [ DC.text_ t ]
