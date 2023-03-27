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
  :: forall payload
   . Event (Attribute Section_)
  -> Array (Domable payload)
  -> Domable payload
section attributes kids = Domable
  ( Element'
      ( DC.elementify "section" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

section_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
section_ = section empty

section__
  :: forall payload
   . String
  -> Domable payload
section__ t = section_ [ DC.text_ t ]
