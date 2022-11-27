module Deku.DOM.Elt.Tr where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tr_

tr
  :: forall lock payload
   . Event (Attribute Tr_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tr attributes kids = Domable
  ( Element'
      ( DC.elementify "tr" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tr_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tr_ = tr empty

tr__
  :: forall lock payload
   . String
  -> Domable lock payload
tr__ t = tr_ [ DC.text_ t ]
