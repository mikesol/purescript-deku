module Deku.DOM.Elt.Bdi where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Bdi_

bdi
  :: forall lock payload
   . Event (Attribute Bdi_)
  -> Array (Domable lock payload)
  -> Domable lock payload
bdi attributes kids = Domable
  ( Element'
      ( DC.elementify "bdi" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

bdi_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
bdi_ = bdi empty

bdi__
  :: forall lock payload
   . String
  -> Domable lock payload
bdi__ t = bdi_ [ DC.text_ t ]
