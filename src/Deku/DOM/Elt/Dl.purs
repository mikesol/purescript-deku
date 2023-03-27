module Deku.DOM.Elt.Dl where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dl_

dl
  :: Event (Attribute Dl_)
  -> Array Domable
  -> Domable
dl attributes kids = Domable
  ( Element'
      ( DC.elementify "dl" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dl_
  :: Array Domable
  -> Domable
dl_ = dl empty

dl__
  :: String
  -> Domable
dl__ t = dl_ [ DC.text_ t ]
