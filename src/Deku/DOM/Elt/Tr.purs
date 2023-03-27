module Deku.DOM.Elt.Tr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tr_

tr
  :: forall payload
   . Event (Attribute Tr_)
  -> Array (Domable payload)
  -> Domable payload
tr attributes kids = Domable
  ( Element'
      ( DC.elementify "tr" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tr_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
tr_ = tr empty

tr__
  :: forall payload
   . String
  -> Domable payload
tr__ t = tr_ [ DC.text_ t ]
