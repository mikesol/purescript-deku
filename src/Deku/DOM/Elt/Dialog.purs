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
  :: forall lock payload
   . Event (Attribute Dialog_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dialog attributes kids = Domable
  ( Element'
      ( DC.elementify "dialog" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dialog_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dialog_ = dialog empty


dialog__
  :: forall lock payload
   . String
  -> Domable lock payload
dialog__ t = dialog_ [ DC.text_ t ]
