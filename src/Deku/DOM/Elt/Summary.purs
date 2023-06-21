module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

summary
  :: Array (Attribute Tags.Summary_)
  -> Array Nut
  -> Nut
summary = DC.elementify3 "summary"

summary_
  :: Array Nut
  -> Nut
summary_ = summary empty

summary__
  :: String
  -> Nut
summary__ t = summary_ [ DC.text_ t ]
