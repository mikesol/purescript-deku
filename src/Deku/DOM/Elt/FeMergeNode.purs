module Deku.DOM.Elt.FeMergeNode where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMergeNode_

feMergeNode
  :: forall lock payload
   . Event (Attribute FeMergeNode_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feMergeNode attributes kids = Domable
  ( Element'
      ( elementify "feMergeNode" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMergeNode_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feMergeNode_ = feMergeNode empty
