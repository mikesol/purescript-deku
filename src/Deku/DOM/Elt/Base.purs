module Deku.DOM.Elt.Base where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Base_

base
  :: Event (Attribute Base_)
  -> Array Domable
  -> Domable
base attributes kids = Domable
  ( Element'
      ( DC.elementify "base" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

base_
  :: Array Domable
  -> Domable
base_ = base empty

base__
  :: String
  -> Domable
base__ t = base_ [ DC.text_ t ]
