module Deku.DOM.Elt.H4 where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data H4_

h4
  :: forall lock payload
   . Event (Attribute H4_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h4 attributes kids = Domable
  ( Element'
      ( DC.elementify "h4" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

h4_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h4_ = h4 empty

h4__
  :: forall lock payload
   . String
  -> Domable lock payload
h4__ t = h4_ [ DC.text_ t ]
