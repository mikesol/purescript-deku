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
  :: Event (Attribute FeTurbulence_)
  -> Array Domable
  -> Domable
feTurbulence attributes kids = Domable
  ( Element'
      ( DC.elementify "feTurbulence" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feTurbulence_
  :: Array Domable
  -> Domable
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: String
  -> Domable
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
