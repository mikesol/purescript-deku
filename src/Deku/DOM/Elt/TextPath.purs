module Deku.DOM.Elt.TextPath where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data TextPath_

textPath
  :: forall payload
   . Event (Attribute TextPath_)
  -> Array (Domable payload)
  -> Domable payload
textPath attributes kids = Domable
  ( Element'
      ( DC.elementify "textPath" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

textPath_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
textPath_ = textPath empty

textPath__
  :: forall payload
   . String
  -> Domable payload
textPath__ t = textPath_ [ DC.text_ t ]
