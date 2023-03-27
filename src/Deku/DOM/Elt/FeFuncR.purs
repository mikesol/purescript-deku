module Deku.DOM.Elt.FeFuncR where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncR_

feFuncR
  :: forall payload
   . Event (Attribute FeFuncR_)
  -> Array (Domable payload)
  -> Domable payload
feFuncR attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncR" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncR_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feFuncR_ = feFuncR empty

feFuncR__
  :: forall payload
   . String
  -> Domable payload
feFuncR__ t = feFuncR_ [ DC.text_ t ]
