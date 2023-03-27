module Deku.DOM.Elt.Defs where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Defs_

defs
  :: forall payload
   . Event (Attribute Defs_)
  -> Array (Domable payload)
  -> Domable payload
defs attributes kids = Domable
  ( Element'
      ( DC.elementify "defs" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

defs_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
defs_ = defs empty

defs__
  :: forall payload
   . String
  -> Domable payload
defs__ t = defs_ [ DC.text_ t ]
