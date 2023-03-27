module Deku.DOM.Elt.Code where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Code_

code
  :: Event (Attribute Code_)
  -> Array Domable
  -> Domable
code attributes kids = Domable
  ( Element'
      ( DC.elementify "code" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

code_
  :: Array Domable
  -> Domable
code_ = code empty

code__
  :: String
  -> Domable
code__ t = code_ [ DC.text_ t ]
