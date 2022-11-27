module Deku.DOM.Elt.Strong where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Strong_

strong
  :: forall lock payload
   . Event (Attribute Strong_)
  -> Array (Domable lock payload)
  -> Domable lock payload
strong attributes kids = Domable
  ( Element'
      ( DC.elementify "strong" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

strong_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
strong_ = strong empty

strong__
  :: forall lock payload
   . String
  -> Domable lock payload
strong__ t = strong_ [ DC.text_ t ]
