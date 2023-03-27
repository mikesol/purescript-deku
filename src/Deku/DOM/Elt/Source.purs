module Deku.DOM.Elt.Source where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Source_

source
  :: Event (Attribute Source_)
  -> Array Domable
  -> Domable
source attributes kids = Domable
  ( Element'
      ( DC.elementify "source" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

source_
  :: Array Domable
  -> Domable
source_ = source empty

source__
  :: String
  -> Domable
source__ t = source_ [ DC.text_ t ]
