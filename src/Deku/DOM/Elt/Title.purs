module Deku.DOM.Elt.Title where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Title_

title
  :: Event (Attribute Title_)
  -> Array Domable
  -> Domable
title = DC.elementify2 "title"

title_
  :: Array Domable
  -> Domable
title_ = title empty

title__
  :: String
  -> Domable
title__ t = title_ [ DC.text_ t ]
