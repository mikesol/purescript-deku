module Deku.DOM.Elt.FeImage where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeImage_

feImage
  :: forall lock payload
   . Event (Attribute FeImage_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feImage attributes kids = Domable
  ( Element'
      ( elementify "feImage" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feImage_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feImage_ = feImage empty
