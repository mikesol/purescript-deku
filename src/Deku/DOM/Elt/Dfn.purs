module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dfn_

dfn
  :: Event (Attribute Dfn_)
  -> Array Domable
  -> Domable
dfn = DC.elementify2 "dfn"

dfn_
  :: Array Domable
  -> Domable
dfn_ = dfn empty

dfn__
  :: String
  -> Domable
dfn__ t = dfn_ [ DC.text_ t ]
