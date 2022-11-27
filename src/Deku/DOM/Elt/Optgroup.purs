module Deku.DOM.Elt.Optgroup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Optgroup_

optgroup
  :: forall lock payload
   . Event (Attribute Optgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
optgroup attributes kids = Domable
  ( Element'
      ( DC.elementify "optgroup" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

optgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
optgroup_ = optgroup empty

optgroup__
  :: forall lock payload
   . String
  -> Domable lock payload
optgroup__ t = optgroup_ [ DC.text_ t ]
