module Deku.DOM.Elt.FeDiffuseLighting where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDiffuseLighting_

feDiffuseLighting
  :: Event (Attribute FeDiffuseLighting_)
  -> Array Domable
  -> Domable
feDiffuseLighting attributes kids = Domable
  ( Element'
      ( DC.elementify "feDiffuseLighting" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDiffuseLighting_
  :: Array Domable
  -> Domable
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: String
  -> Domable
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text_ t ]
