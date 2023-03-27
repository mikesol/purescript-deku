module Deku.DOM.Elt.Strike where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Strike_

strike
  :: Event (Attribute Strike_)
  -> Array Domable
  -> Domable
strike attributes kids = Domable
  ( Element'
      ( DC.elementify "strike" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strike_
  :: Array Domable
  -> Domable
strike_ = strike empty

strike__
  :: String
  -> Domable
strike__ t = strike_ [ DC.text_ t ]
