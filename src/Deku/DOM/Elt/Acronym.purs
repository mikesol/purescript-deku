module Deku.DOM.Elt.Acronym where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Acronym_

acronym
  :: Event (Attribute Acronym_)
  -> Array Domable
  -> Domable
acronym attributes kids = Domable
  ( Element'
      ( DC.elementify "acronym" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

acronym_
  :: Array Domable
  -> Domable
acronym_ = acronym empty

acronym__
  :: String
  -> Domable
acronym__ t = acronym_ [ DC.text_ t ]
