module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Span_

span
  :: Event (Attribute Span_)
  -> Array Domable
  -> Domable
span = DC.elementify2 "span"

span_
  :: Array Domable
  -> Domable
span_ = span empty

span__
  :: String
  -> Domable
span__ t = span_ [ DC.text_ t ]
