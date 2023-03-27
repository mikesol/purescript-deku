module Deku.DOM.Elt.Abbr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Abbr_

abbr
  :: forall payload
   . Event (Attribute Abbr_)
  -> Array (Domable payload)
  -> Domable payload
abbr attributes kids = Domable
  ( Element'
      ( DC.elementify "abbr" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

abbr_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
abbr_ = abbr empty

abbr__
  :: forall payload
   . String
  -> Domable payload
abbr__ t = abbr_ [ DC.text_ t ]
