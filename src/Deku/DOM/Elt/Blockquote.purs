module Deku.DOM.Elt.Blockquote where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Blockquote_

blockquote
  :: Event (Attribute Blockquote_)
  -> Array Domable
  -> Domable
blockquote attributes kids = Domable
  ( Element'
      ( DC.elementify "blockquote" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

blockquote_
  :: Array Domable
  -> Domable
blockquote_ = blockquote empty

blockquote__
  :: String
  -> Domable
blockquote__ t = blockquote_ [ DC.text_ t ]
