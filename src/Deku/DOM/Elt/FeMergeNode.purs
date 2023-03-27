module Deku.DOM.Elt.FeMergeNode where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeMergeNode_

feMergeNode
  :: forall payload
   . Event (Attribute FeMergeNode_)
  -> Array (Domable payload)
  -> Domable payload
feMergeNode attributes kids = Domable
  ( Element'
      ( DC.elementify "feMergeNode" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMergeNode_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feMergeNode_ = feMergeNode empty

feMergeNode__
  :: forall payload
   . String
  -> Domable payload
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
