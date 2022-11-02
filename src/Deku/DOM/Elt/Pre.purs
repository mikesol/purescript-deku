module Deku.DOM.Elt.Pre where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Pre_

pre
  :: forall lock payload
   . Event (Attribute Pre_)
  -> Array (Domable lock payload)
  -> Domable lock payload
pre attributes kids = Domable
  ( Element'
      ( elementify "pre" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

pre_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
pre_ = pre empty

