module Deku.DOM.Elt.Body where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Body_

body
  :: Event (Attribute Body_)
  -> Array Domable
  -> Domable
body attributes kids = Domable
  ( Element'
      ( DC.elementify "body" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

body_
  :: Array Domable
  -> Domable
body_ = body empty

body__
  :: String
  -> Domable
body__ t = body_ [ DC.text_ t ]
