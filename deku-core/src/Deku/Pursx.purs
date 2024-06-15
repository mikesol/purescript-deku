module Deku.Pursx (module Deku.Pursx.Internal, bind, discard, class Pursx, purs, pursx, pursx', xa) where

import Prelude

import Data.Exists (Exists)
import Data.Map as Map
import Data.Tuple (Tuple(..))
import Deku.Core (Attribute, Nut)
import Deku.Pursx.Internal (class BindPursx, class PursxableToMap, Attributable, PursxInfo(..), bindPursx)
import Deku.Pursx.Internal as I
import FRP.Poll (Poll)

xa :: forall r. Poll (Attribute r) -> Exists Attributable
xa = I.xa

pursx :: forall r. PursxableToMap r => String -> { | r } -> Nut
pursx = I.pursx

pursx' :: forall r. PursxableToMap r => String -> String -> { | r } -> Nut
pursx' = I.pursx'

bind
  :: forall a b
   . BindPursx a b
  => a
  -> (Unit -> b)
  -> Tuple Int PursxInfo
bind = bindPursx

discard
  :: forall a b
   . BindPursx a b
  => a
  -> (Unit -> b)
  -> Tuple Int PursxInfo
discard = bindPursx

class Pursx a where
  purs :: a -> Nut

instance Pursx PursxInfo where
  purs = I.purs <<< Tuple 0

instance Pursx String where
  purs s = I.purs $ Tuple 0 $ PursxInfo s Map.empty

instance Pursx (Tuple Int PursxInfo) where
  purs = I.purs
