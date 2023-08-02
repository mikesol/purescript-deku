module Deku.DOM.Elt.Figcaption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Figcaption_

figcaption
  :: Array (Attribute Figcaption_)
  -> Array Nut
  -> Nut
figcaption = DC.elementify2 "figcaption"

figcaption_
  :: Array Nut
  -> Nut
figcaption_ = figcaption empty

figcaption__
  :: String
  -> Nut
figcaption__ t = figcaption_ [ DC.text t ]
