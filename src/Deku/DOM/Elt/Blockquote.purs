module Deku.DOM.Elt.Blockquote where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Blockquote_

blockquote
  :: Event (Attribute Blockquote_)
  -> Array Domable
  -> Domable
blockquote = DC.elementify2 "blockquote"

blockquote_
  :: Array Domable
  -> Domable
blockquote_ = blockquote empty

blockquote__
  :: String
  -> Domable
blockquote__ t = blockquote_ [ DC.text_ t ]
