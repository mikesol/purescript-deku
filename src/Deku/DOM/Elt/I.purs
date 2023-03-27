module Deku.DOM.Elt.I where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data I_

i
  :: forall payload
   . Event (Attribute I_)
  -> Array (Domable payload)
  -> Domable payload
i attributes kids = Domable
  ( Element'
      ( DC.elementify "i" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

i_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
i_ = i empty

i__
  :: forall payload
   . String
  -> Domable payload
i__ t = i_ [ DC.text_ t ]
