module Deku.DOM.Elt.Metadata where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Metadata_

metadata
  :: Event (Attribute Metadata_)
  -> Array Domable
  -> Domable
metadata attributes kids = Domable
  ( Element'
      ( DC.elementify "metadata" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

metadata_
  :: Array Domable
  -> Domable
metadata_ = metadata empty

metadata__
  :: String
  -> Domable
metadata__ t = metadata_ [ DC.text_ t ]
