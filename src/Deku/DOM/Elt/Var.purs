module Deku.DOM.Elt.Var where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Var_

var
  :: forall payload
   . Event (Attribute Var_)
  -> Array (Domable payload)
  -> Domable payload
var attributes kids = Domable
  ( Element'
      ( DC.elementify "var" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

var_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
var_ = var empty

var__
  :: forall payload
   . String
  -> Domable payload
var__ t = var_ [ DC.text_ t ]
