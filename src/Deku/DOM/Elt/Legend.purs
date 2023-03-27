module Deku.DOM.Elt.Legend where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Legend_

legend
  :: Event (Attribute Legend_)
  -> Array Domable
  -> Domable
legend attributes kids = Domable
  ( Element'
      ( DC.elementify "legend" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

legend_
  :: Array Domable
  -> Domable
legend_ = legend empty

legend__
  :: String
  -> Domable
legend__ t = legend_ [ DC.text_ t ]
