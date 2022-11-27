module Deku.DOM.Elt.FeDisplacementMap where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeDisplacementMap_

feDisplacementMap
  :: forall lock payload
   . Event (Attribute FeDisplacementMap_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feDisplacementMap attributes kids = Domable
  ( Element'
      ( DC.elementify "feDisplacementMap" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feDisplacementMap_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feDisplacementMap_ = feDisplacementMap empty

feDisplacementMap__
  :: forall lock payload
   . String
  -> Domable lock payload
feDisplacementMap__ t = feDisplacementMap_ [ DC.text_ t ]
