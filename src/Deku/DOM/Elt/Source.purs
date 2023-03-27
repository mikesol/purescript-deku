module Deku.DOM.Elt.Source where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Source_

source
  :: forall payload
   . Event (Attribute Source_)
  -> Array (Domable payload)
  -> Domable payload
source attributes kids = Domable
  ( Element'
      ( DC.elementify "source" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

source_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
source_ = source empty

source__
  :: forall payload
   . String
  -> Domable payload
source__ t = source_ [ DC.text_ t ]
