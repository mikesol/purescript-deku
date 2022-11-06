module Deku.DOM.Elt.Ellipse where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ellipse_

ellipse
  :: forall lock payload
   . Event (Attribute Ellipse_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ellipse attributes kids = Domable
  ( Element'
      ( elementify "ellipse" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ellipse_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ellipse_ = ellipse empty
