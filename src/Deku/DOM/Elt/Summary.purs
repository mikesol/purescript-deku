module Deku.DOM.Elt.Summary where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Summary_

summary
  :: Event (Attribute Summary_)
  -> Array Domable
  -> Domable
summary attributes kids = Domable
  ( Element'
      ( DC.elementify "summary" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

summary_
  :: Array Domable
  -> Domable
summary_ = summary empty

summary__
  :: String
  -> Domable
summary__ t = summary_ [ DC.text_ t ]
