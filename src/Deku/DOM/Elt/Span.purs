module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Span_

span
  :: Array (Attribute Span_)
  -> Array Nut
  -> Nut
span = DC.elementify2 "span"

span_
  :: Array Nut
  -> Nut
span_ = span empty

span__
  :: String
  -> Nut
span__ t = span_ [ DC.text_ t ]
