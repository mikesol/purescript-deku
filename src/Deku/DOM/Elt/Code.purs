module Deku.DOM.Elt.Code where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Code_

code
  :: forall payload
   . Event (Attribute Code_)
  -> Array (Domable payload)
  -> Domable payload
code attributes kids = Domable
  ( Element'
      ( DC.elementify "code" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

code_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
code_ = code empty

code__
  :: forall payload
   . String
  -> Domable payload
code__ t = code_ [ DC.text_ t ]
