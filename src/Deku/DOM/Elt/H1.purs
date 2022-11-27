module Deku.DOM.Elt.H1 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H1_

h1
  :: forall lock payload
   . Event (Attribute H1_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h1 attributes kids = Domable
  ( Element'
      ( DC.elementify "h1" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h1_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h1_ = h1 empty


h1__
  :: forall lock payload
   . String
  -> Domable lock payload
h1__ t = h1_ [ DC.text_ t ]
