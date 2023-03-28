module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Table_

table
  :: Event (Attribute Table_)
  -> Array Domable
  -> Domable
table = DC.elementify2 "table"

table_
  :: Array Domable
  -> Domable
table_ = table empty

table__
  :: String
  -> Domable
table__ t = table_ [ DC.text_ t ]
