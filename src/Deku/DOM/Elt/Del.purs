module Deku.DOM.Elt.Del where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Del_

del
  :: forall payload
   . Event (Attribute Del_)
  -> Array (Domable payload)
  -> Domable payload
del attributes kids = Domable
  ( Element'
      ( DC.elementify "del" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

del_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
del_ = del empty

del__
  :: forall payload
   . String
  -> Domable payload
del__ t = del_ [ DC.text_ t ]
