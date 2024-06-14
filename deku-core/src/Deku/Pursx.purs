module Deku.Pursx (module Deku.Pursx.Internal, bind, discard, class Pursx, purs) where

import Prelude

import Data.Map as Map
import Data.Tuple (Tuple(..))
import Deku.Core (Nut)
import Deku.Pursx.Internal (class BindPursx, PursxInfo(..), bindPursx)
import Deku.Pursx.Internal as I

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
