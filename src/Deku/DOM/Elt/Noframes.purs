module Deku.DOM.Elt.Noframes where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Noframes_

noframes
  :: forall payload
   . Event (Attribute Noframes_)
  -> Array (Domable payload)
  -> Domable payload
noframes attributes kids = Domable
  ( Element'
      ( DC.elementify "noframes" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

noframes_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
noframes_ = noframes empty

noframes__
  :: forall payload
   . String
  -> Domable payload
noframes__ t = noframes_ [ DC.text_ t ]
