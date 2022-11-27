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
  :: forall lock payload
   . Event (Attribute ForeignObject_)
  -> Array (Domable lock payload)
  -> Domable lock payload
foreignObject attributes kids = Domable
  ( Element'
      ( DC.elementify "foreignObject" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

foreignObject_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
foreignObject_ = foreignObject empty

foreignObject__
  :: forall lock payload
   . String
  -> Domable lock payload
foreignObject__ t = foreignObject_ [ DC.text_ t ]
