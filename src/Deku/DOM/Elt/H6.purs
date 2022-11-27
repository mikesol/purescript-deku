module Deku.DOM.Elt.H6 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H6_

h6
  :: forall lock payload
   . Event (Attribute H6_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h6 attributes kids = Domable
  ( Element'
      ( DC.elementify "h6" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h6_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h6_ = h6 empty

h6__
  :: forall lock payload
   . String
  -> Domable lock payload
h6__ t = h6_ [ DC.text_ t ]
