module Deku.DOM.Elt.Use where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Use_

use
  :: forall lock payload
   . Event (Attribute Use_)
  -> Array (Domable lock payload)
  -> Domable lock payload
use attributes kids = Domable
  ( Element'
      ( DC.elementify "use" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

use_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
use_ = use empty

use__
  :: forall lock payload
   . String
  -> Domable lock payload
use__ t = use_ [ DC.text_ t ]
