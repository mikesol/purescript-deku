module Deku.DOM.Elt.Mpath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Mpath_

mpath
  :: forall payload
   . Event (Attribute Mpath_)
  -> Array (Domable payload)
  -> Domable payload
mpath attributes kids = Domable
  ( Element'
      ( DC.elementify "mpath" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

mpath_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
mpath_ = mpath empty

mpath__
  :: forall payload
   . String
  -> Domable payload
mpath__ t = mpath_ [ DC.text_ t ]
