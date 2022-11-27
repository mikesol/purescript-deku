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
  :: forall lock payload
   . Event (Attribute Script_)
  -> Array (Domable lock payload)
  -> Domable lock payload
script attributes kids = Domable
  ( Element'
      ( DC.elementify "script" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

script_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
script_ = script empty

script__
  :: forall lock payload
   . String
  -> Domable lock payload
script__ t = script_ [ DC.text_ t ]
