module Deku.DOM.Elt.Ul where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ul_

ul
  :: Event (Attribute Ul_)
  -> Array Domable
  -> Domable
ul attributes kids = Domable
  ( Element'
      ( DC.elementify "ul" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ul_
  :: Array Domable
  -> Domable
ul_ = ul empty

ul__
  :: String
  -> Domable
ul__ t = ul_ [ DC.text_ t ]
