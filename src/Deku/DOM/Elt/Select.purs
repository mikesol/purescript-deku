module Deku.DOM.Elt.Select where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

select
  :: Array (Event (Attribute Tags.Select_))
  -> Array Nut
  -> Nut
select = DC.elementify3 "select"

select_
  :: Array Nut
  -> Nut
select_ = select empty

select__
  :: String
  -> Nut
select__ t = select_ [ DC.text_ t ]
