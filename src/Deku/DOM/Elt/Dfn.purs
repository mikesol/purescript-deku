module Deku.DOM.Elt.Dfn where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dfn_

dfn
  :: forall payload
   . Event (Attribute Dfn_)
  -> Array (Domable payload)
  -> Domable payload
dfn attributes kids = Domable
  ( Element'
      ( DC.elementify "dfn" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dfn_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dfn_ = dfn empty

dfn__
  :: forall payload
   . String
  -> Domable payload
dfn__ t = dfn_ [ DC.text_ t ]
