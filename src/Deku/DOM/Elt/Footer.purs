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
  :: forall lock payload
   . Event (Attribute Footer_)
  -> Array (Domable lock payload)
  -> Domable lock payload
footer attributes kids = Domable
  ( Element'
      ( DC.elementify "footer" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

footer_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
footer_ = footer empty

footer__
  :: forall lock payload
   . String
  -> Domable lock payload
footer__ t = footer_ [ DC.text_ t ]
