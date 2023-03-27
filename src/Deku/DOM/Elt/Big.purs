module Deku.DOM.Elt.Big where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Big_

big
  :: Event (Attribute Big_)
  -> Array Domable
  -> Domable
big attributes kids = Domable
  ( Element'
      ( DC.elementify "big" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

big_
  :: Array Domable
  -> Domable
big_ = big empty

big__
  :: String
  -> Domable
big__ t = big_ [ DC.text_ t ]
