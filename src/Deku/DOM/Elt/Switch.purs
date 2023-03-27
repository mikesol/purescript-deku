module Deku.DOM.Elt.Switch where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Switch_

switch
  :: Event (Attribute Switch_)
  -> Array Domable
  -> Domable
switch attributes kids = Domable
  ( Element'
      ( DC.elementify "switch" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

switch_
  :: Array Domable
  -> Domable
switch_ = switch empty

switch__
  :: String
  -> Domable
switch__ t = switch_ [ DC.text_ t ]
