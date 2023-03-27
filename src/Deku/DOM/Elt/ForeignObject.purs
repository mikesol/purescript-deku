module Deku.DOM.Elt.ForeignObject where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data ForeignObject_

foreignObject
  :: forall payload
   . Event (Attribute ForeignObject_)
  -> Array (Domable payload)
  -> Domable payload
foreignObject attributes kids = Domable
  ( Element'
      ( DC.elementify "foreignObject" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

foreignObject_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
foreignObject_ = foreignObject empty

foreignObject__
  :: forall payload
   . String
  -> Domable payload
foreignObject__ t = foreignObject_ [ DC.text_ t ]
