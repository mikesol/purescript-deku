module Deku.DOM.Elt.Iframe where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Iframe_

iframe
  :: Event (Attribute Iframe_)
  -> Array Domable
  -> Domable
iframe attributes kids = Domable
  ( Element'
      ( DC.elementify "iframe" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

iframe_
  :: Array Domable
  -> Domable
iframe_ = iframe empty

iframe__
  :: String
  -> Domable
iframe__ t = iframe_ [ DC.text_ t ]
