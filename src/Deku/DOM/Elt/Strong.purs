module Deku.DOM.Elt.Strong where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Strong_

strong
  :: Event (Attribute Strong_)
  -> Array Domable
  -> Domable
strong attributes kids = Domable
  ( Element'
      ( DC.elementify "strong" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strong_
  :: Array Domable
  -> Domable
strong_ = strong empty

strong__
  :: String
  -> Domable
strong__ t = strong_ [ DC.text_ t ]
