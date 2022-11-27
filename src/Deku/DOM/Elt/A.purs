module Deku.DOM.Elt.A where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data A_

a
  :: forall lock payload
   . Event (Attribute A_)
  -> Array (Domable lock payload)
  -> Domable lock payload
a attributes kids = Domable
  ( Element'
      ( DC.elementify "a" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

a_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
a_ = a empty

a__
  :: forall lock payload
   . String
  -> Domable lock payload
a__ t = a_ [ DC.text_ t ]
