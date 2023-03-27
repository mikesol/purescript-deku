module Deku.DOM.Elt.Bdi where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Bdi_

bdi
  :: Event (Attribute Bdi_)
  -> Array Domable
  -> Domable
bdi attributes kids = Domable
  ( Element'
      ( DC.elementify "bdi" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

bdi_
  :: Array Domable
  -> Domable
bdi_ = bdi empty

bdi__
  :: String
  -> Domable
bdi__ t = bdi_ [ DC.text_ t ]
