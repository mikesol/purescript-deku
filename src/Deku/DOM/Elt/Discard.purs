module Deku.DOM.Elt.Discard where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Discard_

discard
  :: forall lock payload
   . Event (Attribute Discard_)
  -> Array (Domable lock payload)
  -> Domable lock payload
discard attributes kids = Domable
  ( Element'
      ( DC.elementify "discard" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

discard_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
discard_ = discard empty

discard__
  :: forall lock payload
   . String
  -> Domable lock payload
discard__ t = discard_ [ DC.text_ t ]
