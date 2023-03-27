module Deku.DOM.Elt.Label where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Label_

label
  :: Event (Attribute Label_)
  -> Array Domable
  -> Domable
label attributes kids = Domable
  ( Element'
      ( DC.elementify "label" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

label_
  :: Array Domable
  -> Domable
label_ = label empty

label__
  :: String
  -> Domable
label__ t = label_ [ DC.text_ t ]
