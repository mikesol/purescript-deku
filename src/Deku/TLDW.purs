module Deku.TLDW where

import Prelude

import Control.Monad.ST.Class (class MonadST)
import Data.Monoid.Always (class Always, always)
import Data.Profunctor (lcmap)
import Deku.Core (Domable)
import Effect (Effect)
import FRP.Event (AnEvent, bus)

type Nut = forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload

type Nut' m = forall s lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload

abus :: forall a b s m. MonadST s m => Always (m Unit) (Effect Unit) => ((a -> Effect Unit) -> AnEvent m a -> b) -> AnEvent m b
abus f = bus (lcmap (map (always :: m Unit -> Effect Unit)) f)