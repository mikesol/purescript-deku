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
  :: forall lock payload
   . Event (Attribute I_)
  -> Array (Domable lock payload)
  -> Domable lock payload
i attributes kids = Domable
  ( Element'
      ( DC.elementify "i" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

i_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
i_ = i empty

i__
  :: forall lock payload
   . String
  -> Domable lock payload
i__ t = i_ [ DC.text_ t ]
