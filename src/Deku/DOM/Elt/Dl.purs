module Deku.DOM.Elt.Dl where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dl_

dl
  :: forall payload
   . Event (Attribute Dl_)
  -> Array (Domable payload)
  -> Domable payload
dl attributes kids = Domable
  ( Element'
      ( DC.elementify "dl" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dl_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dl_ = dl empty

dl__
  :: forall payload
   . String
  -> Domable payload
dl__ t = dl_ [ DC.text_ t ]
