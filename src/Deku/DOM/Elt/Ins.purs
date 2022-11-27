module Deku.DOM.Elt.Ins where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Ins_

ins
  :: forall lock payload
   . Event (Attribute Ins_)
  -> Array (Domable lock payload)
  -> Domable lock payload
ins attributes kids = Domable
  ( Element'
      ( DC.elementify "ins" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ins_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
ins_ = ins empty


ins__
  :: forall lock payload
   . String
  -> Domable lock payload
ins__ t = ins_ [ DC.text_ t ]
