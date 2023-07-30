module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Blockquote_

blockquote
  :: Array (Attribute Blockquote_)
  -> Array Nut
  -> Nut
blockquote = DC.elementify2 "blockquote"

blockquote_
  :: Array Nut
  -> Nut
blockquote_ = blockquote empty

blockquote__
  :: String
  -> Nut
blockquote__ t = blockquote_ [ DC.text_ t ]
