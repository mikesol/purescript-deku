module Deku.DOM.Elt.FeComponentTransfer where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeComponentTransfer_

feComponentTransfer
  :: forall payload
   . Event (Attribute FeComponentTransfer_)
  -> Array (Domable payload)
  -> Domable payload
feComponentTransfer attributes kids = Domable
  ( Element'
      ( DC.elementify "feComponentTransfer" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComponentTransfer_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: forall payload
   . String
  -> Domable payload
feComponentTransfer__ t = feComponentTransfer_ [ DC.text_ t ]
