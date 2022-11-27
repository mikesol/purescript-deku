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
  :: forall lock payload
   . Event (Attribute Ruby_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ruby attributes kids = Domable
  ( Element'
      ( DC.elementify "ruby" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ruby_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ruby_ = ruby empty

ruby__
  :: forall lock payload
   . String
  -> Domable lock payload
ruby__ t = ruby_ [ DC.text_ t ]
