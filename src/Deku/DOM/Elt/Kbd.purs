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
  :: forall lock payload
   . Event (Attribute Kbd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
kbd attributes kids = Domable
  ( Element'
      ( DC.elementify "kbd" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

kbd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
kbd_ = kbd empty

kbd__
  :: forall lock payload
   . String
  -> Domable lock payload
kbd__ t = kbd_ [ DC.text_ t ]
