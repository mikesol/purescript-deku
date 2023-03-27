module Deku.DOM.Elt.Samp where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Samp_

samp
  :: Event (Attribute Samp_)
  -> Array Domable
  -> Domable
samp attributes kids = Domable
  ( Element'
      ( DC.elementify "samp" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

samp_
  :: Array Domable
  -> Domable
samp_ = samp empty

samp__
  :: String
  -> Domable
samp__ t = samp_ [ DC.text_ t ]
