module Deku.DOM.Elt.Object where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Object_

object
  :: Event (Attribute Object_)
  -> Array Domable
  -> Domable
object attributes kids = Domable
  ( Element'
      ( DC.elementify "object" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

object_
  :: Array Domable
  -> Domable
object_ = object empty

object__
  :: String
  -> Domable
object__ t = object_ [ DC.text_ t ]
