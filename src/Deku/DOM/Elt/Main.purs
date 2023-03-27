module Deku.DOM.Elt.Main where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Main_

main
  :: Event (Attribute Main_)
  -> Array Domable
  -> Domable
main attributes kids = Domable
  ( Element'
      ( DC.elementify "main" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

main_
  :: Array Domable
  -> Domable
main_ = main empty

main__
  :: String
  -> Domable
main__ t = main_ [ DC.text_ t ]
