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
  :: Event (Attribute Footer_)
  -> Array Domable
  -> Domable
footer attributes kids = Domable
  ( Element'
      ( DC.elementify "footer" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

footer_
  :: Array Domable
  -> Domable
footer_ = footer empty

footer__
  :: String
  -> Domable
footer__ t = footer_ [ DC.text_ t ]
