module Deku.Pursx
  ( module Deku.Pursx.Internal
  , pursx'
  , pursx
  , bind
  , discard
  , class Pursx
  , purs
  , lenientPursx
  , lenientPursx'
  , xa
  ) where

import Prelude

import Data.Exists (Exists)
import Data.Map as Map
import Data.Symbol (class IsSymbol)
import Data.Tuple (Tuple(..))
import Deku.Core (Attribute, Nut)
import Deku.Pursx.Internal (class BindPursx, class PursxSubstitutions, class PursxableToMap, Attributable, PursxInfo(..), bindPursx)
import Deku.Pursx.Internal as I
import Deku.PursxParser as PxP
import FRP.Poll (Poll)
import Prim.RowList as RL

xa :: forall r. Poll (Attribute r) -> Exists Attributable
xa = I.xa

lenientPursx :: forall r. PursxableToMap r => String -> { | r } -> Nut
lenientPursx = I.lenientPursx

lenientPursx'
  :: forall r. PursxableToMap r => String -> String -> { | r } -> Nut
lenientPursx' = I.lenientPursx'

pursx'
  :: forall @verb (@html :: Symbol) r0 rl0 p r rl
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => PursxableToMap r
  => { | r }
  -> Nut
pursx' = I.pursx' @verb @html

pursx
  :: forall (@html :: Symbol) r0 rl0 p r rl
   . IsSymbol html
  => PxP.PXStart "~" " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => PursxableToMap r
  => { | r }
  -> Nut
pursx = I.pursx @html

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
