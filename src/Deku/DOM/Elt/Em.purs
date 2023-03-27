module Deku.DOM.Elt.Em where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Em_

em
  :: Event (Attribute Em_)
  -> Array Domable
  -> Domable
em attributes kids = Domable
  ( Element'
      ( DC.elementify "em" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

em_
  :: Array Domable
  -> Domable
em_ = em empty

em__
  :: String
  -> Domable
em__ t = em_ [ DC.text_ t ]
