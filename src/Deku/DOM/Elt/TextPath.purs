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
  :: forall lock payload
   . Event (Attribute TextPath_)
  -> Array (Domable lock payload)
  -> Domable lock payload
textPath attributes kids = Domable
  ( Element'
      ( DC.elementify "textPath" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

textPath_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
textPath_ = textPath empty

textPath__
  :: forall lock payload
   . String
  -> Domable lock payload
textPath__ t = textPath_ [ DC.text_ t ]
