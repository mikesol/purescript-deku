module Deku.DOM.Elt.Link where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

link
  :: Array (Attribute Tags.Link_)
  -> Array Nut
  -> Nut
link = DC.elementify3 "link"

link_
  :: Array Nut
  -> Nut
link_ = link empty

link__
  :: String
  -> Nut
link__ t = link_ [ DC.text_ t ]
