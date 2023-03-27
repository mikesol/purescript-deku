module Deku.DOM.Elt.FeTurbulence where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeTurbulence_

feTurbulence
  :: forall payload
   . Event (Attribute FeTurbulence_)
  -> Array (Domable payload)
  -> Domable payload
feTurbulence attributes kids = Domable
  ( Element'
      ( DC.elementify "feTurbulence" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feTurbulence_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: forall payload
   . String
  -> Domable payload
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
