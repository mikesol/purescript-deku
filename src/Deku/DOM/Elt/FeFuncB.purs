module Deku.DOM.Elt.FeFuncB where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncB_

feFuncB
  :: Event (Attribute FeFuncB_)
  -> Array Domable
  -> Domable
feFuncB attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncB" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncB_
  :: Array Domable
  -> Domable
feFuncB_ = feFuncB empty

feFuncB__
  :: String
  -> Domable
feFuncB__ t = feFuncB_ [ DC.text_ t ]
