module Deku.DOM.Elt.Thead where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Thead_

thead
  :: Event (Attribute Thead_)
  -> Array Domable
  -> Domable
thead attributes kids = Domable
  ( Element'
      ( DC.elementify "thead" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

thead_
  :: Array Domable
  -> Domable
thead_ = thead empty

thead__
  :: String
  -> Domable
thead__ t = thead_ [ DC.text_ t ]
