module Deku.DOM.Elt.Tfoot where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tfoot_

tfoot
  :: Event (Attribute Tfoot_)
  -> Array Domable
  -> Domable
tfoot attributes kids = Domable
  ( Element'
      ( DC.elementify "tfoot" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tfoot_
  :: Array Domable
  -> Domable
tfoot_ = tfoot empty

tfoot__
  :: String
  -> Domable
tfoot__ t = tfoot_ [ DC.text_ t ]
