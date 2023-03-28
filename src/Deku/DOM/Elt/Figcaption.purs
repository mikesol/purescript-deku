module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Figcaption_

figcaption
  :: Event (Attribute Figcaption_)
  -> Array Domable
  -> Domable
figcaption = DC.elementify2 "figcaption"

figcaption_
  :: Array Domable
  -> Domable
figcaption_ = figcaption empty

figcaption__
  :: String
  -> Domable
figcaption__ t = figcaption_ [ DC.text_ t ]
