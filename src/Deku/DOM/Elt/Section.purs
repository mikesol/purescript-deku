module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

section
  :: Array (Attribute Tags.Section_)
  -> Array Nut
  -> Nut
section = DC.elementify3 "section"

section_
  :: Array Nut
  -> Nut
section_ = section empty

section__
  :: String
  -> Nut
section__ t = section_ [ DC.text_ t ]
