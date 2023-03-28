module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Select_

select
  :: Event (Attribute Select_)
  -> Array Domable
  -> Domable
select = DC.elementify2 "select"

select_
  :: Array Domable
  -> Domable
select_ = select empty

select__
  :: String
  -> Domable
select__ t = select_ [ DC.text_ t ]
