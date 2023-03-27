module Deku.DOM.Elt.Cite where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Cite_

cite
  :: forall payload
   . Event (Attribute Cite_)
  -> Array (Domable payload)
  -> Domable payload
cite attributes kids = Domable
  ( Element'
      ( DC.elementify "cite" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

cite_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
cite_ = cite empty

cite__
  :: forall payload
   . String
  -> Domable payload
cite__ t = cite_ [ DC.text_ t ]
