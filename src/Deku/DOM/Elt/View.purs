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
  :: forall lock payload
   . Event (Attribute View_)
  -> Array (Domable lock payload)
  -> Domable lock payload
view attributes kids = Domable
  ( Element'
      ( DC.elementify "view" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

view_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
view_ = view empty

view__
  :: forall lock payload
   . String
  -> Domable lock payload
view__ t = view_ [ DC.text_ t ]
