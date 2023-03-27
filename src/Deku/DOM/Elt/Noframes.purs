module Deku.DOM.Elt.Noframes where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Noframes_

noframes
  :: Event (Attribute Noframes_)
  -> Array Domable
  -> Domable
noframes attributes kids = Domable
  ( Element'
      ( DC.elementify "noframes" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

noframes_
  :: Array Domable
  -> Domable
noframes_ = noframes empty

noframes__
  :: String
  -> Domable
noframes__ t = noframes_ [ DC.text_ t ]
