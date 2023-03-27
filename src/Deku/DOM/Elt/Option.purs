module Deku.DOM.Elt.Option where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Option_

option
  :: forall payload
   . Event (Attribute Option_)
  -> Array (Domable payload)
  -> Domable payload
option attributes kids = Domable
  ( Element'
      ( DC.elementify "option" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

option_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
option_ = option empty

option__
  :: forall payload
   . String
  -> Domable payload
option__ t = option_ [ DC.text_ t ]
