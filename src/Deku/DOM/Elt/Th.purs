module Deku.DOM.Elt.Th where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Th_

th
  :: Event (Attribute Th_)
  -> Array Domable
  -> Domable
th attributes kids = Domable
  ( Element'
      ( DC.elementify "th" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

th_
  :: Array Domable
  -> Domable
th_ = th empty

th__
  :: String
  -> Domable
th__ t = th_ [ DC.text_ t ]
