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
  :: Event (Attribute Dialog_)
  -> Array Domable
  -> Domable
dialog attributes kids = Domable
  ( Element'
      ( DC.elementify "dialog" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dialog_
  :: Array Domable
  -> Domable
dialog_ = dialog empty

dialog__
  :: String
  -> Domable
dialog__ t = dialog_ [ DC.text_ t ]
