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
  :: Event (Attribute Rect_)
  -> Array Domable
  -> Domable
rect attributes kids = Domable
  ( Element'
      ( DC.elementify "rect" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

rect_
  :: Array Domable
  -> Domable
rect_ = rect empty

rect__
  :: String
  -> Domable
rect__ t = rect_ [ DC.text_ t ]
