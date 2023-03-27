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
  :: forall payload
   . Event (Attribute Main_)
  -> Array (Domable payload)
  -> Domable payload
main attributes kids = Domable
  ( Element'
      ( DC.elementify "main" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

main_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
main_ = main empty

main__
  :: forall payload
   . String
  -> Domable payload
main__ t = main_ [ DC.text_ t ]
