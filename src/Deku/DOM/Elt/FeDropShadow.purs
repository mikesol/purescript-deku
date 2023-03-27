module Deku.DOM.Elt.FeDropShadow where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDropShadow_

feDropShadow
  :: forall payload
   . Event (Attribute FeDropShadow_)
  -> Array (Domable payload)
  -> Domable payload
feDropShadow attributes kids = Domable
  ( Element'
      ( DC.elementify "feDropShadow" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDropShadow_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feDropShadow_ = feDropShadow empty

feDropShadow__
  :: forall payload
   . String
  -> Domable payload
feDropShadow__ t = feDropShadow_ [ DC.text_ t ]
