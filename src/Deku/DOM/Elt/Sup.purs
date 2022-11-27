module Deku.DOM.Elt.Sup where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Sup_

sup
  :: forall lock payload
   . Event (Attribute Sup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
sup attributes kids = Domable
  ( Element'
      ( DC.elementify "sup" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
sup_ = sup empty


sup__
  :: forall lock payload
   . String
  -> Domable lock payload
sup__ t = sup_ [ DC.text_ t ]
