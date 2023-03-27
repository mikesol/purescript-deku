module Deku.DOM.Elt.Applet where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Applet_

applet
  :: Event (Attribute Applet_)
  -> Array Domable
  -> Domable
applet attributes kids = Domable
  ( Element'
      ( DC.elementify "applet" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

applet_
  :: Array Domable
  -> Domable
applet_ = applet empty

applet__
  :: String
  -> Domable
applet__ t = applet_ [ DC.text_ t ]
