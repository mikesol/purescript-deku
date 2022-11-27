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
  :: forall lock payload
   . Event (Attribute FeComponentTransfer_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feComponentTransfer attributes kids = Domable
  ( Element'
      ( DC.elementify "feComponentTransfer" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComponentTransfer_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: forall lock payload
   . String
  -> Domable lock payload
feComponentTransfer__ t = feComponentTransfer_ [ DC.text_ t ]
