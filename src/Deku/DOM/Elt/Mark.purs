module Deku.DOM.Elt.Mark where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Mark_

mark
  :: Event (Attribute Mark_)
  -> Array Domable
  -> Domable
mark attributes kids = Domable
  ( Element'
      ( DC.elementify "mark" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mark_
  :: Array Domable
  -> Domable
mark_ = mark empty

mark__
  :: String
  -> Domable
mark__ t = mark_ [ DC.text_ t ]
