module Deku.DOM.Elt.Dialog where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dialog_

dialog
  :: forall payload
   . Event (Attribute Dialog_)
  -> Array (Domable payload)
  -> Domable payload
dialog attributes kids = Domable
  ( Element'
      ( DC.elementify "dialog" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dialog_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
dialog_ = dialog empty

dialog__
  :: forall payload
   . String
  -> Domable payload
dialog__ t = dialog_ [ DC.text_ t ]
