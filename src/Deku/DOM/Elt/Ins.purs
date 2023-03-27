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
  :: forall payload
   . Event (Attribute Ins_)
  -> Array (Domable payload)
  -> Domable payload
ins attributes kids = Domable
  ( Element'
      ( DC.elementify "ins" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ins_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
ins_ = ins empty

ins__
  :: forall payload
   . String
  -> Domable payload
ins__ t = ins_ [ DC.text_ t ]
