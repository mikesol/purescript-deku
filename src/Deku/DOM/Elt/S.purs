module Deku.DOM.Elt.S where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data S_

s
  :: forall lock payload
   . Event (Attribute S_)
  -> Array (Domable lock payload)
  -> Domable lock payload
s attributes kids = Domable
  ( Element'
      ( DC.elementify "s" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

s_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
s_ = s empty

s__
  :: forall lock payload
   . String
  -> Domable lock payload
s__ t = s_ [ DC.text_ t ]
