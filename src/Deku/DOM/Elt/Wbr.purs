module Deku.DOM.Elt.Wbr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Wbr_

wbr
  :: forall lock payload
   . Event (Attribute Wbr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
wbr attributes kids = Domable
  ( Element'
      ( elementify "wbr" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

wbr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
wbr_ = wbr empty

