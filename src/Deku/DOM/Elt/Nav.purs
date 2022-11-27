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
  :: forall lock payload
   . Event (Attribute Nav_)
  -> Array (Domable lock payload)
  -> Domable lock payload
nav attributes kids = Domable
  ( Element'
      ( DC.elementify "nav" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

nav_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
nav_ = nav empty


nav__
  :: forall lock payload
   . String
  -> Domable lock payload
nav__ t = nav_ [ DC.text_ t ]
