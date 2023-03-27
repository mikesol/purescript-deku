module Deku.DOM.Elt.Text where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Text_

text
  :: forall payload
   . Event (Attribute Text_)
  -> Array (Domable payload)
  -> Domable payload
text attributes kids = Domable
  ( Element'
      ( DC.elementify "text" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

text_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
text_ = text empty

text__
  :: forall payload
   . String
  -> Domable payload
text__ t = text_ [ DC.text_ t ]
