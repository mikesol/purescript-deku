module Deku.DOM.Elt.Sup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Sup_

sup
  :: Event (Attribute Sup_)
  -> Array Domable
  -> Domable
sup attributes kids = Domable
  ( Element'
      ( DC.elementify "sup" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sup_
  :: Array Domable
  -> Domable
sup_ = sup empty

sup__
  :: String
  -> Domable
sup__ t = sup_ [ DC.text_ t ]
