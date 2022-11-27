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
  :: forall lock payload
   . Event (Attribute Cite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
cite attributes kids = Domable
  ( Element'
      ( DC.elementify "cite" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

cite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
cite_ = cite empty

cite__
  :: forall lock payload
   . String
  -> Domable lock payload
cite__ t = cite_ [ DC.text_ t ]
