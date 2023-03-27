module Deku.DOM.Elt.Svg where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Svg_

svg
  :: Event (Attribute Svg_)
  -> Array Domable
  -> Domable
svg attributes kids = Domable
  ( Element'
      ( DC.elementify "svg" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

svg_
  :: Array Domable
  -> Domable
svg_ = svg empty

svg__
  :: String
  -> Domable
svg__ t = svg_ [ DC.text_ t ]
