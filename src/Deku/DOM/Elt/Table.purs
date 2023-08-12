module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Table_

table
  :: Array (Event (Attribute Table_))
  -> Array Nut
  -> Nut
table = DC.elementify2 "table"

table_
  :: Array Nut
  -> Nut
table_ = table empty

table__
  :: String
  -> Nut
table__ t = table_ [ DC.text_ t ]
