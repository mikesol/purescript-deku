module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Link_

link
  :: Event (Attribute Link_)
  -> Array Domable
  -> Domable
link = DC.elementify2 "link"

link_
  :: Array Domable
  -> Domable
link_ = link empty

link__
  :: String
  -> Domable
link__ t = link_ [ DC.text_ t ]
