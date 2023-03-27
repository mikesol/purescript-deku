module Deku.DOM.Elt.Wbr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Wbr_

wbr
  :: forall payload
   . Event (Attribute Wbr_)
  -> Array (Domable payload)
  -> Domable payload
wbr attributes kids = Domable
  ( Element'
      ( DC.elementify "wbr" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

wbr_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
wbr_ = wbr empty

wbr__
  :: forall payload
   . String
  -> Domable payload
wbr__ t = wbr_ [ DC.text_ t ]
