module Deku.DOM.Elt.H5 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H5_

h5
  :: forall payload
   . Event (Attribute H5_)
  -> Array (Domable payload)
  -> Domable payload
h5 attributes kids = Domable
  ( Element'
      ( DC.elementify "h5" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h5_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
h5_ = h5 empty

h5__
  :: forall payload
   . String
  -> Domable payload
h5__ t = h5_ [ DC.text_ t ]
