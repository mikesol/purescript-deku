module Deku.DOM.Elt.View where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data View_

view
  :: forall payload
   . Event (Attribute View_)
  -> Array (Domable payload)
  -> Domable payload
view attributes kids = Domable
  ( Element'
      ( DC.elementify "view" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

view_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
view_ = view empty

view__
  :: forall payload
   . String
  -> Domable payload
view__ t = view_ [ DC.text_ t ]
