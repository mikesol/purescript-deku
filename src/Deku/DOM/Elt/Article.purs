module Deku.DOM.Elt.Article where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Article_

article
  :: Event (Attribute Article_)
  -> Array Domable
  -> Domable
article attributes kids = Domable
  ( Element'
      ( DC.elementify "article" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

article_
  :: Array Domable
  -> Domable
article_ = article empty

article__
  :: String
  -> Domable
article__ t = article_ [ DC.text_ t ]
