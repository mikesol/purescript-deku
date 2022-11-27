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
  :: forall lock payload
   . Event (Attribute FeMerge_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feMerge attributes kids = Domable
  ( Element'
      ( DC.elementify "feMerge" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMerge_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feMerge_ = feMerge empty

feMerge__
  :: forall lock payload
   . String
  -> Domable lock payload
feMerge__ t = feMerge_ [ DC.text_ t ]
