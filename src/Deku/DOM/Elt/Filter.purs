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
  :: forall payload
   . Event (Attribute Filter_)
  -> Array (Domable payload)
  -> Domable payload
filter attributes kids = Domable
  ( Element'
      ( DC.elementify "filter" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

filter_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
filter_ = filter empty

filter__
  :: forall payload
   . String
  -> Domable payload
filter__ t = filter_ [ DC.text_ t ]
