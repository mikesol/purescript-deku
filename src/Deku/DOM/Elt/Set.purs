module Deku.DOM.Elt.Set where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Set_

set
  :: Event (Attribute Set_)
  -> Array Domable
  -> Domable
set attributes kids = Domable
  ( Element'
      ( DC.elementify "set" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

set_
  :: Array Domable
  -> Domable
set_ = set empty

set__
  :: String
  -> Domable
set__ t = set_ [ DC.text_ t ]
