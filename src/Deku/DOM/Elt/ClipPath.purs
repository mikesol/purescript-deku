module Deku.DOM.Elt.ClipPath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data ClipPath_

clipPath
  :: Event (Attribute ClipPath_)
  -> Array Domable
  -> Domable
clipPath attributes kids = Domable
  ( Element'
      ( DC.elementify "clipPath" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

clipPath_
  :: Array Domable
  -> Domable
clipPath_ = clipPath empty

clipPath__
  :: String
  -> Domable
clipPath__ t = clipPath_ [ DC.text_ t ]
