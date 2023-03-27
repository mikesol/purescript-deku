module Deku.DOM.Elt.Thead where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Thead_

thead
  :: forall payload
   . Event (Attribute Thead_)
  -> Array (Domable payload)
  -> Domable payload
thead attributes kids = Domable
  ( Element'
      ( DC.elementify "thead" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

thead_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
thead_ = thead empty

thead__
  :: forall payload
   . String
  -> Domable payload
thead__ t = thead_ [ DC.text_ t ]
