module Deku.DOM.Elt.Frameset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Frameset_

frameset
  :: forall payload
   . Event (Attribute Frameset_)
  -> Array (Domable payload)
  -> Domable payload
frameset attributes kids = Domable
  ( Element'
      ( DC.elementify "frameset" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

frameset_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
frameset_ = frameset empty

frameset__
  :: forall payload
   . String
  -> Domable payload
frameset__ t = frameset_ [ DC.text_ t ]
