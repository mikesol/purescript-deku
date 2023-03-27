module Deku.DOM.Elt.Metadata where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Metadata_

metadata
  :: forall payload
   . Event (Attribute Metadata_)
  -> Array (Domable payload)
  -> Domable payload
metadata attributes kids = Domable
  ( Element'
      ( DC.elementify "metadata" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

metadata_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
metadata_ = metadata empty

metadata__
  :: forall payload
   . String
  -> Domable payload
metadata__ t = metadata_ [ DC.text_ t ]
