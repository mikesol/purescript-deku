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
  :: forall lock payload
   . Event (Attribute Section_)
  -> Array (Domable lock payload)
  -> Domable lock payload
section attributes kids = Domable
  ( Element'
      ( DC.elementify "section" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

section_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
section_ = section empty


section__
  :: forall lock payload
   . String
  -> Domable lock payload
section__ t = section_ [ DC.text_ t ]
