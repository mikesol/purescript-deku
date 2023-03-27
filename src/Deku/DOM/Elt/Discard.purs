module Deku.DOM.Elt.Discard where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Discard_

discard
  :: Event (Attribute Discard_)
  -> Array Domable
  -> Domable
discard attributes kids = Domable
  ( Element'
      ( DC.elementify "discard" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

discard_
  :: Array Domable
  -> Domable
discard_ = discard empty

discard__
  :: String
  -> Domable
discard__ t = discard_ [ DC.text_ t ]
