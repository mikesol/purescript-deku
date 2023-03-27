module Deku.DOM.Elt.Html where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Html_

html
  :: forall payload
   . Event (Attribute Html_)
  -> Array (Domable payload)
  -> Domable payload
html attributes kids = Domable
  ( Element'
      ( DC.elementify "html" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

html_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
html_ = html empty

html__
  :: forall payload
   . String
  -> Domable payload
html__ t = html_ [ DC.text_ t ]
