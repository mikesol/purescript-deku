module Deku.DOM.Elt.Tt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tt_

tt
  :: Event (Attribute Tt_)
  -> Array Domable
  -> Domable
tt attributes kids = Domable
  ( Element'
      ( DC.elementify "tt" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tt_
  :: Array Domable
  -> Domable
tt_ = tt empty

tt__
  :: String
  -> Domable
tt__ t = tt_ [ DC.text_ t ]
