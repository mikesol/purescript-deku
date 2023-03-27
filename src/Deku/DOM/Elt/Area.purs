module Deku.DOM.Elt.Area where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Area_

area
  :: Event (Attribute Area_)
  -> Array Domable
  -> Domable
area attributes kids = Domable
  ( Element'
      ( DC.elementify "area" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

area_
  :: Array Domable
  -> Domable
area_ = area empty

area__
  :: String
  -> Domable
area__ t = area_ [ DC.text_ t ]
