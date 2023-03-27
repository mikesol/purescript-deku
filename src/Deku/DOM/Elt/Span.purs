module Deku.DOM.Elt.Span where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Span_

span
  :: forall payload
   . Event (Attribute Span_)
  -> Array (Domable payload)
  -> Domable payload
span attributes kids = Domable
  ( Element'
      ( DC.elementify "span" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

span_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
span_ = span empty

span__
  :: forall payload
   . String
  -> Domable payload
span__ t = span_ [ DC.text_ t ]
