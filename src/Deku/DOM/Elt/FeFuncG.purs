module Deku.DOM.Elt.FeFuncG where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncG_

feFuncG
  :: forall lock payload
   . Event (Attribute FeFuncG_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feFuncG attributes kids = Domable
  ( Element'
      ( elementify "feFuncG" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncG_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feFuncG_ = feFuncG empty
