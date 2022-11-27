module Deku.DOM.Elt.Dd where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dd_

dd
  :: forall lock payload
   . Event (Attribute Dd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dd attributes kids = Domable
  ( Element'
      ( DC.elementify "dd" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dd_ = dd empty

dd__
  :: forall lock payload
   . String
  -> Domable lock payload
dd__ t = dd_ [ DC.text_ t ]
