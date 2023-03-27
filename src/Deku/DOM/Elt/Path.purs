module Deku.DOM.Elt.Path where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Path_

path
  :: Event (Attribute Path_)
  -> Array Domable
  -> Domable
path attributes kids = Domable
  ( Element'
      ( DC.elementify "path" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

path_
  :: Array Domable
  -> Domable
path_ = path empty

path__
  :: String
  -> Domable
path__ t = path_ [ DC.text_ t ]
