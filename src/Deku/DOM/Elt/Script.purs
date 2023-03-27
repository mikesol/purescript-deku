module Deku.DOM.Elt.Script where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Script_

script
  :: forall payload
   . Event (Attribute Script_)
  -> Array (Domable payload)
  -> Domable payload
script attributes kids = Domable
  ( Element'
      ( DC.elementify "script" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

script_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
script_ = script empty

script__
  :: forall payload
   . String
  -> Domable payload
script__ t = script_ [ DC.text_ t ]
