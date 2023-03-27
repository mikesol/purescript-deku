module Deku.DOM.Elt.Line where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Line_

line
  :: Event (Attribute Line_)
  -> Array Domable
  -> Domable
line attributes kids = Domable
  ( Element'
      ( DC.elementify "line" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

line_
  :: Array Domable
  -> Domable
line_ = line empty

line__
  :: String
  -> Domable
line__ t = line_ [ DC.text_ t ]
