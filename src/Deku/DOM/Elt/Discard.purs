module Deku.DOM.Elt.Discard where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Discard_

discard
  :: forall payload
   . Event (Attribute Discard_)
  -> Array (Domable payload)
  -> Domable payload
discard attributes kids = Domable
  ( Element'
      ( DC.elementify "discard" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

discard_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
discard_ = discard empty

discard__
  :: forall payload
   . String
  -> Domable payload
discard__ t = discard_ [ DC.text_ t ]
