module Deku.DOM.Elt.Head where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Head_

head
  :: Event (Attribute Head_)
  -> Array Domable
  -> Domable
head attributes kids = Domable
  ( Element'
      ( DC.elementify "head" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

head_
  :: Array Domable
  -> Domable
head_ = head empty

head__
  :: String
  -> Domable
head__ t = head_ [ DC.text_ t ]
