module Deku.DOM.Elt.Pattern where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Pattern_

pattern
  :: forall payload
   . Event (Attribute Pattern_)
  -> Array (Domable payload)
  -> Domable payload
pattern attributes kids = Domable
  ( Element'
      ( DC.elementify "pattern" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

pattern_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
pattern_ = pattern empty

pattern__
  :: forall payload
   . String
  -> Domable payload
pattern__ t = pattern_ [ DC.text_ t ]
