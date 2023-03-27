module Deku.DOM.Elt.Iframe where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Iframe_

iframe
  :: forall payload
   . Event (Attribute Iframe_)
  -> Array (Domable payload)
  -> Domable payload
iframe attributes kids = Domable
  ( Element'
      ( DC.elementify "iframe" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

iframe_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
iframe_ = iframe empty

iframe__
  :: forall payload
   . String
  -> Domable payload
iframe__ t = iframe_ [ DC.text_ t ]
