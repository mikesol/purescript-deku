module Deku.DOM.Elt.Figure where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Figure_

figure
  :: Event (Attribute Figure_)
  -> Array Domable
  -> Domable
figure attributes kids = Domable
  ( Element'
      ( DC.elementify "figure" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

figure_
  :: Array Domable
  -> Domable
figure_ = figure empty

figure__
  :: String
  -> Domable
figure__ t = figure_ [ DC.text_ t ]
