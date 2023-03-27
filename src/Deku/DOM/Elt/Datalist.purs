module Deku.DOM.Elt.Datalist where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Datalist_

datalist
  :: Event (Attribute Datalist_)
  -> Array Domable
  -> Domable
datalist attributes kids = Domable
  ( Element'
      ( DC.elementify "datalist" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

datalist_
  :: Array Domable
  -> Domable
datalist_ = datalist empty

datalist__
  :: String
  -> Domable
datalist__ t = datalist_ [ DC.text_ t ]
