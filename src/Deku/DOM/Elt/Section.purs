module Deku.DOM.Elt.Section where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Section_

section
  :: Event (Attribute Section_)
  -> Array Domable
  -> Domable
section attributes kids = Domable
  ( Element'
      ( DC.elementify "section" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

section_
  :: Array Domable
  -> Domable
section_ = section empty

section__
  :: String
  -> Domable
section__ t = section_ [ DC.text_ t ]
