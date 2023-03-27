module Deku.DOM.Elt.FeMerge where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMerge_

feMerge
  :: forall payload
   . Event (Attribute FeMerge_)
  -> Array (Domable payload)
  -> Domable payload
feMerge attributes kids = Domable
  ( Element'
      ( DC.elementify "feMerge" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMerge_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feMerge_ = feMerge empty

feMerge__
  :: forall payload
   . String
  -> Domable payload
feMerge__ t = feMerge_ [ DC.text_ t ]
