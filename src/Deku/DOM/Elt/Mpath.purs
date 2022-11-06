module Deku.DOM.Elt.Mpath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Mpath_

mpath
  :: forall lock payload
   . Event (Attribute Mpath_)
  -> Array (Domable lock payload)
  -> Domable lock payload
mpath attributes kids = Domable
  ( Element'
      ( elementify "mpath" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mpath_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
mpath_ = mpath empty
