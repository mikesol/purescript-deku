module Deku.DOM.Elt.FeOffset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeOffset_

feOffset
  :: forall lock payload
   . Event (Attribute FeOffset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feOffset attributes kids = Domable
  ( Element'
      ( DC.elementify "feOffset" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feOffset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feOffset_ = feOffset empty

feOffset__
  :: forall lock payload
   . String
  -> Domable lock payload
feOffset__ t = feOffset_ [ DC.text_ t ]
