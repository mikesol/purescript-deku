module Deku.DOM.Elt.Th where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Th_

th
  :: forall lock payload
   . Event (Attribute Th_)
  -> Array (Domable lock payload)
  -> Domable lock payload
th attributes kids = Domable
  ( Element'
      ( DC.elementify "th" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

th_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
th_ = th empty


th__
  :: forall lock payload
   . String
  -> Domable lock payload
th__ t = th_ [ DC.text_ t ]
