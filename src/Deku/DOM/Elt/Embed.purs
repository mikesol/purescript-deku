module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Embed_

embed
  :: Event (Attribute Embed_)
  -> Array Domable
  -> Domable
embed = DC.elementify2 "embed"

embed_
  :: Array Domable
  -> Domable
embed_ = embed empty

embed__
  :: String
  -> Domable
embed__ t = embed_ [ DC.text_ t ]
