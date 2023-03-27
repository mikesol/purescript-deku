module Deku.DOM.Elt.Br where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Br_

br
  :: Event (Attribute Br_)
  -> Array Domable
  -> Domable
br attributes kids = Domable
  ( Element'
      ( DC.elementify "br" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

br_
  :: Array Domable
  -> Domable
br_ = br empty

br__
  :: String
  -> Domable
br__ t = br_ [ DC.text_ t ]
