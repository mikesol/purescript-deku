module Deku.DOM.Elt.Body where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Body_

body
  :: forall payload
   . Event (Attribute Body_)
  -> Array (Domable payload)
  -> Domable payload
body attributes kids = Domable
  ( Element'
      ( DC.elementify "body" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

body_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
body_ = body empty

body__
  :: forall payload
   . String
  -> Domable payload
body__ t = body_ [ DC.text_ t ]
