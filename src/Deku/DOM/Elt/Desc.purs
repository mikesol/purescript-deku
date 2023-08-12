module Deku.DOM.Elt.Desc where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Desc_

desc
  :: Array (Event (Attribute Desc_))
  -> Array Nut
  -> Nut
desc = DC.elementify2 "desc"

desc_
  :: Array Nut
  -> Nut
desc_ = desc empty

desc__
  :: String
  -> Nut
desc__ t = desc_ [ DC.text_ t ]
