module Deku.DOM.Elt.Figcaption where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Figcaption_

figcaption
  :: Event (Attribute Figcaption_)
  -> Array Domable
  -> Domable
figcaption attributes kids = Domable
  ( Element'
      ( DC.elementify "figcaption" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

figcaption_
  :: Array Domable
  -> Domable
figcaption_ = figcaption empty

figcaption__
  :: String
  -> Domable
figcaption__ t = figcaption_ [ DC.text_ t ]
