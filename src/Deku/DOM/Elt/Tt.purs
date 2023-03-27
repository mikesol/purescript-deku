module Deku.DOM.Elt.Tt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tt_

tt
  :: forall payload
   . Event (Attribute Tt_)
  -> Array (Domable payload)
  -> Domable payload
tt attributes kids = Domable
  ( Element'
      ( DC.elementify "tt" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tt_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
tt_ = tt empty

tt__
  :: forall payload
   . String
  -> Domable payload
tt__ t = tt_ [ DC.text_ t ]
