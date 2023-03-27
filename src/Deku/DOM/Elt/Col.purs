module Deku.DOM.Elt.Col where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Col_

col
  :: forall payload
   . Event (Attribute Col_)
  -> Array (Domable payload)
  -> Domable payload
col attributes kids = Domable
  ( Element'
      ( DC.elementify "col" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

col_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
col_ = col empty

col__
  :: forall payload
   . String
  -> Domable payload
col__ t = col_ [ DC.text_ t ]
