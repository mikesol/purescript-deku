module Deku.DOM.Elt.FeFuncG where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeFuncG_

feFuncG
  :: Event (Attribute FeFuncG_)
  -> Array Domable
  -> Domable
feFuncG attributes kids = Domable
  ( Element'
      ( DC.elementify "feFuncG" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feFuncG_
  :: Array Domable
  -> Domable
feFuncG_ = feFuncG empty

feFuncG__
  :: String
  -> Domable
feFuncG__ t = feFuncG_ [ DC.text_ t ]
