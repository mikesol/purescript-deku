module Deku.DOM.Elt.Li where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Li_

li
  :: Event (Attribute Li_)
  -> Array Domable
  -> Domable
li attributes kids = Domable
  ( Element'
      ( DC.elementify "li" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

li_
  :: Array Domable
  -> Domable
li_ = li empty

li__
  :: String
  -> Domable
li__ t = li_ [ DC.text_ t ]
