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
  :: Event (Attribute FeMergeNode_)
  -> Array Domable
  -> Domable
feMergeNode attributes kids = Domable
  ( Element'
      ( DC.elementify "feMergeNode" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feMergeNode_
  :: Array Domable
  -> Domable
feMergeNode_ = feMergeNode empty

feMergeNode__
  :: String
  -> Domable
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
