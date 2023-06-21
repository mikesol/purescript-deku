module Deku.DOM.Elt.Iframe where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

iframe
  :: Array (Event (Attribute Tags.Iframe_))
  -> Array Nut
  -> Nut
iframe = DC.elementify3 "iframe"

iframe_
  :: Array Nut
  -> Nut
iframe_ = iframe empty

iframe__
  :: String
  -> Nut
iframe__ t = iframe_ [ DC.text_ t ]
