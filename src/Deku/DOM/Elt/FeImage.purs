module Deku.DOM.Elt.FeImage where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeImage_

feImage
  :: forall payload
   . Event (Attribute FeImage_)
  -> Array (Domable payload)
  -> Domable payload
feImage attributes kids = Domable
  ( Element'
      ( DC.elementify "feImage" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feImage_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feImage_ = feImage empty

feImage__
  :: forall payload
   . String
  -> Domable payload
feImage__ t = feImage_ [ DC.text_ t ]
