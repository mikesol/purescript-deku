module Deku.DOM.Elt.Span where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Span_

span :: Array (FRP.Event.Event (Deku.Attribute.Attribute Span_)) -> Array Nut -> Nut
span = DC.elementify2 "span"

span_ :: Array Nut -> Nut
span_ = span empty

span__ :: String -> Nut
span__ t = span_ [ DC.text_ t ]
