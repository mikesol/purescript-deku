module Deku.DOM.Elt.FeTile where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeTile_

feTile
  :: Event (Attribute FeTile_)
  -> Array Domable
  -> Domable
feTile attributes kids = Domable
  ( Element'
      ( DC.elementify "feTile" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feTile_
  :: Array Domable
  -> Domable
feTile_ = feTile empty

feTile__
  :: String
  -> Domable
feTile__ t = feTile_ [ DC.text_ t ]
