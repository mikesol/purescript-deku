module Deku.DOM.Elt.Div where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Div_

div
  :: forall payload
   . Event (Attribute Div_)
  -> Array (Domable payload)
  -> Domable payload
div attributes kids = Domable
  ( Element'
      ( DC.elementify "div" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

div_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
div_ = div empty

div__
  :: forall payload
   . String
  -> Domable payload
div__ t = div_ [ DC.text_ t ]
