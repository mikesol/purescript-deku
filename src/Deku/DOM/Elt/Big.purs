module Deku.DOM.Elt.Big where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Big_

big
  :: forall payload
   . Event (Attribute Big_)
  -> Array (Domable payload)
  -> Domable payload
big attributes kids = Domable
  ( Element'
      ( DC.elementify "big" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

big_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
big_ = big empty

big__
  :: forall payload
   . String
  -> Domable payload
big__ t = big_ [ DC.text_ t ]
