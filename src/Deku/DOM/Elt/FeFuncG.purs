module Deku.DOM.Elt.FeFuncG where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncG_

feFuncG
  :: forall payload
   . Event (Attribute FeFuncG_)
  -> Array (Domable payload)
  -> Domable payload
feFuncG attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncG" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncG_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feFuncG_ = feFuncG empty

feFuncG__
  :: forall payload
   . String
  -> Domable payload
feFuncG__ t = feFuncG_ [ DC.text_ t ]
