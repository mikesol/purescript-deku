module Deku.DOM.Elt.Path where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Path_

path
  :: forall payload
   . Event (Attribute Path_)
  -> Array (Domable payload)
  -> Domable payload
path attributes kids = Domable
  ( Element'
      ( DC.elementify "path" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

path_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
path_ = path empty

path__
  :: forall payload
   . String
  -> Domable payload
path__ t = path_ [ DC.text_ t ]
