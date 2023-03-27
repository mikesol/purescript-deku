module Deku.DOM.Elt.Embed where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Embed_

embed
  :: forall payload
   . Event (Attribute Embed_)
  -> Array (Domable payload)
  -> Domable payload
embed attributes kids = Domable
  ( Element'
      ( DC.elementify "embed" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

embed_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
embed_ = embed empty

embed__
  :: forall payload
   . String
  -> Domable payload
embed__ t = embed_ [ DC.text_ t ]
