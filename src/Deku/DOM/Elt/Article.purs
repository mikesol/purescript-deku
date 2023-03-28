module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Article_

article
  :: Event (Attribute Article_)
  -> Array Domable
  -> Domable
article = DC.elementify2 "article"

article_
  :: Array Domable
  -> Domable
article_ = article empty

article__
  :: String
  -> Domable
article__ t = article_ [ DC.text_ t ]
