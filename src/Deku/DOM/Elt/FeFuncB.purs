module Deku.DOM.Elt.FeFuncB where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncB_

feFuncB
  :: forall lock payload
   . Event (Attribute FeFuncB_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feFuncB attributes kids = Domable
  ( Element'
      ( elementify "feFuncB" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncB_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feFuncB_ = feFuncB empty
