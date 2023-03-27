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
  :: forall payload
   . Event (Attribute Ruby_)
  -> Array (Domable payload)
  -> Domable payload
ruby attributes kids = Domable
  ( Element'
      ( DC.elementify "ruby" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ruby_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
ruby_ = ruby empty

ruby__
  :: forall payload
   . String
  -> Domable payload
ruby__ t = ruby_ [ DC.text_ t ]
