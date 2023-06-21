module Deku.DOM.Elt.Nav where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

nav
  :: Array (Attribute Tags.Nav_)
  -> Array Nut
  -> Nut
nav = DC.elementify3 "nav"

nav_
  :: Array Nut
  -> Nut
nav_ = nav empty

nav__
  :: String
  -> Nut
nav__ t = nav_ [ DC.text_ t ]
