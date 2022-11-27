module Deku.DOM.Elt.FeDistantLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDistantLight_

feDistantLight
  :: forall lock payload
   . Event (Attribute FeDistantLight_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feDistantLight attributes kids = Domable
  ( Element'
      ( DC.elementify "feDistantLight" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDistantLight_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: forall lock payload
   . String
  -> Domable lock payload
feDistantLight__ t = feDistantLight_ [ DC.text_ t ]
