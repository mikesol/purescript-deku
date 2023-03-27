module Deku.DOM.Elt.Cite where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Cite_

cite
  :: Event (Attribute Cite_)
  -> Array Domable
  -> Domable
cite attributes kids = Domable
  ( Element'
      ( DC.elementify "cite" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

cite_
  :: Array Domable
  -> Domable
cite_ = cite empty

cite__
  :: String
  -> Domable
cite__ t = cite_ [ DC.text_ t ]
