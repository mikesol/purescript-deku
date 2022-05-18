module Deku.TLDW where

import Prelude

import Control.Monad.ST.Class (class MonadST)
import Data.Monoid.Always (class Always)
import Deku.Core (Domable)
import Effect (Effect)

type Nut = forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload

type Nut' m = forall s lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload