module Deku.DOM.Elt.Defs where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Defs_

defs
  :: forall lock payload
   . Event (Attribute Defs_)
  -> Array (Domable lock payload)
  -> Domable lock payload
defs attributes kids = Domable
  ( Element'
      ( elementify "defs" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

defs_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
defs_ = defs empty
