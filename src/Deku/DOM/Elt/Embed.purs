module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Embed_

embed
  :: Array (Poll (Attribute Embed_))
  -> Array Nut
  -> Nut
embed = DC.elementify2 "embed"

embed_
  :: Array Nut
  -> Nut
embed_ = embed empty

embed__
  :: String
  -> Nut
embed__ t = embed_ [ DC.text t ]
