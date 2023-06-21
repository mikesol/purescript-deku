module Deku.DOM.Elt.Article where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

article
  :: Array (Attribute Tags.Article_)
  -> Array Nut
  -> Nut
article = DC.elementify3 "article"

article_
  :: Array Nut
  -> Nut
article_ = article empty

article__
  :: String
  -> Nut
article__ t = article_ [ DC.text_ t ]
