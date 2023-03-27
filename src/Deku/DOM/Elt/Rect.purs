module Deku.DOM.Elt.Rect where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Rect_

rect
  :: forall payload
   . Event (Attribute Rect_)
  -> Array (Domable payload)
  -> Domable payload
rect attributes kids = Domable
  ( Element'
      ( DC.elementify "rect" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rect_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
rect_ = rect empty

rect__
  :: forall payload
   . String
  -> Domable payload
rect__ t = rect_ [ DC.text_ t ]
