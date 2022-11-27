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
  :: forall lock payload
   . Event (Attribute Metadata_)
  -> Array (Domable lock payload)
  -> Domable lock payload
metadata attributes kids = Domable
  ( Element'
      ( DC.elementify "metadata" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

metadata_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
metadata_ = metadata empty

metadata__
  :: forall lock payload
   . String
  -> Domable lock payload
metadata__ t = metadata_ [ DC.text_ t ]
