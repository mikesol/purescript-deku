module Deku.DOM.Elt.ForeignObject where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data ForeignObject_

foreignObject
  :: Event (Attribute ForeignObject_)
  -> Array Domable
  -> Domable
foreignObject attributes kids = Domable
  ( Element'
      ( DC.elementify "foreignObject" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

foreignObject_
  :: Array Domable
  -> Domable
foreignObject_ = foreignObject empty

foreignObject__
  :: String
  -> Domable
foreignObject__ t = foreignObject_ [ DC.text_ t ]
