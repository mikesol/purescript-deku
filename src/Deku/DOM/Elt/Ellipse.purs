module Deku.DOM.Elt.Ellipse where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ellipse_

ellipse
  :: forall payload
   . Event (Attribute Ellipse_)
  -> Array (Domable payload)
  -> Domable payload
ellipse attributes kids = Domable
  ( Element'
      ( DC.elementify "ellipse" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ellipse_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
ellipse_ = ellipse empty

ellipse__
  :: forall payload
   . String
  -> Domable payload
ellipse__ t = ellipse_ [ DC.text_ t ]
