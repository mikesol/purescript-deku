module Deku.DOM.Elt.H3 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H3_

h3
  :: forall lock payload
   . Event (Attribute H3_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h3 attributes kids = Domable
  ( Element'
      ( elementify "h3" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h3_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h3_ = h3 empty

