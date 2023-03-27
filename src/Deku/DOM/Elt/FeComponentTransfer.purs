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
  :: Event (Attribute FeComponentTransfer_)
  -> Array Domable
  -> Domable
feComponentTransfer attributes kids = Domable
  ( Element'
      ( DC.elementify "feComponentTransfer" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComponentTransfer_
  :: Array Domable
  -> Domable
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: String
  -> Domable
feComponentTransfer__ t = feComponentTransfer_ [ DC.text_ t ]
