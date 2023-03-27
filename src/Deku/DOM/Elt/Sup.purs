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
  :: forall payload
   . Event (Attribute Sup_)
  -> Array (Domable payload)
  -> Domable payload
sup attributes kids = Domable
  ( Element'
      ( DC.elementify "sup" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sup_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
sup_ = sup empty

sup__
  :: forall payload
   . String
  -> Domable payload
sup__ t = sup_ [ DC.text_ t ]
