module Deku.DOM.Elt.Bdo where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Bdo_

bdo
  :: forall payload
   . Event (Attribute Bdo_)
  -> Array (Domable payload)
  -> Domable payload
bdo attributes kids = Domable
  ( Element'
      ( DC.elementify "bdo" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

bdo_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
bdo_ = bdo empty

bdo__
  :: forall payload
   . String
  -> Domable payload
bdo__ t = bdo_ [ DC.text_ t ]
