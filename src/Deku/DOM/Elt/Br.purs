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
  :: forall payload
   . Event (Attribute Br_)
  -> Array (Domable payload)
  -> Domable payload
br attributes kids = Domable
  ( Element'
      ( DC.elementify "br" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

br_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
br_ = br empty

br__
  :: forall payload
   . String
  -> Domable payload
br__ t = br_ [ DC.text_ t ]
