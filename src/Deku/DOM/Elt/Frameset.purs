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
  :: forall lock payload
   . Event (Attribute Frameset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
frameset attributes kids = Domable
  ( Element'
      ( DC.elementify "frameset" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

frameset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
frameset_ = frameset empty

frameset__
  :: forall lock payload
   . String
  -> Domable lock payload
frameset__ t = frameset_ [ DC.text_ t ]
