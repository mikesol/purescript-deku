module Deku.DOM.Elt.Nav where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Nav_

nav
  :: Event (Attribute Nav_)
  -> Array Domable
  -> Domable
nav attributes kids = Domable
  ( Element'
      ( DC.elementify "nav" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

nav_
  :: Array Domable
  -> Domable
nav_ = nav empty

nav__
  :: String
  -> Domable
nav__ t = nav_ [ DC.text_ t ]
