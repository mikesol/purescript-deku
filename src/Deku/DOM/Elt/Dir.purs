module Deku.DOM.Elt.Dir where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dir_

dir
  :: forall payload
   . Event (Attribute Dir_)
  -> Array (Domable payload)
  -> Domable payload
dir attributes kids = Domable
  ( Element'
      ( DC.elementify "dir" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dir_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dir_ = dir empty

dir__
  :: forall payload
   . String
  -> Domable payload
dir__ t = dir_ [ DC.text_ t ]
