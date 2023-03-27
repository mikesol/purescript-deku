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
  :: Event (Attribute Kbd_)
  -> Array Domable
  -> Domable
kbd attributes kids = Domable
  ( Element'
      ( DC.elementify "kbd" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

kbd_
  :: Array Domable
  -> Domable
kbd_ = kbd empty

kbd__
  :: String
  -> Domable
kbd__ t = kbd_ [ DC.text_ t ]
