module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

title
  :: Array (Event (Attribute Tags.Title_))
  -> Array Nut
  -> Nut
title = DC.elementify3 "title"

title_
  :: Array Nut
  -> Nut
title_ = title empty

title__
  :: String
  -> Nut
title__ t = title_ [ DC.text_ t ]
