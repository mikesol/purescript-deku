module Deku.DOM.Elt.Basefont where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Basefont_

basefont
  :: forall payload
   . Event (Attribute Basefont_)
  -> Array (Domable payload)
  -> Domable payload
basefont attributes kids = Domable
  ( Element'
      ( DC.elementify "basefont" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

basefont_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
basefont_ = basefont empty

basefont__
  :: forall payload
   . String
  -> Domable payload
basefont__ t = basefont_ [ DC.text_ t ]
