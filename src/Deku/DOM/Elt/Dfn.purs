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
  :: Event (Attribute Dfn_)
  -> Array Domable
  -> Domable
dfn attributes kids = Domable
  ( Element'
      ( DC.elementify "dfn" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dfn_
  :: Array Domable
  -> Domable
dfn_ = dfn empty

dfn__
  :: String
  -> Domable
dfn__ t = dfn_ [ DC.text_ t ]
