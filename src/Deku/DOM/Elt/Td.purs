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
  :: forall payload
   . Event (Attribute Td_)
  -> Array (Domable payload)
  -> Domable payload
td attributes kids = Domable
  ( Element'
      ( DC.elementify "td" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

td_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
td_ = td empty

td__
  :: forall payload
   . String
  -> Domable payload
td__ t = td_ [ DC.text_ t ]
