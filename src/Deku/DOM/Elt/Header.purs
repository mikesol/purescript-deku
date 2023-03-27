module Deku.DOM.Elt.Header where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Header_

header
  :: forall payload
   . Event (Attribute Header_)
  -> Array (Domable payload)
  -> Domable payload
header attributes kids = Domable
  ( Element'
      ( DC.elementify "header" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

header_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
header_ = header empty

header__
  :: forall payload
   . String
  -> Domable payload
header__ t = header_ [ DC.text_ t ]
