module Deku.DOM.Elt.Link where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Link_

link
  :: Event (Attribute Link_)
  -> Array Domable
  -> Domable
link attributes kids = Domable
  ( Element'
      ( DC.elementify "link" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

link_
  :: Array Domable
  -> Domable
link_ = link empty

link__
  :: String
  -> Domable
link__ t = link_ [ DC.text_ t ]
