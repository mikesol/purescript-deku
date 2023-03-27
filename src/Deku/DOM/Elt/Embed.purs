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
  :: Event (Attribute Embed_)
  -> Array Domable
  -> Domable
embed attributes kids = Domable
  ( Element'
      ( DC.elementify "embed" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

embed_
  :: Array Domable
  -> Domable
embed_ = embed empty

embed__
  :: String
  -> Domable
embed__ t = embed_ [ DC.text_ t ]
