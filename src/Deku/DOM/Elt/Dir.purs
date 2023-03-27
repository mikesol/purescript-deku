module Deku.DOM.Elt.Dir where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dir_

dir
  :: Event (Attribute Dir_)
  -> Array Domable
  -> Domable
dir attributes kids = Domable
  ( Element'
      ( DC.elementify "dir" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dir_
  :: Array Domable
  -> Domable
dir_ = dir empty

dir__
  :: String
  -> Domable
dir__ t = dir_ [ DC.text_ t ]
