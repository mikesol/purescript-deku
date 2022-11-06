module Deku.DOM.Elt.FeFuncR where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncR_

feFuncR
  :: forall lock payload
   . Event (Attribute FeFuncR_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feFuncR attributes kids = Domable
  ( Element'
      ( elementify "feFuncR" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncR_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feFuncR_ = feFuncR empty
