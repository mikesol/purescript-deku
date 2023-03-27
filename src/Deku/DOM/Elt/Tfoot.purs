module Deku.DOM.Elt.Tfoot where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tfoot_

tfoot
  :: forall payload
   . Event (Attribute Tfoot_)
  -> Array (Domable payload)
  -> Domable payload
tfoot attributes kids = Domable
  ( Element'
      ( DC.elementify "tfoot" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tfoot_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
tfoot_ = tfoot empty

tfoot__
  :: forall payload
   . String
  -> Domable payload
tfoot__ t = tfoot_ [ DC.text_ t ]
