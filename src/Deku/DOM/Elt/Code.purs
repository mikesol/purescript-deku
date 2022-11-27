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
  :: forall lock payload
   . Event (Attribute Code_)
  -> Array (Domable lock payload)
  -> Domable lock payload
code attributes kids = Domable
  ( Element'
      ( DC.elementify "code" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

code_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
code_ = code empty

code__
  :: forall lock payload
   . String
  -> Domable lock payload
code__ t = code_ [ DC.text_ t ]
