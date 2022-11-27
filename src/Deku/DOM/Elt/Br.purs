module Deku.DOM.Elt.Br where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Br_

br
  :: forall lock payload
   . Event (Attribute Br_)
  -> Array (Domable lock payload)
  -> Domable lock payload
br attributes kids = Domable
  ( Element'
      ( DC.elementify "br" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

br_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
br_ = br empty

br__
  :: forall lock payload
   . String
  -> Domable lock payload
br__ t = br_ [ DC.text_ t ]
