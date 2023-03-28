module Deku.DOM.Elt.Desc where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Desc_

desc
  :: Event (Attribute Desc_)
  -> Array Domable
  -> Domable
desc = DC.elementify2 "desc"

desc_
  :: Array Domable
  -> Domable
desc_ = desc empty

desc__
  :: String
  -> Domable
desc__ t = desc_ [ DC.text_ t ]
