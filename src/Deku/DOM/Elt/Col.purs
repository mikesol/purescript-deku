module Deku.DOM.Elt.Col where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Col_

col
  :: Event (Attribute Col_)
  -> Array Domable
  -> Domable
col attributes kids = Domable
  ( Element'
      ( DC.elementify "col" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

col_
  :: Array Domable
  -> Domable
col_ = col empty

col__
  :: String
  -> Domable
col__ t = col_ [ DC.text_ t ]
