module Deku.DOM.Elt.Dl where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dl_

dl
  :: forall lock payload
   . Event (Attribute Dl_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dl attributes kids = Domable
  ( Element'
      ( elementify "dl" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dl_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dl_ = dl empty

