module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Iframe_

iframe
  :: Array (Attribute Iframe_)
  -> Array Nut
  -> Nut
iframe = DC.elementify2 "iframe"

iframe_
  :: Array Nut
  -> Nut
iframe_ = iframe empty

iframe__
  :: String
  -> Nut
iframe__ t = iframe_ [ DC.text_ t ]
