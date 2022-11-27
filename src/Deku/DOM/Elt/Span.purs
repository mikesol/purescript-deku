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
  :: forall lock payload
   . Event (Attribute Span_)
  -> Array (Domable lock payload)
  -> Domable lock payload
span attributes kids = Domable
  ( Element'
      ( DC.elementify "span" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

span_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
span_ = span empty


span__
  :: forall lock payload
   . String
  -> Domable lock payload
span__ t = span_ [ DC.text_ t ]
