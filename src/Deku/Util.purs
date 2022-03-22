-- | This module contains utility typeclasses for various type-level programs.
module Deku.Util where

import Prelude hiding (Ordering(..))

import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\), type (/\))
import Data.Typelevel.Bool (True, False)
import Data.Typelevel.Num (class Nat, class Pred, class Succ, type (:*), D0, D1, D2, D3, D4, D5, D6, D7, D8, D9)
import Data.Vec (Vec, uncons)
import Prim.Ordering (Ordering, LT, GT, EQ)
import Prim.Row (class Cons, class Lacks)
import Prim.RowList (RowList)
import Prim.RowList as RL
import Prim.Symbol as Sym
import Type.Data.Peano (Nat, Succ, Z)
import Type.Proxy (Proxy(..))

-- | A gate that outputs `l` as `o` if `tf` is `True` and `r` as `o`
-- | if `tf` is `False`.
class Gate :: forall k1. Type -> k1 -> k1 -> k1 -> Constraint
class Gate tf l r o | tf l r -> o

instance gateTrue :: Gate True l r l

instance gateFalse :: Gate False l r r

-- | A gate that outputs `l` as `o` if `ord` is `EQ` and `r` as `o`
-- | if `ord` is `LT` or `GT`.
class OGate :: forall k1. Ordering -> k1 -> k1 -> k1 -> Constraint
class OGate tf l r o | tf l r -> o

instance oGateEq :: OGate EQ l r l

instance oGateLt :: OGate LT l r r

instance oGateGt :: OGate GT l r r

class CmpEq (c :: Ordering) (tf :: Type) | c -> tf

instance cmpEqLt :: CmpEq LT False

instance cmpEqGt :: CmpEq GT False

instance cmpEqEq :: CmpEq EQ True

class SymEq (s0 :: Symbol) (s1 :: Symbol) (tf :: Type) | s0 s1 -> tf

instance symEq :: (Sym.Compare s0 s1 cmp, CmpEq cmp tf) => SymEq s0 s1 tf

-- | Type-equality as a true/false assertion. Like
-- | [TypeEquals](https://pursuit.purescript.org/packages/purescript-type-equality/3.0.0/docs/Type.Equality#t:TypeEquals), but allows us to encode the failure case.
class TypeEqualTF (a :: Type) (b :: Type) (c :: Type) | a b -> c

instance typeEqualTFT :: TypeEqualTF a a True
else instance typeEqualTFF :: TypeEqualTF a b False

-- | Assertion that `a` is less than `b`
class LtEq (a :: Nat) (b :: Nat)

instance ltEqZ :: LtEq Z Z

instance ltEqZ' :: LtEq Z (Succ x)

instance ltEqS :: LtEq x y => LtEq (Succ x) (Succ y)

-- | Assertion that `sym` is not present in `nodeList`.
class SymInRowList'
  :: ∀ (k ∷ Type). Type -> Symbol -> RowList k -> Type -> Constraint
class SymInRowList' tf sym nodeList o | tf sym nodeList -> o

instance symInRowList'True :: SymInRowList' True sym rl True

instance symInRowList'False :: SymInRowList' False sym RL.Nil False

instance symInRowListCons ::
  ( SymEq sym h tf
  , SymInRowList' tf sym tail o
  ) =>
  SymInRowList' False sym (RL.Cons h head tail) o

-- | Assertion that `sym` is not present in `nodeList`.
class SymInRowList :: ∀ (k ∷ Type). Symbol -> RowList k -> Type -> Constraint
class SymInRowList sym nodeList tf | sym nodeList -> tf

instance symInRowList :: SymInRowList' False sym rl tf => SymInRowList sym rl tf

class RowListEmpty :: ∀ (k ∷ Type). RowList k -> Type -> Constraint
class RowListEmpty rowList tf | rowList -> tf

instance rowListEmptyNil :: RowListEmpty RL.Nil True

instance rowListEmptyCons :: RowListEmpty (RL.Cons a b c) False

tmap :: forall a b. (a -> b) -> a /\ a -> b /\ b
tmap f (a0 /\ a1) = f a0 /\ f a1

class
  Nat val <=
  AutoIncrementingInsert
    (key :: Type)
    (imap :: Type)
    (val :: Type)
    (omap :: Type)
  | key imap -> val omap

instance autoIncrementingInsertUnit ::
  AutoIncrementingInsert key Unit D0 ((key /\ D0) /\ Unit)
else instance autoIncrementingInsertTupleHit ::
  Succ val valP1 =>
  AutoIncrementingInsert key
    ((key /\ val) /\ rest)
    valP1
    ((key /\ valP1) /\ rest)
else instance autoIncrementingInsertTupleMiss ::
  AutoIncrementingInsert key rest val out =>
  AutoIncrementingInsert key (x /\ rest) val (x /\ out)

class Nat n <= NatToSym (n :: Type) (s :: Symbol) | n -> s

instance natToSymD0 :: NatToSym D0 "D0"

instance natToSymD1 :: NatToSym D1 "D1"

instance natToSymD2 :: NatToSym D2 "D2"

instance natToSymD3 :: NatToSym D3 "D3"

instance natToSymD4 :: NatToSym D4 "D4"

instance natToSymD5 :: NatToSym D5 "D5"

instance natToSymD6 :: NatToSym D6 "D6"

instance natToSymD7 :: NatToSym D7 "D7"

instance natToSymD8 :: NatToSym D8 "D8"

instance natToSymD9 :: NatToSym D9 "D9"

instance natToSymDCons ::
  ( Nat (x :* y)
  , NatToSym x sx
  , NatToSym y sy
  , Sym.Append sx "_" s0
  , Sym.Append s0 sy o
  ) =>
  NatToSym (x :* y) o

foreign import unsafeLeftBiasedSet :: forall r1 r2 a. String -> a -> Record r1 -> Record r2

insertLeft
  :: forall proxy r1 r2 l a
   . IsSymbol l
  => Lacks l r1
  => Cons l a r1 r2
  => proxy l
  -> a
  -> Record r1
  -> Record r2
insertLeft l a r = unsafeLeftBiasedSet (reflectSymbol l) a r

class MakePrefixIfNeeded (s :: Symbol) (i :: Type) (o :: Symbol) | s i -> o

instance symOrBustProxy :: MakePrefixIfNeeded s (Proxy sym) sym

instance symOrBustUnit :: Sym.Append s "_" o => MakePrefixIfNeeded s Unit o

class CoercePrefixToString (i :: Type) (o :: Symbol) | i -> o

instance symOrBust2Proxy :: CoercePrefixToString (Proxy sym) sym

instance symOrBust2Unit :: CoercePrefixToString Unit ""

class
  AddPrefixToRowList (s :: Symbol) (i :: RowList Type) (o :: RowList Type)
  | s i -> o

instance addPrefixToRowListCons ::
  ( AddPrefixToRowList sym c x
  , Sym.Append sym a symA
  ) =>
  AddPrefixToRowList sym (RL.Cons a b c) (RL.Cons symA b x)

instance addPrefixToRowListNil :: AddPrefixToRowList sym RL.Nil RL.Nil

class Detup (n :: Type) (a :: Type) (b :: Row Type) | n a -> b where
  detup' :: forall proxy. proxy n -> a -> { | b }

instance detupTuple ::
  ( Succ n np1
  , Detup np1 b r'
  , N2S n sym'
  , Sym.Append "@" sym' sym
  , Cons sym a r' r
  , IsSymbol sym
  , Lacks sym r'
  ) =>
  Detup n (Tuple a b) r where
  detup' _ (Tuple a b) = insertLeft (Proxy :: Proxy sym) a
    (detup' (Proxy :: Proxy np1) b)
instance detupUnit :: Detup n Unit () where
  detup' _ _ = {}

detup :: forall a b. Detup D0 a b => a -> { | b }
detup = detup' (Proxy :: Proxy D0)

class Vex (n :: Type) (a :: Type) (b :: Row Type) | n a -> b where
  vex :: Vec n a -> { | b }

instance vx0 :: Vex D0 a () where
  vex _ = {}
else instance vxneq ::
  ( Pred mx mxP1
  , Vex mxP1 a r'
  , N2S mx sym'
  , Sym.Append "@" sym' sym
  , Cons sym a r' r
  , IsSymbol sym
  , Lacks sym r'
  ) =>
  Vex mx a r where
  vex v =
    let
      uc = uncons v
    in
      insertLeft (Proxy :: Proxy sym) uc.head
        (vex uc.tail)

class N2S (n :: Type) (s :: Symbol) | n -> s

instance N2S D0 "0"
instance N2S D1 "1"
instance N2S D2 "2"
instance N2S D3 "3"
instance N2S D4 "4"
instance N2S D5 "5"
instance N2S D6 "6"
instance N2S D7 "7"
instance N2S D8 "8"
instance N2S D9 "9"
instance (N2S a a', N2S b b', Sym.Append a' b' c) => N2S (a :* b) c