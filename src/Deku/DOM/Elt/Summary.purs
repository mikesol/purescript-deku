module Deku.DOM.Elt.Summary where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Summary_

summary
  :: forall payload
   . Event (Attribute Summary_)
  -> Array (Domable payload)
  -> Domable payload
summary attributes kids = Domable
  ( Element'
      ( DC.elementify "summary" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

summary_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
summary_ = summary empty

summary__
  :: forall payload
   . String
  -> Domable payload
summary__ t = summary_ [ DC.text_ t ]
