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
  :: Event (Attribute Ins_)
  -> Array Domable
  -> Domable
ins attributes kids = Domable
  ( Element'
      ( DC.elementify "ins" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

ins_
  :: Array Domable
  -> Domable
ins_ = ins empty

ins__
  :: String
  -> Domable
ins__ t = ins_ [ DC.text_ t ]
