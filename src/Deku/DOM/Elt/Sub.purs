module Deku.DOM.Elt.Sub where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Sub_

sub
  :: Event (Attribute Sub_)
  -> Array Domable
  -> Domable
sub attributes kids = Domable
  ( Element'
      ( DC.elementify "sub" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sub_
  :: Array Domable
  -> Domable
sub_ = sub empty

sub__
  :: String
  -> Domable
sub__ t = sub_ [ DC.text_ t ]
