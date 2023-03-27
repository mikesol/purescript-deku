module Deku.DOM.Elt.FeBlend where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeBlend_

feBlend
  :: Event (Attribute FeBlend_)
  -> Array Domable
  -> Domable
feBlend attributes kids = Domable
  ( Element'
      ( DC.elementify "feBlend" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feBlend_
  :: Array Domable
  -> Domable
feBlend_ = feBlend empty

feBlend__
  :: String
  -> Domable
feBlend__ t = feBlend_ [ DC.text_ t ]
