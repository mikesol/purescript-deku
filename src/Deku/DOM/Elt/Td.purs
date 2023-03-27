module Deku.DOM.Elt.Td where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Td_

td
  :: Event (Attribute Td_)
  -> Array Domable
  -> Domable
td attributes kids = Domable
  ( Element'
      ( DC.elementify "td" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

td_
  :: Array Domable
  -> Domable
td_ = td empty

td__
  :: String
  -> Domable
td__ t = td_ [ DC.text_ t ]
