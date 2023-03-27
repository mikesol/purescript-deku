module Deku.DOM.Elt.Script where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Script_

script
  :: Event (Attribute Script_)
  -> Array Domable
  -> Domable
script attributes kids = Domable
  ( Element'
      ( DC.elementify "script" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

script_
  :: Array Domable
  -> Domable
script_ = script empty

script__
  :: String
  -> Domable
script__ t = script_ [ DC.text_ t ]
