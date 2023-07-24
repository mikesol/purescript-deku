module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Blockquote_

blockquote :: Array (FRP.Event.Event (Deku.Attribute.Attribute Blockquote_)) -> Array Nut -> Nut
blockquote = DC.elementify2 "blockquote"

blockquote_ :: Array Nut -> Nut
blockquote_ = blockquote empty

blockquote__ :: String -> Nut
blockquote__ t = blockquote_ [ DC.text_ t ]
