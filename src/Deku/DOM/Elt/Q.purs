module Deku.DOM.Elt.Q where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Q_

q
  :: Event (Attribute Q_)
  -> Array Domable
  -> Domable
q attributes kids = Domable
  ( Element'
      ( DC.elementify "q" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

q_
  :: Array Domable
  -> Domable
q_ = q empty

q__
  :: String
  -> Domable
q__ t = q_ [ DC.text_ t ]
