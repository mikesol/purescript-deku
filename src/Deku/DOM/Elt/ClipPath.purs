module Deku.DOM.Elt.ClipPath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data ClipPath_

clipPath
  :: forall lock payload
   . Event (Attribute ClipPath_)
  -> Array (Domable lock payload)
  -> Domable lock payload
clipPath attributes kids = Domable
  ( Element'
      ( elementify "clipPath" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

clipPath_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
clipPath_ = clipPath empty
