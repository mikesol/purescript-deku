module Deku.Some
  ( Some
  , inj
  , proj
  , projWithProof
  , projProof
  , LabelProof
  , class IsSubset
  , class IsSubsetRL
  , class Labels
  , class AsTypeConstructor
  , class AsTypeConstructorRL
  , foreachE
  , foreachEInv
  , labels
  , foreachEWith
  , foreachEWithInv
  , EffectOp(..)
  , EffectOpWith(..)
  ) where

import Prelude

import Data.Array as Array
import Data.Const (Const)
import Data.Function.Uncurried (Fn4, runFn4)
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4)
import Prim.Row as Row
import Prim.RowList as RL
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

class IsSubset :: forall k1. Row k1 -> Row k1 -> Constraint
class IsSubset r1 r2

class IsSubsetRL :: forall k1. RL.RowList k1 -> Row k1 -> Constraint
class IsSubsetRL r1 r2

instance (RL.RowToList r1 rl1, IsSubsetRL rl1 r2) => IsSubset r1 r2
instance (Row.Cons k v r2' r2, IsSubsetRL c r2) => IsSubsetRL (RL.Cons k v c) r2
instance IsSubsetRL RL.Nil r2

class AsTypeConstructor :: forall k1. (Type -> Type) -> Row k1 -> Row k1 -> Constraint
class AsTypeConstructor f r1 r2 | f r1 -> r2

class AsTypeConstructorRL :: forall k1. (Type -> Type) -> RL.RowList k1 -> Row k1 -> Constraint
class AsTypeConstructorRL f r1 r2 | f r1 -> r2

instance (RL.RowToList r1 rl1, AsTypeConstructorRL f rl1 r2) => AsTypeConstructor f r1 r2
instance
  ( Row.Cons k (f v) r2' r2
  , AsTypeConstructorRL f c r2'
  ) =>
  AsTypeConstructorRL f (RL.Cons k v c) r2

instance AsTypeConstructorRL f RL.Nil ()

class Labels :: forall k1. RL.RowList k1 -> Constraint
class Labels r1 where
  labels :: Proxy r1 -> Array String

instance (IsSymbol k, Labels c) => Labels (RL.Cons k v c) where
  labels _ = Array.cons (reflectSymbol (Proxy :: _ k)) (labels (Proxy :: _ c))

instance Labels RL.Nil where
  labels _ = []

data Some (r :: Row Type)

inj :: forall r1 r2. IsSubset r1 r2 => { | r1 } -> Some r2
inj = unsafeCoerce

foreign import projImpl
  :: forall r1 r2
   . Fn4 (forall a. a -> Maybe a)
       (forall a. Maybe a)
       (Array String)
       (Some r1)
       { | r2 }

newtype LabelProof :: RL.RowList Type -> Type
newtype LabelProof r = LabelProof (Array String)

proj
  :: forall r2 rl2 r3
   . RL.RowToList r2 rl2
  => Labels rl2
  => AsTypeConstructor Maybe r2 r3
  => Some r2
  -> { | r3 }
proj i = runFn4 projImpl Just Nothing (labels (Proxy :: _ rl2)) i

projProof :: forall @rl2 a. Labels rl2 => (LabelProof rl2 -> a) -> a
projProof f = f (LabelProof (labels (Proxy :: _ rl2)))

projWithProof
  :: forall r2 rl2 r3
   . RL.RowToList r2 rl2
  => AsTypeConstructor Maybe r2 r3
  => LabelProof rl2
  -> Some r2
  -> { | r3 }
projWithProof (LabelProof proof) i = runFn4 projImpl Just Nothing proof i

foreign import foreachEImpl :: forall a b. EffectFn2 a b Unit
foreign import foreachEInvImpl :: forall a b c. EffectFn3 a b c Unit
foreign import foreachEWithImpl :: forall a b c. EffectFn3 a b c Unit
foreign import foreachEWithInvImpl :: forall a b c d. EffectFn4 a b c d Unit

newtype EffectOp a = EffectOp (EffectFn1 a Unit)
newtype EffectOpWith b a = EffectOpWith (EffectFn2 b a Unit)

foreachE
  :: forall r2 r3
   . AsTypeConstructor EffectOp r2 r3
  => EffectFn2 (Some r2) { | r3 }  Unit
foreachE = unsafeCoerce foreachEImpl

foreachEInv
  :: forall r2 r3 r4
   . AsTypeConstructor EffectOp r2 r3
  => AsTypeConstructor (Const (Effect Unit)) r2 r4
  => EffectFn3 (Some r2) { | r3 } { | r4 } Unit
foreachEInv = unsafeCoerce foreachEInvImpl

foreachEWith
  :: forall a r2 r3
   . AsTypeConstructor (EffectOpWith a) r2 r3
  => EffectFn3 a (Some r2) { | r3 }  Unit
foreachEWith = unsafeCoerce foreachEWithImpl

foreachEWithInv
  :: forall a r2 r3 r4
   . AsTypeConstructor (EffectOpWith a) r2 r3
  => AsTypeConstructor (Const (EffectFn1 a Unit)) r2 r4
  => EffectFn4 a (Some r2) { | r3 } { | r4 } Unit
foreachEWithInv = unsafeCoerce foreachEWithInvImpl