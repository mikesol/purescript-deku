module Deku.DOM.Elt.Rect where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rect_

rect
  :: forall lock payload
   . Event (Attribute Rect_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rect attributes kids = Domable
  ( Element'
      ( elementify "rect" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rect_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rect_ = rect empty
