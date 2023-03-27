module Deku.DOM.Elt.Polygon where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Polygon_

polygon
  :: Event (Attribute Polygon_)
  -> Array Domable
  -> Domable
polygon attributes kids = Domable
  ( Element'
      ( DC.elementify "polygon" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

polygon_
  :: Array Domable
  -> Domable
polygon_ = polygon empty

polygon__
  :: String
  -> Domable
polygon__ t = polygon_ [ DC.text_ t ]
