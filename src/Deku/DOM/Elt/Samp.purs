module Deku.DOM.Elt.Samp where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Samp_

samp
  :: forall payload
   . Event (Attribute Samp_)
  -> Array (Domable payload)
  -> Domable payload
samp attributes kids = Domable
  ( Element'
      ( DC.elementify "samp" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

samp_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
samp_ = samp empty

samp__
  :: forall payload
   . String
  -> Domable payload
samp__ t = samp_ [ DC.text_ t ]
