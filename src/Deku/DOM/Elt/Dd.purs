module Deku.DOM.Elt.Dd where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dd_

dd
  :: forall payload
   . Event (Attribute Dd_)
  -> Array (Domable payload)
  -> Domable payload
dd attributes kids = Domable
  ( Element'
      ( DC.elementify "dd" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dd_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dd_ = dd empty

dd__
  :: forall payload
   . String
  -> Domable payload
dd__ t = dd_ [ DC.text_ t ]
