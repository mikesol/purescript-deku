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
  :: forall lock payload
   . Event (Attribute Summary_)
  -> Array (Domable lock payload)
  -> Domable lock payload
summary attributes kids = Domable
  ( Element'
      ( DC.elementify "summary" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

summary_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
summary_ = summary empty

summary__
  :: forall lock payload
   . String
  -> Domable lock payload
summary__ t = summary_ [ DC.text_ t ]
