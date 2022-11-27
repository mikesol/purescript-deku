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
  :: forall lock payload
   . Event (Attribute Bdo_)
  -> Array (Domable lock payload)
  -> Domable lock payload
bdo attributes kids = Domable
  ( Element'
      ( DC.elementify "bdo" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

bdo_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
bdo_ = bdo empty


bdo__
  :: forall lock payload
   . String
  -> Domable lock payload
bdo__ t = bdo_ [ DC.text_ t ]
