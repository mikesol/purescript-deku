module Deku.DOM.Elt.FeOffset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeOffset_

feOffset
  :: Event (Attribute FeOffset_)
  -> Array Domable
  -> Domable
feOffset attributes kids = Domable
  ( Element'
      ( DC.elementify "feOffset" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feOffset_
  :: Array Domable
  -> Domable
feOffset_ = feOffset empty

feOffset__
  :: String
  -> Domable
feOffset__ t = feOffset_ [ DC.text_ t ]
