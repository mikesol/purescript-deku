module Deku.DOM.Elt.Metadata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Metadata_

metadata
  :: Event (Attribute Metadata_)
  -> Array Domable
  -> Domable
metadata = DC.elementify2 "metadata"

metadata_
  :: Array Domable
  -> Domable
metadata_ = metadata empty

metadata__
  :: String
  -> Domable
metadata__ t = metadata_ [ DC.text_ t ]
