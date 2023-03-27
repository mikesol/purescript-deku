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
  :: Event (Attribute Span_)
  -> Array Domable
  -> Domable
span attributes kids = Domable
  ( Element'
      ( DC.elementify "span" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

span_
  :: Array Domable
  -> Domable
span_ = span empty

span__
  :: String
  -> Domable
span__ t = span_ [ DC.text_ t ]
