module Deku.DOM.Elt.FeComposite where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeComposite_

feComposite
  :: Event (Attribute FeComposite_)
  -> Array Domable
  -> Domable
feComposite attributes kids = Domable
  ( Element'
      ( DC.elementify "feComposite" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComposite_
  :: Array Domable
  -> Domable
feComposite_ = feComposite empty

feComposite__
  :: String
  -> Domable
feComposite__ t = feComposite_ [ DC.text_ t ]
