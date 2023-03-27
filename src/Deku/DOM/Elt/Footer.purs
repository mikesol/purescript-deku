module Deku.DOM.Elt.Footer where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Footer_

footer
  :: forall payload
   . Event (Attribute Footer_)
  -> Array (Domable payload)
  -> Domable payload
footer attributes kids = Domable
  ( Element'
      ( DC.elementify "footer" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

footer_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
footer_ = footer empty

footer__
  :: forall payload
   . String
  -> Domable payload
footer__ t = footer_ [ DC.text_ t ]
