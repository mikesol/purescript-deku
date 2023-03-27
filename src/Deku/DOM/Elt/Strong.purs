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
  :: forall payload
   . Event (Attribute Strong_)
  -> Array (Domable payload)
  -> Domable payload
strong attributes kids = Domable
  ( Element'
      ( DC.elementify "strong" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strong_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
strong_ = strong empty

strong__
  :: forall payload
   . String
  -> Domable payload
strong__ t = strong_ [ DC.text_ t ]
