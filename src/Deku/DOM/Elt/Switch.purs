module Deku.DOM.Elt.Switch where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Switch_

switch
  :: forall payload
   . Event (Attribute Switch_)
  -> Array (Domable payload)
  -> Domable payload
switch attributes kids = Domable
  ( Element'
      ( DC.elementify "switch" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

switch_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
switch_ = switch empty

switch__
  :: forall payload
   . String
  -> Domable payload
switch__ t = switch_ [ DC.text_ t ]
