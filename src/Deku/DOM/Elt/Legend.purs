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
  :: forall payload
   . Event (Attribute Legend_)
  -> Array (Domable payload)
  -> Domable payload
legend attributes kids = Domable
  ( Element'
      ( DC.elementify "legend" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

legend_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
legend_ = legend empty

legend__
  :: forall payload
   . String
  -> Domable payload
legend__ t = legend_ [ DC.text_ t ]
