module Deku.DOM.Elt.Progress where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Progress_

progress
  :: forall lock payload
   . Event (Attribute Progress_)
  -> Array (Domable lock payload)
  -> Domable lock payload
progress attributes kids = Domable
  ( Element'
      ( DC.elementify "progress" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

progress_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
progress_ = progress empty


progress__
  :: forall lock payload
   . String
  -> Domable lock payload
progress__ t = progress_ [ DC.text_ t ]
