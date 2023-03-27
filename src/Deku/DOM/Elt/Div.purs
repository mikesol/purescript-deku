module Deku.DOM.Elt.Div where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Div_

div
  :: Event (Attribute Div_)
  -> Array Domable
  -> Domable
div attributes kids = Domable
  ( Element'
      ( DC.elementify "div" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

div_
  :: Array Domable
  -> Domable
div_ = div empty

div__
  :: String
  -> Domable
div__ t = div_ [ DC.text_ t ]
