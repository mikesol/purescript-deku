module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Link_

link
  :: Array (Event (Attribute Link_))
  -> Array Nut
  -> Nut
link = DC.elementify2 "link"

link_
  :: Array Nut
  -> Nut
link_ = link empty

link__
  :: String
  -> Nut
link__ t = link_ [ DC.text_ t ]
