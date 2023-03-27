module Deku.DOM.Elt.Ruby where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ruby_

ruby
  :: Event (Attribute Ruby_)
  -> Array Domable
  -> Domable
ruby attributes kids = Domable
  ( Element'
      ( DC.elementify "ruby" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ruby_
  :: Array Domable
  -> Domable
ruby_ = ruby empty

ruby__
  :: String
  -> Domable
ruby__ t = ruby_ [ DC.text_ t ]
