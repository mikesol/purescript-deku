module Deku.DOM.Elt.B where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data B_

b
  :: forall lock payload
   . Event (Attribute B_)
  -> Array (Domable lock payload)
  -> Domable lock payload
b attributes kids = Domable
  ( Element'
      ( DC.elementify "b" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

b_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
b_ = b empty


b__
  :: forall lock payload
   . String
  -> Domable lock payload
b__ t = b_ [ DC.text_ t ]
