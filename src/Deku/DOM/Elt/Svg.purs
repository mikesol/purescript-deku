module Deku.DOM.Elt.Svg where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Svg_

svg
  :: forall payload
   . Event (Attribute Svg_)
  -> Array (Domable payload)
  -> Domable payload
svg attributes kids = Domable
  ( Element'
      ( DC.elementify "svg" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

svg_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
svg_ = svg empty

svg__
  :: forall payload
   . String
  -> Domable payload
svg__ t = svg_ [ DC.text_ t ]
