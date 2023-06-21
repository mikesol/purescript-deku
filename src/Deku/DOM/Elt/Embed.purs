module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

embed
  :: Array (Attribute Tags.Embed_)
  -> Array Nut
  -> Nut
embed = DC.elementify3 "embed"

embed_
  :: Array Nut
  -> Nut
embed_ = embed empty

embed__
  :: String
  -> Nut
embed__ t = embed_ [ DC.text_ t ]
