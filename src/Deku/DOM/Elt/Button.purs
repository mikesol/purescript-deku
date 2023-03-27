module Deku.DOM.Elt.Button where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Button_

button
  :: Event (Attribute Button_)
  -> Array Domable
  -> Domable
button attributes kids = Domable
  ( Element'
      ( DC.elementify "button" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

button_
  :: Array Domable
  -> Domable
button_ = button empty

button__
  :: String
  -> Domable
button__ t = button_ [ DC.text_ t ]
