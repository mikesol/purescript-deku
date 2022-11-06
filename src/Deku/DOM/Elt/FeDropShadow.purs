module Deku.DOM.Elt.FeDropShadow where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDropShadow_

feDropShadow
  :: forall lock payload
   . Event (Attribute FeDropShadow_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feDropShadow attributes kids = Domable
  ( Element'
      ( elementify "feDropShadow" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDropShadow_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feDropShadow_ = feDropShadow empty
