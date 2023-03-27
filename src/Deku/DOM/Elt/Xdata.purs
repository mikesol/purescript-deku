module Deku.DOM.Elt.Xdata where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Xdata_

xdata
  :: forall payload
   . Event (Attribute Xdata_)
  -> Array (Domable payload)
  -> Domable payload
xdata attributes kids = Domable
  ( Element'
      ( DC.elementify "data" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

xdata_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
xdata_ = xdata empty

xdata__
  :: forall payload
   . String
  -> Domable payload
xdata__ t = xdata_ [ DC.text_ t ]
