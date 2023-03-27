module Deku.DOM.Elt.Filter where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Filter_

filter
  :: Event (Attribute Filter_)
  -> Array Domable
  -> Domable
filter attributes kids = Domable
  ( Element'
      ( DC.elementify "filter" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

filter_
  :: Array Domable
  -> Domable
filter_ = filter empty

filter__
  :: String
  -> Domable
filter__ t = filter_ [ DC.text_ t ]
