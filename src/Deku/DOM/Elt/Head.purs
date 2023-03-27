module Deku.DOM.Elt.Head where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Head_

head
  :: forall payload
   . Event (Attribute Head_)
  -> Array (Domable payload)
  -> Domable payload
head attributes kids = Domable
  ( Element'
      ( DC.elementify "head" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

head_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
head_ = head empty

head__
  :: forall payload
   . String
  -> Domable payload
head__ t = head_ [ DC.text_ t ]
