module Deku.DOM.Elt.Use where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Use_

use
  :: Event (Attribute Use_)
  -> Array Domable
  -> Domable
use attributes kids = Domable
  ( Element'
      ( DC.elementify "use" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

use_
  :: Array Domable
  -> Domable
use_ = use empty

use__
  :: String
  -> Domable
use__ t = use_ [ DC.text_ t ]
