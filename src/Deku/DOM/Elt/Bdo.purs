module Deku.DOM.Elt.Bdo where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Bdo_

bdo
  :: Event (Attribute Bdo_)
  -> Array Domable
  -> Domable
bdo attributes kids = Domable
  ( Element'
      ( DC.elementify "bdo" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

bdo_
  :: Array Domable
  -> Domable
bdo_ = bdo empty

bdo__
  :: String
  -> Domable
bdo__ t = bdo_ [ DC.text_ t ]
