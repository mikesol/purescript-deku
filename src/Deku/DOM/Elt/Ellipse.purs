module Deku.DOM.Elt.Ellipse where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ellipse_

ellipse
  :: Event (Attribute Ellipse_)
  -> Array Domable
  -> Domable
ellipse attributes kids = Domable
  ( Element'
      ( DC.elementify "ellipse" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ellipse_
  :: Array Domable
  -> Domable
ellipse_ = ellipse empty

ellipse__
  :: String
  -> Domable
ellipse__ t = ellipse_ [ DC.text_ t ]
