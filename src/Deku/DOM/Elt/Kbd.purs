module Deku.DOM.Elt.Kbd where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Kbd_

kbd
  :: forall payload
   . Event (Attribute Kbd_)
  -> Array (Domable payload)
  -> Domable payload
kbd attributes kids = Domable
  ( Element'
      ( DC.elementify "kbd" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

kbd_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
kbd_ = kbd empty

kbd__
  :: forall payload
   . String
  -> Domable payload
kbd__ t = kbd_ [ DC.text_ t ]
