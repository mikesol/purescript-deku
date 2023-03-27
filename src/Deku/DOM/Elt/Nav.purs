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
  :: forall payload
   . Event (Attribute Nav_)
  -> Array (Domable payload)
  -> Domable payload
nav attributes kids = Domable
  ( Element'
      ( DC.elementify "nav" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

nav_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
nav_ = nav empty

nav__
  :: forall payload
   . String
  -> Domable payload
nav__ t = nav_ [ DC.text_ t ]
