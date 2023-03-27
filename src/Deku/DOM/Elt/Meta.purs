module Deku.DOM.Elt.Meta where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Meta_

meta
  :: Event (Attribute Meta_)
  -> Array Domable
  -> Domable
meta attributes kids = Domable
  ( Element'
      ( DC.elementify "meta" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

meta_
  :: Array Domable
  -> Domable
meta_ = meta empty

meta__
  :: String
  -> Domable
meta__ t = meta_ [ DC.text_ t ]
