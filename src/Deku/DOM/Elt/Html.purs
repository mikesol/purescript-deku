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
  :: forall lock payload
   . Event (Attribute Html_)
  -> Array (Domable lock payload)
  -> Domable lock payload
html attributes kids = Domable
  ( Element'
      ( DC.elementify "html" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

html_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
html_ = html empty

html__
  :: forall lock payload
   . String
  -> Domable lock payload
html__ t = html_ [ DC.text_ t ]
