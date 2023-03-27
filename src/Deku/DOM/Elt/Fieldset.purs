module Deku.DOM.Elt.Fieldset where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Fieldset_

fieldset
  :: Event (Attribute Fieldset_)
  -> Array Domable
  -> Domable
fieldset attributes kids = Domable
  ( Element'
      ( DC.elementify "fieldset" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fieldset_
  :: Array Domable
  -> Domable
fieldset_ = fieldset empty

fieldset__
  :: String
  -> Domable
fieldset__ t = fieldset_ [ DC.text_ t ]
