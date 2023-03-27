module Deku.DOM.Elt.Textarea where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Textarea_

textarea
  :: forall payload
   . Event (Attribute Textarea_)
  -> Array (Domable payload)
  -> Domable payload
textarea attributes kids = Domable
  ( Element'
      ( DC.elementify "textarea" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

textarea_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
textarea_ = textarea empty

textarea__
  :: forall payload
   . String
  -> Domable payload
textarea__ t = textarea_ [ DC.text_ t ]
