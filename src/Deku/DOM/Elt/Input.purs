module Deku.DOM.Elt.Input where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Input_

input
  :: Event (Attribute Input_)
  -> Array Domable
  -> Domable
input attributes kids = Domable
  ( Element'
      ( DC.elementify "input" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

input_
  :: Array Domable
  -> Domable
input_ = input empty

input__
  :: String
  -> Domable
input__ t = input_ [ DC.text_ t ]
