module Deku.DOM.Elt.Option where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Option_

option
  :: forall lock payload
   . Event (Attribute Option_)
  -> Array (Domable lock payload)
  -> Domable lock payload
option attributes kids = Domable
  ( Element'
      ( DC.elementify "option" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

option_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
option_ = option empty


option__
  :: forall lock payload
   . String
  -> Domable lock payload
option__ t = option_ [ DC.text_ t ]
