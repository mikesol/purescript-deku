module Deku.DOM.Elt.Form where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Form_

form
  :: Event (Attribute Form_)
  -> Array Domable
  -> Domable
form attributes kids = Domable
  ( Element'
      ( DC.elementify "form" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

form_
  :: Array Domable
  -> Domable
form_ = form empty

form__
  :: String
  -> Domable
form__ t = form_ [ DC.text_ t ]
