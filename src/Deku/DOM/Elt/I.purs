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
  :: Event (Attribute I_)
  -> Array Domable
  -> Domable
i attributes kids = Domable
  ( Element'
      ( DC.elementify "i" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

i_
  :: Array Domable
  -> Domable
i_ = i empty

i__
  :: String
  -> Domable
i__ t = i_ [ DC.text_ t ]
