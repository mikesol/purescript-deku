module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Iframe_

iframe
  :: Event (Attribute Iframe_)
  -> Array Domable
  -> Domable
iframe = DC.elementify2 "iframe"

iframe_
  :: Array Domable
  -> Domable
iframe_ = iframe empty

iframe__
  :: String
  -> Domable
iframe__ t = iframe_ [ DC.text_ t ]
