module Deku.DOM.Elt.Textarea where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Textarea_

textarea
  :: Event (Attribute Textarea_)
  -> Array Domable
  -> Domable
textarea attributes kids = Domable
  ( Element'
      ( DC.elementify "textarea" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

textarea_
  :: Array Domable
  -> Domable
textarea_ = textarea empty

textarea__
  :: String
  -> Domable
textarea__ t = textarea_ [ DC.text_ t ]
