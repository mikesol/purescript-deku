module Deku.DOM.Elt.FeFuncA where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncA_

feFuncA
  :: forall lock payload
   . Event (Attribute FeFuncA_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feFuncA attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncA" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncA_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feFuncA_ = feFuncA empty

feFuncA__
  :: forall lock payload
   . String
  -> Domable lock payload
feFuncA__ t = feFuncA_ [ DC.text_ t ]
