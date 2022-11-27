module Deku.DOM.Elt.G where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data G_

g
  :: forall lock payload
   . Event (Attribute G_)
  -> Array (Domable lock payload)
  -> Domable lock payload
g attributes kids = Domable
  ( Element'
      ( DC.elementify "g" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

g_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
g_ = g empty

g__
  :: forall lock payload
   . String
  -> Domable lock payload
g__ t = g_ [ DC.text_ t ]
