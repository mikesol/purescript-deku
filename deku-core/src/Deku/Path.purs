module Deku.Path where

import Data.Array as Array
import Data.Identity (Identity)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (Tuple(..))
import Deku.Attribute (Attribute)
import Deku.Core (Nut)
import FRP.Poll as Poll
import Prim.RowList as RL
import Type.Proxy (Proxy(..))

class
  RLAppend
    (a :: RL.RowList Symbol)
    (b :: RL.RowList Symbol)
    (c :: RL.RowList Symbol)
  | a b -> c

instance RLAppend RL.Nil b b
else instance (RLAppend a b c) => RLAppend (RL.Cons k v a) b (RL.Cons k v c)

class RLReverse (l :: RL.RowList Symbol) (o :: RL.RowList Symbol) | l -> o

instance RLReverse RL.Nil RL.Nil
instance
  ( RLReverse o o'
  , RLAppend o' (RL.Cons k v RL.Nil) x
  ) =>
  RLReverse (RL.Cons k v o) x

class
  RLReverses
    (l :: RL.RowList (RL.RowList Symbol))
    (o :: RL.RowList (RL.RowList Symbol))
  | l -> o

instance RLReverses RL.Nil RL.Nil
instance
  ( RLReverses o o'
  , RLReverse v v'
  ) =>
  RLReverses (RL.Cons k v o) (RL.Cons k v' o')

-- | In this class, we only pull out attribute symbols
class SymbolsToArray :: forall k. RL.RowList k -> Constraint
class SymbolsToArray rl where
  symbolsToArray :: Proxy rl -> Array (Tuple Boolean String)

instance SymbolsToArray RL.Nil where
  symbolsToArray _ = []

instance
  ( IsSymbol k
  , SymbolsToArray c
  ) =>
  SymbolsToArray (RL.Cons k (Poll.Poll (Attribute e)) c) where
  symbolsToArray _ = Array.cons (Tuple true (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToArray c
  ) =>
  SymbolsToArray (RL.Cons k (Attribute e) c) where
  symbolsToArray _ = Array.cons (Tuple true (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToArray c
  ) =>
  SymbolsToArray (RL.Cons k (Array (Attribute e)) c) where
  symbolsToArray _ = Array.cons (Tuple true (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToArray c
  ) =>
  SymbolsToArray (RL.Cons k (Array (Identity (Attribute e))) c) where
  symbolsToArray _ = Array.cons (Tuple true (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance (IsSymbol k, SymbolsToArray c) => SymbolsToArray (RL.Cons k String c) where
  symbolsToArray _ = Array.cons (Tuple false (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))
instance (IsSymbol k, SymbolsToArray c) => SymbolsToArray (RL.Cons k (Identity String) c) where
  symbolsToArray _ = Array.cons (Tuple false (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance (IsSymbol k, SymbolsToArray c) => SymbolsToArray (RL.Cons k Nut c) where
  symbolsToArray _ = Array.cons (Tuple false (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

instance (IsSymbol k, SymbolsToArray c) => SymbolsToArray (RL.Cons k (Poll.Poll String) c) where
  symbolsToArray _ = Array.cons (Tuple false (reflectSymbol (Proxy :: _ k)))
    (symbolsToArray (Proxy :: _ c))

data Marker

foreign import data ThisMarker :: Symbol -> Marker

data Path

foreign import data DownGroup :: Path -> Path
foreign import data RightGroup :: Path -> Path
foreign import data MarkerGroup :: RL.RowList Symbol -> Path

foreign import data ContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data TwoContGroups :: Path -> Path -> Path

foreign import data TwoContGroupsWithMarkers
  :: RL.RowList Symbol -> Path -> Path -> Path

class
  OneListLayer
    (p :: RL.RowList (RL.RowList Symbol))
    (d :: RL.RowList (RL.RowList Symbol))
    (m :: RL.RowList Symbol)
    (r :: RL.RowList (RL.RowList Symbol))
  | p -> d m r

instance OneListLayer RL.Nil RL.Nil RL.Nil RL.Nil
instance
  OneListLayer r a b c =>
  OneListLayer (RL.Cons k RL.Nil r) a (RL.Cons k k b) c

instance
  OneListLayer r a b c =>
  OneListLayer (RL.Cons k (RL.Cons "0" "0" x) r) (RL.Cons k x a) b c

instance
  OneListLayer r a b c =>
  OneListLayer (RL.Cons k (RL.Cons "1" "1" x) r) a b (RL.Cons k x c)

class
  Judgment
    (d :: RL.RowList (RL.RowList Symbol))
    (m :: RL.RowList Symbol)
    (r :: RL.RowList (RL.RowList Symbol))
    (o :: Path)
  | d m r -> o

-- a bit inefficient?
-- it'll add a couple more thunks for these simple cases
-- we can devise a raccourci if needed
instance
  Judgment RL.Nil RL.Nil RL.Nil (MarkerGroup RL.Nil)

instance
  Process (RL.Cons a b c) o =>
  Judgment (RL.Cons a b c) RL.Nil RL.Nil (DownGroup o)

instance Judgment RL.Nil (RL.Cons a b c) RL.Nil (MarkerGroup (RL.Cons a b c))
instance
  Process (RL.Cons a b c) o =>
  Judgment RL.Nil RL.Nil (RL.Cons a b c) (RightGroup o)

instance
  Process (RL.Cons a b c) o =>
  Judgment (RL.Cons a b c)
    (RL.Cons d e f)
    RL.Nil
    (ContGroupWithMarkers (RL.Cons d e f) (DownGroup o))

instance
  Process (RL.Cons a b c) o =>
  Judgment RL.Nil
    (RL.Cons d e f)
    (RL.Cons a b c)
    (ContGroupWithMarkers (RL.Cons d e f) (RightGroup o))

instance
  ( Process (RL.Cons a b c) o
  , Process (RL.Cons d e f) p
  ) =>
  Judgment (RL.Cons a b c)
    RL.Nil
    (RL.Cons d e f)
    (TwoContGroups (DownGroup o) (RightGroup p))

instance
  ( Process (RL.Cons a b c) o
  , Process (RL.Cons d e f) p
  ) =>
  Judgment (RL.Cons a b c)
    (RL.Cons x y z)
    (RL.Cons d e f)
    (TwoContGroupsWithMarkers (RL.Cons x y z) o p)

class Process (p :: RL.RowList (RL.RowList Symbol)) (o :: Path) | p -> o

instance (OneListLayer p a b c, Judgment a b c o) => Process p o

---------------------- start codegen

----------- new section
---- level 0
foreign import data XDownGroup :: Path -> Path
foreign import data XRightGroup :: Path -> Path
foreign import data XContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XTwoContGroups :: Path -> Path -> Path
foreign import data XTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YDownGroup :: Path -> Path
foreign import data YRightGroup :: Path -> Path
foreign import data YContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YTwoContGroups :: Path -> Path -> Path
foreign import data YTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

---- level 1
foreign import data XXDownGroup :: Path -> Path
foreign import data XXRightGroup :: Path -> Path
foreign import data XXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXTwoContGroups :: Path -> Path -> Path
foreign import data XXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYDownGroup :: Path -> Path
foreign import data XYRightGroup :: Path -> Path
foreign import data XYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYTwoContGroups :: Path -> Path -> Path
foreign import data XYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXDownGroup :: Path -> Path
foreign import data YXRightGroup :: Path -> Path
foreign import data YXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXTwoContGroups :: Path -> Path -> Path
foreign import data YXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYDownGroup :: Path -> Path
foreign import data YYRightGroup :: Path -> Path
foreign import data YYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYTwoContGroups :: Path -> Path -> Path
foreign import data YYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

---- level 2
foreign import data XXXDownGroup :: Path -> Path
foreign import data XXXRightGroup :: Path -> Path
foreign import data XXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXTwoContGroups :: Path -> Path -> Path
foreign import data XXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYDownGroup :: Path -> Path
foreign import data XXYRightGroup :: Path -> Path
foreign import data XXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYTwoContGroups :: Path -> Path -> Path
foreign import data XXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXDownGroup :: Path -> Path
foreign import data XYXRightGroup :: Path -> Path
foreign import data XYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXTwoContGroups :: Path -> Path -> Path
foreign import data XYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYDownGroup :: Path -> Path
foreign import data XYYRightGroup :: Path -> Path
foreign import data XYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYTwoContGroups :: Path -> Path -> Path
foreign import data XYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXDownGroup :: Path -> Path
foreign import data YXXRightGroup :: Path -> Path
foreign import data YXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXTwoContGroups :: Path -> Path -> Path
foreign import data YXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYDownGroup :: Path -> Path
foreign import data YXYRightGroup :: Path -> Path
foreign import data YXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYTwoContGroups :: Path -> Path -> Path
foreign import data YXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXDownGroup :: Path -> Path
foreign import data YYXRightGroup :: Path -> Path
foreign import data YYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXTwoContGroups :: Path -> Path -> Path
foreign import data YYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYDownGroup :: Path -> Path
foreign import data YYYRightGroup :: Path -> Path
foreign import data YYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYTwoContGroups :: Path -> Path -> Path
foreign import data YYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

---- level 3
foreign import data XXXXDownGroup :: Path -> Path
foreign import data XXXXRightGroup :: Path -> Path
foreign import data XXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXTwoContGroups :: Path -> Path -> Path
foreign import data XXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYDownGroup :: Path -> Path
foreign import data XXXYRightGroup :: Path -> Path
foreign import data XXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYTwoContGroups :: Path -> Path -> Path
foreign import data XXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXDownGroup :: Path -> Path
foreign import data XXYXRightGroup :: Path -> Path
foreign import data XXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXTwoContGroups :: Path -> Path -> Path
foreign import data XXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYDownGroup :: Path -> Path
foreign import data XXYYRightGroup :: Path -> Path
foreign import data XXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYTwoContGroups :: Path -> Path -> Path
foreign import data XXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXDownGroup :: Path -> Path
foreign import data XYXXRightGroup :: Path -> Path
foreign import data XYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXTwoContGroups :: Path -> Path -> Path
foreign import data XYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYDownGroup :: Path -> Path
foreign import data XYXYRightGroup :: Path -> Path
foreign import data XYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYTwoContGroups :: Path -> Path -> Path
foreign import data XYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXDownGroup :: Path -> Path
foreign import data XYYXRightGroup :: Path -> Path
foreign import data XYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXTwoContGroups :: Path -> Path -> Path
foreign import data XYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYDownGroup :: Path -> Path
foreign import data XYYYRightGroup :: Path -> Path
foreign import data XYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYTwoContGroups :: Path -> Path -> Path
foreign import data XYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXDownGroup :: Path -> Path
foreign import data YXXXRightGroup :: Path -> Path
foreign import data YXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXTwoContGroups :: Path -> Path -> Path
foreign import data YXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYDownGroup :: Path -> Path
foreign import data YXXYRightGroup :: Path -> Path
foreign import data YXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYTwoContGroups :: Path -> Path -> Path
foreign import data YXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXDownGroup :: Path -> Path
foreign import data YXYXRightGroup :: Path -> Path
foreign import data YXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXTwoContGroups :: Path -> Path -> Path
foreign import data YXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYDownGroup :: Path -> Path
foreign import data YXYYRightGroup :: Path -> Path
foreign import data YXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYTwoContGroups :: Path -> Path -> Path
foreign import data YXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXDownGroup :: Path -> Path
foreign import data YYXXRightGroup :: Path -> Path
foreign import data YYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXTwoContGroups :: Path -> Path -> Path
foreign import data YYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYDownGroup :: Path -> Path
foreign import data YYXYRightGroup :: Path -> Path
foreign import data YYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYTwoContGroups :: Path -> Path -> Path
foreign import data YYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXDownGroup :: Path -> Path
foreign import data YYYXRightGroup :: Path -> Path
foreign import data YYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXTwoContGroups :: Path -> Path -> Path
foreign import data YYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYDownGroup :: Path -> Path
foreign import data YYYYRightGroup :: Path -> Path
foreign import data YYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYTwoContGroups :: Path -> Path -> Path
foreign import data YYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

---- level 4
foreign import data XXXXXDownGroup :: Path -> Path
foreign import data XXXXXRightGroup :: Path -> Path
foreign import data XXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXXTwoContGroups :: Path -> Path -> Path
foreign import data XXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXXYDownGroup :: Path -> Path
foreign import data XXXXYRightGroup :: Path -> Path
foreign import data XXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXYTwoContGroups :: Path -> Path -> Path
foreign import data XXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYXDownGroup :: Path -> Path
foreign import data XXXYXRightGroup :: Path -> Path
foreign import data XXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYXTwoContGroups :: Path -> Path -> Path
foreign import data XXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYYDownGroup :: Path -> Path
foreign import data XXXYYRightGroup :: Path -> Path
foreign import data XXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYYTwoContGroups :: Path -> Path -> Path
foreign import data XXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXXDownGroup :: Path -> Path
foreign import data XXYXXRightGroup :: Path -> Path
foreign import data XXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXXTwoContGroups :: Path -> Path -> Path
foreign import data XXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXYDownGroup :: Path -> Path
foreign import data XXYXYRightGroup :: Path -> Path
foreign import data XXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXYTwoContGroups :: Path -> Path -> Path
foreign import data XXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYXDownGroup :: Path -> Path
foreign import data XXYYXRightGroup :: Path -> Path
foreign import data XXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYXTwoContGroups :: Path -> Path -> Path
foreign import data XXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYYDownGroup :: Path -> Path
foreign import data XXYYYRightGroup :: Path -> Path
foreign import data XXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYYTwoContGroups :: Path -> Path -> Path
foreign import data XXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXXDownGroup :: Path -> Path
foreign import data XYXXXRightGroup :: Path -> Path
foreign import data XYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXXTwoContGroups :: Path -> Path -> Path
foreign import data XYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXYDownGroup :: Path -> Path
foreign import data XYXXYRightGroup :: Path -> Path
foreign import data XYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXYTwoContGroups :: Path -> Path -> Path
foreign import data XYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYXDownGroup :: Path -> Path
foreign import data XYXYXRightGroup :: Path -> Path
foreign import data XYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYXTwoContGroups :: Path -> Path -> Path
foreign import data XYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYYDownGroup :: Path -> Path
foreign import data XYXYYRightGroup :: Path -> Path
foreign import data XYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYYTwoContGroups :: Path -> Path -> Path
foreign import data XYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXXDownGroup :: Path -> Path
foreign import data XYYXXRightGroup :: Path -> Path
foreign import data XYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXXTwoContGroups :: Path -> Path -> Path
foreign import data XYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXYDownGroup :: Path -> Path
foreign import data XYYXYRightGroup :: Path -> Path
foreign import data XYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXYTwoContGroups :: Path -> Path -> Path
foreign import data XYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYXDownGroup :: Path -> Path
foreign import data XYYYXRightGroup :: Path -> Path
foreign import data XYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYXTwoContGroups :: Path -> Path -> Path
foreign import data XYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYYDownGroup :: Path -> Path
foreign import data XYYYYRightGroup :: Path -> Path
foreign import data XYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYYTwoContGroups :: Path -> Path -> Path
foreign import data XYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXXDownGroup :: Path -> Path
foreign import data YXXXXRightGroup :: Path -> Path
foreign import data YXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXXTwoContGroups :: Path -> Path -> Path
foreign import data YXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXYDownGroup :: Path -> Path
foreign import data YXXXYRightGroup :: Path -> Path
foreign import data YXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXYTwoContGroups :: Path -> Path -> Path
foreign import data YXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYXDownGroup :: Path -> Path
foreign import data YXXYXRightGroup :: Path -> Path
foreign import data YXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYXTwoContGroups :: Path -> Path -> Path
foreign import data YXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYYDownGroup :: Path -> Path
foreign import data YXXYYRightGroup :: Path -> Path
foreign import data YXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYYTwoContGroups :: Path -> Path -> Path
foreign import data YXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXXDownGroup :: Path -> Path
foreign import data YXYXXRightGroup :: Path -> Path
foreign import data YXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXXTwoContGroups :: Path -> Path -> Path
foreign import data YXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXYDownGroup :: Path -> Path
foreign import data YXYXYRightGroup :: Path -> Path
foreign import data YXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXYTwoContGroups :: Path -> Path -> Path
foreign import data YXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYXDownGroup :: Path -> Path
foreign import data YXYYXRightGroup :: Path -> Path
foreign import data YXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYXTwoContGroups :: Path -> Path -> Path
foreign import data YXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYYDownGroup :: Path -> Path
foreign import data YXYYYRightGroup :: Path -> Path
foreign import data YXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYYTwoContGroups :: Path -> Path -> Path
foreign import data YXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXXDownGroup :: Path -> Path
foreign import data YYXXXRightGroup :: Path -> Path
foreign import data YYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXXTwoContGroups :: Path -> Path -> Path
foreign import data YYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXYDownGroup :: Path -> Path
foreign import data YYXXYRightGroup :: Path -> Path
foreign import data YYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXYTwoContGroups :: Path -> Path -> Path
foreign import data YYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYXDownGroup :: Path -> Path
foreign import data YYXYXRightGroup :: Path -> Path
foreign import data YYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYXTwoContGroups :: Path -> Path -> Path
foreign import data YYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYYDownGroup :: Path -> Path
foreign import data YYXYYRightGroup :: Path -> Path
foreign import data YYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYYTwoContGroups :: Path -> Path -> Path
foreign import data YYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXXDownGroup :: Path -> Path
foreign import data YYYXXRightGroup :: Path -> Path
foreign import data YYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXXTwoContGroups :: Path -> Path -> Path
foreign import data YYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXYDownGroup :: Path -> Path
foreign import data YYYXYRightGroup :: Path -> Path
foreign import data YYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXYTwoContGroups :: Path -> Path -> Path
foreign import data YYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYXDownGroup :: Path -> Path
foreign import data YYYYXRightGroup :: Path -> Path
foreign import data YYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYXTwoContGroups :: Path -> Path -> Path
foreign import data YYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYYDownGroup :: Path -> Path
foreign import data YYYYYRightGroup :: Path -> Path
foreign import data YYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYYTwoContGroups :: Path -> Path -> Path
foreign import data YYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

---- level 5
foreign import data XXXXXXDownGroup :: Path -> Path
foreign import data XXXXXXRightGroup :: Path -> Path
foreign import data XXXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXXXTwoContGroups :: Path -> Path -> Path
foreign import data XXXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXXXYDownGroup :: Path -> Path
foreign import data XXXXXYRightGroup :: Path -> Path
foreign import data XXXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXXYTwoContGroups :: Path -> Path -> Path
foreign import data XXXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXXYXDownGroup :: Path -> Path
foreign import data XXXXYXRightGroup :: Path -> Path
foreign import data XXXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXYXTwoContGroups :: Path -> Path -> Path
foreign import data XXXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXXYYDownGroup :: Path -> Path
foreign import data XXXXYYRightGroup :: Path -> Path
foreign import data XXXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXXYYTwoContGroups :: Path -> Path -> Path
foreign import data XXXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYXXDownGroup :: Path -> Path
foreign import data XXXYXXRightGroup :: Path -> Path
foreign import data XXXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYXXTwoContGroups :: Path -> Path -> Path
foreign import data XXXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYXYDownGroup :: Path -> Path
foreign import data XXXYXYRightGroup :: Path -> Path
foreign import data XXXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYXYTwoContGroups :: Path -> Path -> Path
foreign import data XXXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYYXDownGroup :: Path -> Path
foreign import data XXXYYXRightGroup :: Path -> Path
foreign import data XXXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYYXTwoContGroups :: Path -> Path -> Path
foreign import data XXXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXXYYYDownGroup :: Path -> Path
foreign import data XXXYYYRightGroup :: Path -> Path
foreign import data XXXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXXYYYTwoContGroups :: Path -> Path -> Path
foreign import data XXXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXXXDownGroup :: Path -> Path
foreign import data XXYXXXRightGroup :: Path -> Path
foreign import data XXYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXXXTwoContGroups :: Path -> Path -> Path
foreign import data XXYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXXYDownGroup :: Path -> Path
foreign import data XXYXXYRightGroup :: Path -> Path
foreign import data XXYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXXYTwoContGroups :: Path -> Path -> Path
foreign import data XXYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXYXDownGroup :: Path -> Path
foreign import data XXYXYXRightGroup :: Path -> Path
foreign import data XXYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXYXTwoContGroups :: Path -> Path -> Path
foreign import data XXYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYXYYDownGroup :: Path -> Path
foreign import data XXYXYYRightGroup :: Path -> Path
foreign import data XXYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYXYYTwoContGroups :: Path -> Path -> Path
foreign import data XXYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYXXDownGroup :: Path -> Path
foreign import data XXYYXXRightGroup :: Path -> Path
foreign import data XXYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYXXTwoContGroups :: Path -> Path -> Path
foreign import data XXYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYXYDownGroup :: Path -> Path
foreign import data XXYYXYRightGroup :: Path -> Path
foreign import data XXYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYXYTwoContGroups :: Path -> Path -> Path
foreign import data XXYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYYXDownGroup :: Path -> Path
foreign import data XXYYYXRightGroup :: Path -> Path
foreign import data XXYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYYXTwoContGroups :: Path -> Path -> Path
foreign import data XXYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XXYYYYDownGroup :: Path -> Path
foreign import data XXYYYYRightGroup :: Path -> Path
foreign import data XXYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XXYYYYTwoContGroups :: Path -> Path -> Path
foreign import data XXYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXXXDownGroup :: Path -> Path
foreign import data XYXXXXRightGroup :: Path -> Path
foreign import data XYXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXXXTwoContGroups :: Path -> Path -> Path
foreign import data XYXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXXYDownGroup :: Path -> Path
foreign import data XYXXXYRightGroup :: Path -> Path
foreign import data XYXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXXYTwoContGroups :: Path -> Path -> Path
foreign import data XYXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXYXDownGroup :: Path -> Path
foreign import data XYXXYXRightGroup :: Path -> Path
foreign import data XYXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXYXTwoContGroups :: Path -> Path -> Path
foreign import data XYXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXXYYDownGroup :: Path -> Path
foreign import data XYXXYYRightGroup :: Path -> Path
foreign import data XYXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXXYYTwoContGroups :: Path -> Path -> Path
foreign import data XYXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYXXDownGroup :: Path -> Path
foreign import data XYXYXXRightGroup :: Path -> Path
foreign import data XYXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYXXTwoContGroups :: Path -> Path -> Path
foreign import data XYXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYXYDownGroup :: Path -> Path
foreign import data XYXYXYRightGroup :: Path -> Path
foreign import data XYXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYXYTwoContGroups :: Path -> Path -> Path
foreign import data XYXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYYXDownGroup :: Path -> Path
foreign import data XYXYYXRightGroup :: Path -> Path
foreign import data XYXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYYXTwoContGroups :: Path -> Path -> Path
foreign import data XYXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYXYYYDownGroup :: Path -> Path
foreign import data XYXYYYRightGroup :: Path -> Path
foreign import data XYXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYXYYYTwoContGroups :: Path -> Path -> Path
foreign import data XYXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXXXDownGroup :: Path -> Path
foreign import data XYYXXXRightGroup :: Path -> Path
foreign import data XYYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXXXTwoContGroups :: Path -> Path -> Path
foreign import data XYYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXXYDownGroup :: Path -> Path
foreign import data XYYXXYRightGroup :: Path -> Path
foreign import data XYYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXXYTwoContGroups :: Path -> Path -> Path
foreign import data XYYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXYXDownGroup :: Path -> Path
foreign import data XYYXYXRightGroup :: Path -> Path
foreign import data XYYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXYXTwoContGroups :: Path -> Path -> Path
foreign import data XYYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYXYYDownGroup :: Path -> Path
foreign import data XYYXYYRightGroup :: Path -> Path
foreign import data XYYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYXYYTwoContGroups :: Path -> Path -> Path
foreign import data XYYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYXXDownGroup :: Path -> Path
foreign import data XYYYXXRightGroup :: Path -> Path
foreign import data XYYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYXXTwoContGroups :: Path -> Path -> Path
foreign import data XYYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYXYDownGroup :: Path -> Path
foreign import data XYYYXYRightGroup :: Path -> Path
foreign import data XYYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYXYTwoContGroups :: Path -> Path -> Path
foreign import data XYYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYYXDownGroup :: Path -> Path
foreign import data XYYYYXRightGroup :: Path -> Path
foreign import data XYYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYYXTwoContGroups :: Path -> Path -> Path
foreign import data XYYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data XYYYYYDownGroup :: Path -> Path
foreign import data XYYYYYRightGroup :: Path -> Path
foreign import data XYYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data XYYYYYTwoContGroups :: Path -> Path -> Path
foreign import data XYYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXXXDownGroup :: Path -> Path
foreign import data YXXXXXRightGroup :: Path -> Path
foreign import data YXXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXXXTwoContGroups :: Path -> Path -> Path
foreign import data YXXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXXYDownGroup :: Path -> Path
foreign import data YXXXXYRightGroup :: Path -> Path
foreign import data YXXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXXYTwoContGroups :: Path -> Path -> Path
foreign import data YXXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXYXDownGroup :: Path -> Path
foreign import data YXXXYXRightGroup :: Path -> Path
foreign import data YXXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXYXTwoContGroups :: Path -> Path -> Path
foreign import data YXXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXXYYDownGroup :: Path -> Path
foreign import data YXXXYYRightGroup :: Path -> Path
foreign import data YXXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXXYYTwoContGroups :: Path -> Path -> Path
foreign import data YXXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYXXDownGroup :: Path -> Path
foreign import data YXXYXXRightGroup :: Path -> Path
foreign import data YXXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYXXTwoContGroups :: Path -> Path -> Path
foreign import data YXXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYXYDownGroup :: Path -> Path
foreign import data YXXYXYRightGroup :: Path -> Path
foreign import data YXXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYXYTwoContGroups :: Path -> Path -> Path
foreign import data YXXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYYXDownGroup :: Path -> Path
foreign import data YXXYYXRightGroup :: Path -> Path
foreign import data YXXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYYXTwoContGroups :: Path -> Path -> Path
foreign import data YXXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXXYYYDownGroup :: Path -> Path
foreign import data YXXYYYRightGroup :: Path -> Path
foreign import data YXXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXXYYYTwoContGroups :: Path -> Path -> Path
foreign import data YXXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXXXDownGroup :: Path -> Path
foreign import data YXYXXXRightGroup :: Path -> Path
foreign import data YXYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXXXTwoContGroups :: Path -> Path -> Path
foreign import data YXYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXXYDownGroup :: Path -> Path
foreign import data YXYXXYRightGroup :: Path -> Path
foreign import data YXYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXXYTwoContGroups :: Path -> Path -> Path
foreign import data YXYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXYXDownGroup :: Path -> Path
foreign import data YXYXYXRightGroup :: Path -> Path
foreign import data YXYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXYXTwoContGroups :: Path -> Path -> Path
foreign import data YXYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYXYYDownGroup :: Path -> Path
foreign import data YXYXYYRightGroup :: Path -> Path
foreign import data YXYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYXYYTwoContGroups :: Path -> Path -> Path
foreign import data YXYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYXXDownGroup :: Path -> Path
foreign import data YXYYXXRightGroup :: Path -> Path
foreign import data YXYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYXXTwoContGroups :: Path -> Path -> Path
foreign import data YXYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYXYDownGroup :: Path -> Path
foreign import data YXYYXYRightGroup :: Path -> Path
foreign import data YXYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYXYTwoContGroups :: Path -> Path -> Path
foreign import data YXYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYYXDownGroup :: Path -> Path
foreign import data YXYYYXRightGroup :: Path -> Path
foreign import data YXYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYYXTwoContGroups :: Path -> Path -> Path
foreign import data YXYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YXYYYYDownGroup :: Path -> Path
foreign import data YXYYYYRightGroup :: Path -> Path
foreign import data YXYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YXYYYYTwoContGroups :: Path -> Path -> Path
foreign import data YXYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXXXDownGroup :: Path -> Path
foreign import data YYXXXXRightGroup :: Path -> Path
foreign import data YYXXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXXXTwoContGroups :: Path -> Path -> Path
foreign import data YYXXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXXYDownGroup :: Path -> Path
foreign import data YYXXXYRightGroup :: Path -> Path
foreign import data YYXXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXXYTwoContGroups :: Path -> Path -> Path
foreign import data YYXXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXYXDownGroup :: Path -> Path
foreign import data YYXXYXRightGroup :: Path -> Path
foreign import data YYXXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXYXTwoContGroups :: Path -> Path -> Path
foreign import data YYXXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXXYYDownGroup :: Path -> Path
foreign import data YYXXYYRightGroup :: Path -> Path
foreign import data YYXXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXXYYTwoContGroups :: Path -> Path -> Path
foreign import data YYXXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYXXDownGroup :: Path -> Path
foreign import data YYXYXXRightGroup :: Path -> Path
foreign import data YYXYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYXXTwoContGroups :: Path -> Path -> Path
foreign import data YYXYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYXYDownGroup :: Path -> Path
foreign import data YYXYXYRightGroup :: Path -> Path
foreign import data YYXYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYXYTwoContGroups :: Path -> Path -> Path
foreign import data YYXYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYYXDownGroup :: Path -> Path
foreign import data YYXYYXRightGroup :: Path -> Path
foreign import data YYXYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYYXTwoContGroups :: Path -> Path -> Path
foreign import data YYXYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYXYYYDownGroup :: Path -> Path
foreign import data YYXYYYRightGroup :: Path -> Path
foreign import data YYXYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYXYYYTwoContGroups :: Path -> Path -> Path
foreign import data YYXYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXXXDownGroup :: Path -> Path
foreign import data YYYXXXRightGroup :: Path -> Path
foreign import data YYYXXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXXXTwoContGroups :: Path -> Path -> Path
foreign import data YYYXXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXXYDownGroup :: Path -> Path
foreign import data YYYXXYRightGroup :: Path -> Path
foreign import data YYYXXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXXYTwoContGroups :: Path -> Path -> Path
foreign import data YYYXXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXYXDownGroup :: Path -> Path
foreign import data YYYXYXRightGroup :: Path -> Path
foreign import data YYYXYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXYXTwoContGroups :: Path -> Path -> Path
foreign import data YYYXYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYXYYDownGroup :: Path -> Path
foreign import data YYYXYYRightGroup :: Path -> Path
foreign import data YYYXYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYXYYTwoContGroups :: Path -> Path -> Path
foreign import data YYYXYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYXXDownGroup :: Path -> Path
foreign import data YYYYXXRightGroup :: Path -> Path
foreign import data YYYYXXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYXXTwoContGroups :: Path -> Path -> Path
foreign import data YYYYXXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYXYDownGroup :: Path -> Path
foreign import data YYYYXYRightGroup :: Path -> Path
foreign import data YYYYXYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYXYTwoContGroups :: Path -> Path -> Path
foreign import data YYYYXYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYYXDownGroup :: Path -> Path
foreign import data YYYYYXRightGroup :: Path -> Path
foreign import data YYYYYXContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYYXTwoContGroups :: Path -> Path -> Path
foreign import data YYYYYXTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---

foreign import data YYYYYYDownGroup :: Path -> Path
foreign import data YYYYYYRightGroup :: Path -> Path
foreign import data YYYYYYContGroupWithMarkers :: RL.RowList Symbol -> Path -> Path
foreign import data YYYYYYTwoContGroups :: Path -> Path -> Path
foreign import data YYYYYYTwoContGroupsWithMarkers :: RL.RowList Symbol -> Path -> Path -> Path
---



class Scrunch (i :: Path) (o :: Path) | i -> o




instance (Scrunch (XDownGroup a) o) => Scrunch (DownGroup (DownGroup a)) o
instance (Scrunch (YDownGroup a) o) => Scrunch (DownGroup (RightGroup a)) o
instance Scrunch (DownGroup (MarkerGroup a)) (DownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (DownGroup (ContGroupWithMarkers a b)) (DownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (DownGroup (TwoContGroups a b)) (DownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (DownGroup (TwoContGroupsWithMarkers z a b)) (DownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XRightGroup a) o) => Scrunch (RightGroup (DownGroup a)) o
instance (Scrunch (YRightGroup a) o) => Scrunch (RightGroup (RightGroup a)) o
instance Scrunch (RightGroup (MarkerGroup a)) (RightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (RightGroup (ContGroupWithMarkers a b)) (RightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (RightGroup (TwoContGroups a b)) (RightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (RightGroup (TwoContGroupsWithMarkers z a b)) (RightGroup (TwoContGroupsWithMarkers z c d))

---- level 0


instance (Scrunch (XXDownGroup a) o) => Scrunch (XDownGroup (DownGroup a)) o
instance (Scrunch (YXDownGroup a) o) => Scrunch (XDownGroup (RightGroup a)) o
instance Scrunch (XDownGroup (MarkerGroup a)) (XDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XDownGroup (ContGroupWithMarkers a b)) (XDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XDownGroup (TwoContGroups a b)) (XDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XDownGroup (TwoContGroupsWithMarkers z a b)) (XDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXRightGroup a) o) => Scrunch (XRightGroup (DownGroup a)) o
instance (Scrunch (YXRightGroup a) o) => Scrunch (XRightGroup (RightGroup a)) o
instance Scrunch (XRightGroup (MarkerGroup a)) (XRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XRightGroup (ContGroupWithMarkers a b)) (XRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XRightGroup (TwoContGroups a b)) (XRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XRightGroup (TwoContGroupsWithMarkers z a b)) (XRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYDownGroup a) o) => Scrunch (YDownGroup (DownGroup a)) o
instance (Scrunch (YYDownGroup a) o) => Scrunch (YDownGroup (RightGroup a)) o
instance Scrunch (YDownGroup (MarkerGroup a)) (YDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YDownGroup (ContGroupWithMarkers a b)) (YDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YDownGroup (TwoContGroups a b)) (YDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YDownGroup (TwoContGroupsWithMarkers z a b)) (YDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYRightGroup a) o) => Scrunch (YRightGroup (DownGroup a)) o
instance (Scrunch (YYRightGroup a) o) => Scrunch (YRightGroup (RightGroup a)) o
instance Scrunch (YRightGroup (MarkerGroup a)) (YRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YRightGroup (ContGroupWithMarkers a b)) (YRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YRightGroup (TwoContGroups a b)) (YRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YRightGroup (TwoContGroupsWithMarkers z a b)) (YRightGroup (TwoContGroupsWithMarkers z c d))

---- level 1


instance (Scrunch (XXXDownGroup a) o) => Scrunch (XXDownGroup (DownGroup a)) o
instance (Scrunch (YXXDownGroup a) o) => Scrunch (XXDownGroup (RightGroup a)) o
instance Scrunch (XXDownGroup (MarkerGroup a)) (XXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXDownGroup (ContGroupWithMarkers a b)) (XXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXDownGroup (TwoContGroups a b)) (XXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXDownGroup (TwoContGroupsWithMarkers z a b)) (XXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXRightGroup a) o) => Scrunch (XXRightGroup (DownGroup a)) o
instance (Scrunch (YXXRightGroup a) o) => Scrunch (XXRightGroup (RightGroup a)) o
instance Scrunch (XXRightGroup (MarkerGroup a)) (XXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXRightGroup (ContGroupWithMarkers a b)) (XXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXRightGroup (TwoContGroups a b)) (XXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXRightGroup (TwoContGroupsWithMarkers z a b)) (XXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYDownGroup a) o) => Scrunch (XYDownGroup (DownGroup a)) o
instance (Scrunch (YXYDownGroup a) o) => Scrunch (XYDownGroup (RightGroup a)) o
instance Scrunch (XYDownGroup (MarkerGroup a)) (XYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYDownGroup (ContGroupWithMarkers a b)) (XYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYDownGroup (TwoContGroups a b)) (XYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYDownGroup (TwoContGroupsWithMarkers z a b)) (XYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYRightGroup a) o) => Scrunch (XYRightGroup (DownGroup a)) o
instance (Scrunch (YXYRightGroup a) o) => Scrunch (XYRightGroup (RightGroup a)) o
instance Scrunch (XYRightGroup (MarkerGroup a)) (XYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYRightGroup (ContGroupWithMarkers a b)) (XYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYRightGroup (TwoContGroups a b)) (XYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYRightGroup (TwoContGroupsWithMarkers z a b)) (XYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXDownGroup a) o) => Scrunch (YXDownGroup (DownGroup a)) o
instance (Scrunch (YYXDownGroup a) o) => Scrunch (YXDownGroup (RightGroup a)) o
instance Scrunch (YXDownGroup (MarkerGroup a)) (YXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXDownGroup (ContGroupWithMarkers a b)) (YXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXDownGroup (TwoContGroups a b)) (YXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXDownGroup (TwoContGroupsWithMarkers z a b)) (YXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXRightGroup a) o) => Scrunch (YXRightGroup (DownGroup a)) o
instance (Scrunch (YYXRightGroup a) o) => Scrunch (YXRightGroup (RightGroup a)) o
instance Scrunch (YXRightGroup (MarkerGroup a)) (YXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXRightGroup (ContGroupWithMarkers a b)) (YXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXRightGroup (TwoContGroups a b)) (YXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXRightGroup (TwoContGroupsWithMarkers z a b)) (YXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYDownGroup a) o) => Scrunch (YYDownGroup (DownGroup a)) o
instance (Scrunch (YYYDownGroup a) o) => Scrunch (YYDownGroup (RightGroup a)) o
instance Scrunch (YYDownGroup (MarkerGroup a)) (YYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYDownGroup (ContGroupWithMarkers a b)) (YYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYDownGroup (TwoContGroups a b)) (YYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYDownGroup (TwoContGroupsWithMarkers z a b)) (YYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYRightGroup a) o) => Scrunch (YYRightGroup (DownGroup a)) o
instance (Scrunch (YYYRightGroup a) o) => Scrunch (YYRightGroup (RightGroup a)) o
instance Scrunch (YYRightGroup (MarkerGroup a)) (YYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYRightGroup (ContGroupWithMarkers a b)) (YYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYRightGroup (TwoContGroups a b)) (YYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYRightGroup (TwoContGroupsWithMarkers z a b)) (YYRightGroup (TwoContGroupsWithMarkers z c d))

---- level 2


instance (Scrunch (XXXXDownGroup a) o) => Scrunch (XXXDownGroup (DownGroup a)) o
instance (Scrunch (YXXXDownGroup a) o) => Scrunch (XXXDownGroup (RightGroup a)) o
instance Scrunch (XXXDownGroup (MarkerGroup a)) (XXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXDownGroup (ContGroupWithMarkers a b)) (XXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXDownGroup (TwoContGroups a b)) (XXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXDownGroup (TwoContGroupsWithMarkers z a b)) (XXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXXRightGroup a) o) => Scrunch (XXXRightGroup (DownGroup a)) o
instance (Scrunch (YXXXRightGroup a) o) => Scrunch (XXXRightGroup (RightGroup a)) o
instance Scrunch (XXXRightGroup (MarkerGroup a)) (XXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXRightGroup (ContGroupWithMarkers a b)) (XXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXRightGroup (TwoContGroups a b)) (XXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXRightGroup (TwoContGroupsWithMarkers z a b)) (XXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXXYDownGroup a) o) => Scrunch (XXYDownGroup (DownGroup a)) o
instance (Scrunch (YXXYDownGroup a) o) => Scrunch (XXYDownGroup (RightGroup a)) o
instance Scrunch (XXYDownGroup (MarkerGroup a)) (XXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYDownGroup (ContGroupWithMarkers a b)) (XXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYDownGroup (TwoContGroups a b)) (XXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYDownGroup (TwoContGroupsWithMarkers z a b)) (XXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXYRightGroup a) o) => Scrunch (XXYRightGroup (DownGroup a)) o
instance (Scrunch (YXXYRightGroup a) o) => Scrunch (XXYRightGroup (RightGroup a)) o
instance Scrunch (XXYRightGroup (MarkerGroup a)) (XXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYRightGroup (ContGroupWithMarkers a b)) (XXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYRightGroup (TwoContGroups a b)) (XXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYRightGroup (TwoContGroupsWithMarkers z a b)) (XXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYXDownGroup a) o) => Scrunch (XYXDownGroup (DownGroup a)) o
instance (Scrunch (YXYXDownGroup a) o) => Scrunch (XYXDownGroup (RightGroup a)) o
instance Scrunch (XYXDownGroup (MarkerGroup a)) (XYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXDownGroup (ContGroupWithMarkers a b)) (XYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXDownGroup (TwoContGroups a b)) (XYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXDownGroup (TwoContGroupsWithMarkers z a b)) (XYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYXRightGroup a) o) => Scrunch (XYXRightGroup (DownGroup a)) o
instance (Scrunch (YXYXRightGroup a) o) => Scrunch (XYXRightGroup (RightGroup a)) o
instance Scrunch (XYXRightGroup (MarkerGroup a)) (XYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXRightGroup (ContGroupWithMarkers a b)) (XYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXRightGroup (TwoContGroups a b)) (XYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXRightGroup (TwoContGroupsWithMarkers z a b)) (XYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYYDownGroup a) o) => Scrunch (XYYDownGroup (DownGroup a)) o
instance (Scrunch (YXYYDownGroup a) o) => Scrunch (XYYDownGroup (RightGroup a)) o
instance Scrunch (XYYDownGroup (MarkerGroup a)) (XYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYDownGroup (ContGroupWithMarkers a b)) (XYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYDownGroup (TwoContGroups a b)) (XYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYDownGroup (TwoContGroupsWithMarkers z a b)) (XYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYYRightGroup a) o) => Scrunch (XYYRightGroup (DownGroup a)) o
instance (Scrunch (YXYYRightGroup a) o) => Scrunch (XYYRightGroup (RightGroup a)) o
instance Scrunch (XYYRightGroup (MarkerGroup a)) (XYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYRightGroup (ContGroupWithMarkers a b)) (XYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYRightGroup (TwoContGroups a b)) (XYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYRightGroup (TwoContGroupsWithMarkers z a b)) (XYYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXXDownGroup a) o) => Scrunch (YXXDownGroup (DownGroup a)) o
instance (Scrunch (YYXXDownGroup a) o) => Scrunch (YXXDownGroup (RightGroup a)) o
instance Scrunch (YXXDownGroup (MarkerGroup a)) (YXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXDownGroup (ContGroupWithMarkers a b)) (YXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXDownGroup (TwoContGroups a b)) (YXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXDownGroup (TwoContGroupsWithMarkers z a b)) (YXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXXRightGroup a) o) => Scrunch (YXXRightGroup (DownGroup a)) o
instance (Scrunch (YYXXRightGroup a) o) => Scrunch (YXXRightGroup (RightGroup a)) o
instance Scrunch (YXXRightGroup (MarkerGroup a)) (YXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXRightGroup (ContGroupWithMarkers a b)) (YXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXRightGroup (TwoContGroups a b)) (YXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXRightGroup (TwoContGroupsWithMarkers z a b)) (YXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXYDownGroup a) o) => Scrunch (YXYDownGroup (DownGroup a)) o
instance (Scrunch (YYXYDownGroup a) o) => Scrunch (YXYDownGroup (RightGroup a)) o
instance Scrunch (YXYDownGroup (MarkerGroup a)) (YXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYDownGroup (ContGroupWithMarkers a b)) (YXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYDownGroup (TwoContGroups a b)) (YXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYDownGroup (TwoContGroupsWithMarkers z a b)) (YXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXYRightGroup a) o) => Scrunch (YXYRightGroup (DownGroup a)) o
instance (Scrunch (YYXYRightGroup a) o) => Scrunch (YXYRightGroup (RightGroup a)) o
instance Scrunch (YXYRightGroup (MarkerGroup a)) (YXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYRightGroup (ContGroupWithMarkers a b)) (YXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYRightGroup (TwoContGroups a b)) (YXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYRightGroup (TwoContGroupsWithMarkers z a b)) (YXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYXDownGroup a) o) => Scrunch (YYXDownGroup (DownGroup a)) o
instance (Scrunch (YYYXDownGroup a) o) => Scrunch (YYXDownGroup (RightGroup a)) o
instance Scrunch (YYXDownGroup (MarkerGroup a)) (YYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXDownGroup (ContGroupWithMarkers a b)) (YYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXDownGroup (TwoContGroups a b)) (YYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXDownGroup (TwoContGroupsWithMarkers z a b)) (YYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYXRightGroup a) o) => Scrunch (YYXRightGroup (DownGroup a)) o
instance (Scrunch (YYYXRightGroup a) o) => Scrunch (YYXRightGroup (RightGroup a)) o
instance Scrunch (YYXRightGroup (MarkerGroup a)) (YYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXRightGroup (ContGroupWithMarkers a b)) (YYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXRightGroup (TwoContGroups a b)) (YYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXRightGroup (TwoContGroupsWithMarkers z a b)) (YYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYYDownGroup a) o) => Scrunch (YYYDownGroup (DownGroup a)) o
instance (Scrunch (YYYYDownGroup a) o) => Scrunch (YYYDownGroup (RightGroup a)) o
instance Scrunch (YYYDownGroup (MarkerGroup a)) (YYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYDownGroup (ContGroupWithMarkers a b)) (YYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYDownGroup (TwoContGroups a b)) (YYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYDownGroup (TwoContGroupsWithMarkers z a b)) (YYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYYRightGroup a) o) => Scrunch (YYYRightGroup (DownGroup a)) o
instance (Scrunch (YYYYRightGroup a) o) => Scrunch (YYYRightGroup (RightGroup a)) o
instance Scrunch (YYYRightGroup (MarkerGroup a)) (YYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYRightGroup (ContGroupWithMarkers a b)) (YYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYRightGroup (TwoContGroups a b)) (YYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYRightGroup (TwoContGroupsWithMarkers z a b)) (YYYRightGroup (TwoContGroupsWithMarkers z c d))

---- level 3


instance (Scrunch (XXXXXDownGroup a) o) => Scrunch (XXXXDownGroup (DownGroup a)) o
instance (Scrunch (YXXXXDownGroup a) o) => Scrunch (XXXXDownGroup (RightGroup a)) o
instance Scrunch (XXXXDownGroup (MarkerGroup a)) (XXXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXXDownGroup (ContGroupWithMarkers a b)) (XXXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXXDownGroup (TwoContGroups a b)) (XXXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXXDownGroup (TwoContGroupsWithMarkers z a b)) (XXXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXXXRightGroup a) o) => Scrunch (XXXXRightGroup (DownGroup a)) o
instance (Scrunch (YXXXXRightGroup a) o) => Scrunch (XXXXRightGroup (RightGroup a)) o
instance Scrunch (XXXXRightGroup (MarkerGroup a)) (XXXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXXRightGroup (ContGroupWithMarkers a b)) (XXXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXXRightGroup (TwoContGroups a b)) (XXXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXXRightGroup (TwoContGroupsWithMarkers z a b)) (XXXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXXXYDownGroup a) o) => Scrunch (XXXYDownGroup (DownGroup a)) o
instance (Scrunch (YXXXYDownGroup a) o) => Scrunch (XXXYDownGroup (RightGroup a)) o
instance Scrunch (XXXYDownGroup (MarkerGroup a)) (XXXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXYDownGroup (ContGroupWithMarkers a b)) (XXXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXYDownGroup (TwoContGroups a b)) (XXXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXYDownGroup (TwoContGroupsWithMarkers z a b)) (XXXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXXYRightGroup a) o) => Scrunch (XXXYRightGroup (DownGroup a)) o
instance (Scrunch (YXXXYRightGroup a) o) => Scrunch (XXXYRightGroup (RightGroup a)) o
instance Scrunch (XXXYRightGroup (MarkerGroup a)) (XXXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXXYRightGroup (ContGroupWithMarkers a b)) (XXXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXYRightGroup (TwoContGroups a b)) (XXXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXXYRightGroup (TwoContGroupsWithMarkers z a b)) (XXXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXXYXDownGroup a) o) => Scrunch (XXYXDownGroup (DownGroup a)) o
instance (Scrunch (YXXYXDownGroup a) o) => Scrunch (XXYXDownGroup (RightGroup a)) o
instance Scrunch (XXYXDownGroup (MarkerGroup a)) (XXYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYXDownGroup (ContGroupWithMarkers a b)) (XXYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYXDownGroup (TwoContGroups a b)) (XXYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYXDownGroup (TwoContGroupsWithMarkers z a b)) (XXYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXYXRightGroup a) o) => Scrunch (XXYXRightGroup (DownGroup a)) o
instance (Scrunch (YXXYXRightGroup a) o) => Scrunch (XXYXRightGroup (RightGroup a)) o
instance Scrunch (XXYXRightGroup (MarkerGroup a)) (XXYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYXRightGroup (ContGroupWithMarkers a b)) (XXYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYXRightGroup (TwoContGroups a b)) (XXYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYXRightGroup (TwoContGroupsWithMarkers z a b)) (XXYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXXYYDownGroup a) o) => Scrunch (XXYYDownGroup (DownGroup a)) o
instance (Scrunch (YXXYYDownGroup a) o) => Scrunch (XXYYDownGroup (RightGroup a)) o
instance Scrunch (XXYYDownGroup (MarkerGroup a)) (XXYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYYDownGroup (ContGroupWithMarkers a b)) (XXYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYYDownGroup (TwoContGroups a b)) (XXYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYYDownGroup (TwoContGroupsWithMarkers z a b)) (XXYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXXYYRightGroup a) o) => Scrunch (XXYYRightGroup (DownGroup a)) o
instance (Scrunch (YXXYYRightGroup a) o) => Scrunch (XXYYRightGroup (RightGroup a)) o
instance Scrunch (XXYYRightGroup (MarkerGroup a)) (XXYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XXYYRightGroup (ContGroupWithMarkers a b)) (XXYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYYRightGroup (TwoContGroups a b)) (XXYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XXYYRightGroup (TwoContGroupsWithMarkers z a b)) (XXYYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYXXDownGroup a) o) => Scrunch (XYXXDownGroup (DownGroup a)) o
instance (Scrunch (YXYXXDownGroup a) o) => Scrunch (XYXXDownGroup (RightGroup a)) o
instance Scrunch (XYXXDownGroup (MarkerGroup a)) (XYXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXXDownGroup (ContGroupWithMarkers a b)) (XYXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXXDownGroup (TwoContGroups a b)) (XYXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXXDownGroup (TwoContGroupsWithMarkers z a b)) (XYXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYXXRightGroup a) o) => Scrunch (XYXXRightGroup (DownGroup a)) o
instance (Scrunch (YXYXXRightGroup a) o) => Scrunch (XYXXRightGroup (RightGroup a)) o
instance Scrunch (XYXXRightGroup (MarkerGroup a)) (XYXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXXRightGroup (ContGroupWithMarkers a b)) (XYXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXXRightGroup (TwoContGroups a b)) (XYXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXXRightGroup (TwoContGroupsWithMarkers z a b)) (XYXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYXYDownGroup a) o) => Scrunch (XYXYDownGroup (DownGroup a)) o
instance (Scrunch (YXYXYDownGroup a) o) => Scrunch (XYXYDownGroup (RightGroup a)) o
instance Scrunch (XYXYDownGroup (MarkerGroup a)) (XYXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXYDownGroup (ContGroupWithMarkers a b)) (XYXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXYDownGroup (TwoContGroups a b)) (XYXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXYDownGroup (TwoContGroupsWithMarkers z a b)) (XYXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYXYRightGroup a) o) => Scrunch (XYXYRightGroup (DownGroup a)) o
instance (Scrunch (YXYXYRightGroup a) o) => Scrunch (XYXYRightGroup (RightGroup a)) o
instance Scrunch (XYXYRightGroup (MarkerGroup a)) (XYXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYXYRightGroup (ContGroupWithMarkers a b)) (XYXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXYRightGroup (TwoContGroups a b)) (XYXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYXYRightGroup (TwoContGroupsWithMarkers z a b)) (XYXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYYXDownGroup a) o) => Scrunch (XYYXDownGroup (DownGroup a)) o
instance (Scrunch (YXYYXDownGroup a) o) => Scrunch (XYYXDownGroup (RightGroup a)) o
instance Scrunch (XYYXDownGroup (MarkerGroup a)) (XYYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYXDownGroup (ContGroupWithMarkers a b)) (XYYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYXDownGroup (TwoContGroups a b)) (XYYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYXDownGroup (TwoContGroupsWithMarkers z a b)) (XYYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYYXRightGroup a) o) => Scrunch (XYYXRightGroup (DownGroup a)) o
instance (Scrunch (YXYYXRightGroup a) o) => Scrunch (XYYXRightGroup (RightGroup a)) o
instance Scrunch (XYYXRightGroup (MarkerGroup a)) (XYYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYXRightGroup (ContGroupWithMarkers a b)) (XYYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYXRightGroup (TwoContGroups a b)) (XYYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYXRightGroup (TwoContGroupsWithMarkers z a b)) (XYYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XXYYYDownGroup a) o) => Scrunch (XYYYDownGroup (DownGroup a)) o
instance (Scrunch (YXYYYDownGroup a) o) => Scrunch (XYYYDownGroup (RightGroup a)) o
instance Scrunch (XYYYDownGroup (MarkerGroup a)) (XYYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYYDownGroup (ContGroupWithMarkers a b)) (XYYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYYDownGroup (TwoContGroups a b)) (XYYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYYDownGroup (TwoContGroupsWithMarkers z a b)) (XYYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XXYYYRightGroup a) o) => Scrunch (XYYYRightGroup (DownGroup a)) o
instance (Scrunch (YXYYYRightGroup a) o) => Scrunch (XYYYRightGroup (RightGroup a)) o
instance Scrunch (XYYYRightGroup (MarkerGroup a)) (XYYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (XYYYRightGroup (ContGroupWithMarkers a b)) (XYYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYYRightGroup (TwoContGroups a b)) (XYYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (XYYYRightGroup (TwoContGroupsWithMarkers z a b)) (XYYYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXXXDownGroup a) o) => Scrunch (YXXXDownGroup (DownGroup a)) o
instance (Scrunch (YYXXXDownGroup a) o) => Scrunch (YXXXDownGroup (RightGroup a)) o
instance Scrunch (YXXXDownGroup (MarkerGroup a)) (YXXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXXDownGroup (ContGroupWithMarkers a b)) (YXXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXXDownGroup (TwoContGroups a b)) (YXXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXXDownGroup (TwoContGroupsWithMarkers z a b)) (YXXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXXXRightGroup a) o) => Scrunch (YXXXRightGroup (DownGroup a)) o
instance (Scrunch (YYXXXRightGroup a) o) => Scrunch (YXXXRightGroup (RightGroup a)) o
instance Scrunch (YXXXRightGroup (MarkerGroup a)) (YXXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXXRightGroup (ContGroupWithMarkers a b)) (YXXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXXRightGroup (TwoContGroups a b)) (YXXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXXRightGroup (TwoContGroupsWithMarkers z a b)) (YXXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXXYDownGroup a) o) => Scrunch (YXXYDownGroup (DownGroup a)) o
instance (Scrunch (YYXXYDownGroup a) o) => Scrunch (YXXYDownGroup (RightGroup a)) o
instance Scrunch (YXXYDownGroup (MarkerGroup a)) (YXXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXYDownGroup (ContGroupWithMarkers a b)) (YXXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXYDownGroup (TwoContGroups a b)) (YXXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXYDownGroup (TwoContGroupsWithMarkers z a b)) (YXXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXXYRightGroup a) o) => Scrunch (YXXYRightGroup (DownGroup a)) o
instance (Scrunch (YYXXYRightGroup a) o) => Scrunch (YXXYRightGroup (RightGroup a)) o
instance Scrunch (YXXYRightGroup (MarkerGroup a)) (YXXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXXYRightGroup (ContGroupWithMarkers a b)) (YXXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXYRightGroup (TwoContGroups a b)) (YXXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXXYRightGroup (TwoContGroupsWithMarkers z a b)) (YXXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXYXDownGroup a) o) => Scrunch (YXYXDownGroup (DownGroup a)) o
instance (Scrunch (YYXYXDownGroup a) o) => Scrunch (YXYXDownGroup (RightGroup a)) o
instance Scrunch (YXYXDownGroup (MarkerGroup a)) (YXYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYXDownGroup (ContGroupWithMarkers a b)) (YXYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYXDownGroup (TwoContGroups a b)) (YXYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYXDownGroup (TwoContGroupsWithMarkers z a b)) (YXYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXYXRightGroup a) o) => Scrunch (YXYXRightGroup (DownGroup a)) o
instance (Scrunch (YYXYXRightGroup a) o) => Scrunch (YXYXRightGroup (RightGroup a)) o
instance Scrunch (YXYXRightGroup (MarkerGroup a)) (YXYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYXRightGroup (ContGroupWithMarkers a b)) (YXYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYXRightGroup (TwoContGroups a b)) (YXYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYXRightGroup (TwoContGroupsWithMarkers z a b)) (YXYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYXYYDownGroup a) o) => Scrunch (YXYYDownGroup (DownGroup a)) o
instance (Scrunch (YYXYYDownGroup a) o) => Scrunch (YXYYDownGroup (RightGroup a)) o
instance Scrunch (YXYYDownGroup (MarkerGroup a)) (YXYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYYDownGroup (ContGroupWithMarkers a b)) (YXYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYYDownGroup (TwoContGroups a b)) (YXYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYYDownGroup (TwoContGroupsWithMarkers z a b)) (YXYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYXYYRightGroup a) o) => Scrunch (YXYYRightGroup (DownGroup a)) o
instance (Scrunch (YYXYYRightGroup a) o) => Scrunch (YXYYRightGroup (RightGroup a)) o
instance Scrunch (YXYYRightGroup (MarkerGroup a)) (YXYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YXYYRightGroup (ContGroupWithMarkers a b)) (YXYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYYRightGroup (TwoContGroups a b)) (YXYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YXYYRightGroup (TwoContGroupsWithMarkers z a b)) (YXYYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYXXDownGroup a) o) => Scrunch (YYXXDownGroup (DownGroup a)) o
instance (Scrunch (YYYXXDownGroup a) o) => Scrunch (YYXXDownGroup (RightGroup a)) o
instance Scrunch (YYXXDownGroup (MarkerGroup a)) (YYXXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXXDownGroup (ContGroupWithMarkers a b)) (YYXXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXXDownGroup (TwoContGroups a b)) (YYXXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXXDownGroup (TwoContGroupsWithMarkers z a b)) (YYXXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYXXRightGroup a) o) => Scrunch (YYXXRightGroup (DownGroup a)) o
instance (Scrunch (YYYXXRightGroup a) o) => Scrunch (YYXXRightGroup (RightGroup a)) o
instance Scrunch (YYXXRightGroup (MarkerGroup a)) (YYXXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXXRightGroup (ContGroupWithMarkers a b)) (YYXXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXXRightGroup (TwoContGroups a b)) (YYXXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXXRightGroup (TwoContGroupsWithMarkers z a b)) (YYXXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYXYDownGroup a) o) => Scrunch (YYXYDownGroup (DownGroup a)) o
instance (Scrunch (YYYXYDownGroup a) o) => Scrunch (YYXYDownGroup (RightGroup a)) o
instance Scrunch (YYXYDownGroup (MarkerGroup a)) (YYXYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXYDownGroup (ContGroupWithMarkers a b)) (YYXYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXYDownGroup (TwoContGroups a b)) (YYXYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXYDownGroup (TwoContGroupsWithMarkers z a b)) (YYXYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYXYRightGroup a) o) => Scrunch (YYXYRightGroup (DownGroup a)) o
instance (Scrunch (YYYXYRightGroup a) o) => Scrunch (YYXYRightGroup (RightGroup a)) o
instance Scrunch (YYXYRightGroup (MarkerGroup a)) (YYXYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYXYRightGroup (ContGroupWithMarkers a b)) (YYXYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXYRightGroup (TwoContGroups a b)) (YYXYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYXYRightGroup (TwoContGroupsWithMarkers z a b)) (YYXYRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYYXDownGroup a) o) => Scrunch (YYYXDownGroup (DownGroup a)) o
instance (Scrunch (YYYYXDownGroup a) o) => Scrunch (YYYXDownGroup (RightGroup a)) o
instance Scrunch (YYYXDownGroup (MarkerGroup a)) (YYYXDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYXDownGroup (ContGroupWithMarkers a b)) (YYYXDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYXDownGroup (TwoContGroups a b)) (YYYXDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYXDownGroup (TwoContGroupsWithMarkers z a b)) (YYYXDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYYXRightGroup a) o) => Scrunch (YYYXRightGroup (DownGroup a)) o
instance (Scrunch (YYYYXRightGroup a) o) => Scrunch (YYYXRightGroup (RightGroup a)) o
instance Scrunch (YYYXRightGroup (MarkerGroup a)) (YYYXRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYXRightGroup (ContGroupWithMarkers a b)) (YYYXRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYXRightGroup (TwoContGroups a b)) (YYYXRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYXRightGroup (TwoContGroupsWithMarkers z a b)) (YYYXRightGroup (TwoContGroupsWithMarkers z c d))



instance (Scrunch (XYYYYDownGroup a) o) => Scrunch (YYYYDownGroup (DownGroup a)) o
instance (Scrunch (YYYYYDownGroup a) o) => Scrunch (YYYYDownGroup (RightGroup a)) o
instance Scrunch (YYYYDownGroup (MarkerGroup a)) (YYYYDownGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYYDownGroup (ContGroupWithMarkers a b)) (YYYYDownGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYYDownGroup (TwoContGroups a b)) (YYYYDownGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYYDownGroup (TwoContGroupsWithMarkers z a b)) (YYYYDownGroup (TwoContGroupsWithMarkers z c d))
---
instance (Scrunch (XYYYYRightGroup a) o) => Scrunch (YYYYRightGroup (DownGroup a)) o
instance (Scrunch (YYYYYRightGroup a) o) => Scrunch (YYYYRightGroup (RightGroup a)) o
instance Scrunch (YYYYRightGroup (MarkerGroup a)) (YYYYRightGroup (MarkerGroup a))
instance (Scrunch b c) => Scrunch (YYYYRightGroup (ContGroupWithMarkers a b)) (YYYYRightGroup (ContGroupWithMarkers a c))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYYRightGroup (TwoContGroups a b)) (YYYYRightGroup (TwoContGroups c d))
instance (Scrunch a c, Scrunch b d) => Scrunch (YYYYRightGroup (TwoContGroupsWithMarkers z a b)) (YYYYRightGroup (TwoContGroupsWithMarkers z c d))



---- final

instance scrunchMarkerGroup :: Scrunch (MarkerGroup a) (MarkerGroup a)
instance scrunchContGroupWithMarkers :: (Scrunch b c) => Scrunch (ContGroupWithMarkers a b) (ContGroupWithMarkers a c)
instance scrunchTwoContGroups :: (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroups a b) (TwoContGroups c d)
instance scrunchTwoContGroupsWithMarkers :: (Scrunch a c, Scrunch b d) => Scrunch (TwoContGroupsWithMarkers z a b) (TwoContGroupsWithMarkers z c d)



instance Scrunch (XXXXXXDownGroup a) (XXXXXXDownGroup a)
instance Scrunch (XXXXXXRightGroup a) (XXXXXXRightGroup a)
instance Scrunch (XXXXXXContGroupWithMarkers a b) (XXXXXXContGroupWithMarkers a b)
instance Scrunch (XXXXXXTwoContGroups a b) (XXXXXXTwoContGroups a b)
instance Scrunch (XXXXXXTwoContGroupsWithMarkers z a b) (XXXXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXXXYDownGroup a) (XXXXXYDownGroup a)
instance Scrunch (XXXXXYRightGroup a) (XXXXXYRightGroup a)
instance Scrunch (XXXXXYContGroupWithMarkers a b) (XXXXXYContGroupWithMarkers a b)
instance Scrunch (XXXXXYTwoContGroups a b) (XXXXXYTwoContGroups a b)
instance Scrunch (XXXXXYTwoContGroupsWithMarkers z a b) (XXXXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXXYXDownGroup a) (XXXXYXDownGroup a)
instance Scrunch (XXXXYXRightGroup a) (XXXXYXRightGroup a)
instance Scrunch (XXXXYXContGroupWithMarkers a b) (XXXXYXContGroupWithMarkers a b)
instance Scrunch (XXXXYXTwoContGroups a b) (XXXXYXTwoContGroups a b)
instance Scrunch (XXXXYXTwoContGroupsWithMarkers z a b) (XXXXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXXYYDownGroup a) (XXXXYYDownGroup a)
instance Scrunch (XXXXYYRightGroup a) (XXXXYYRightGroup a)
instance Scrunch (XXXXYYContGroupWithMarkers a b) (XXXXYYContGroupWithMarkers a b)
instance Scrunch (XXXXYYTwoContGroups a b) (XXXXYYTwoContGroups a b)
instance Scrunch (XXXXYYTwoContGroupsWithMarkers z a b) (XXXXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXYXXDownGroup a) (XXXYXXDownGroup a)
instance Scrunch (XXXYXXRightGroup a) (XXXYXXRightGroup a)
instance Scrunch (XXXYXXContGroupWithMarkers a b) (XXXYXXContGroupWithMarkers a b)
instance Scrunch (XXXYXXTwoContGroups a b) (XXXYXXTwoContGroups a b)
instance Scrunch (XXXYXXTwoContGroupsWithMarkers z a b) (XXXYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXYXYDownGroup a) (XXXYXYDownGroup a)
instance Scrunch (XXXYXYRightGroup a) (XXXYXYRightGroup a)
instance Scrunch (XXXYXYContGroupWithMarkers a b) (XXXYXYContGroupWithMarkers a b)
instance Scrunch (XXXYXYTwoContGroups a b) (XXXYXYTwoContGroups a b)
instance Scrunch (XXXYXYTwoContGroupsWithMarkers z a b) (XXXYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXYYXDownGroup a) (XXXYYXDownGroup a)
instance Scrunch (XXXYYXRightGroup a) (XXXYYXRightGroup a)
instance Scrunch (XXXYYXContGroupWithMarkers a b) (XXXYYXContGroupWithMarkers a b)
instance Scrunch (XXXYYXTwoContGroups a b) (XXXYYXTwoContGroups a b)
instance Scrunch (XXXYYXTwoContGroupsWithMarkers z a b) (XXXYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXXYYYDownGroup a) (XXXYYYDownGroup a)
instance Scrunch (XXXYYYRightGroup a) (XXXYYYRightGroup a)
instance Scrunch (XXXYYYContGroupWithMarkers a b) (XXXYYYContGroupWithMarkers a b)
instance Scrunch (XXXYYYTwoContGroups a b) (XXXYYYTwoContGroups a b)
instance Scrunch (XXXYYYTwoContGroupsWithMarkers z a b) (XXXYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYXXXDownGroup a) (XXYXXXDownGroup a)
instance Scrunch (XXYXXXRightGroup a) (XXYXXXRightGroup a)
instance Scrunch (XXYXXXContGroupWithMarkers a b) (XXYXXXContGroupWithMarkers a b)
instance Scrunch (XXYXXXTwoContGroups a b) (XXYXXXTwoContGroups a b)
instance Scrunch (XXYXXXTwoContGroupsWithMarkers z a b) (XXYXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYXXYDownGroup a) (XXYXXYDownGroup a)
instance Scrunch (XXYXXYRightGroup a) (XXYXXYRightGroup a)
instance Scrunch (XXYXXYContGroupWithMarkers a b) (XXYXXYContGroupWithMarkers a b)
instance Scrunch (XXYXXYTwoContGroups a b) (XXYXXYTwoContGroups a b)
instance Scrunch (XXYXXYTwoContGroupsWithMarkers z a b) (XXYXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYXYXDownGroup a) (XXYXYXDownGroup a)
instance Scrunch (XXYXYXRightGroup a) (XXYXYXRightGroup a)
instance Scrunch (XXYXYXContGroupWithMarkers a b) (XXYXYXContGroupWithMarkers a b)
instance Scrunch (XXYXYXTwoContGroups a b) (XXYXYXTwoContGroups a b)
instance Scrunch (XXYXYXTwoContGroupsWithMarkers z a b) (XXYXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYXYYDownGroup a) (XXYXYYDownGroup a)
instance Scrunch (XXYXYYRightGroup a) (XXYXYYRightGroup a)
instance Scrunch (XXYXYYContGroupWithMarkers a b) (XXYXYYContGroupWithMarkers a b)
instance Scrunch (XXYXYYTwoContGroups a b) (XXYXYYTwoContGroups a b)
instance Scrunch (XXYXYYTwoContGroupsWithMarkers z a b) (XXYXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYYXXDownGroup a) (XXYYXXDownGroup a)
instance Scrunch (XXYYXXRightGroup a) (XXYYXXRightGroup a)
instance Scrunch (XXYYXXContGroupWithMarkers a b) (XXYYXXContGroupWithMarkers a b)
instance Scrunch (XXYYXXTwoContGroups a b) (XXYYXXTwoContGroups a b)
instance Scrunch (XXYYXXTwoContGroupsWithMarkers z a b) (XXYYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYYXYDownGroup a) (XXYYXYDownGroup a)
instance Scrunch (XXYYXYRightGroup a) (XXYYXYRightGroup a)
instance Scrunch (XXYYXYContGroupWithMarkers a b) (XXYYXYContGroupWithMarkers a b)
instance Scrunch (XXYYXYTwoContGroups a b) (XXYYXYTwoContGroups a b)
instance Scrunch (XXYYXYTwoContGroupsWithMarkers z a b) (XXYYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYYYXDownGroup a) (XXYYYXDownGroup a)
instance Scrunch (XXYYYXRightGroup a) (XXYYYXRightGroup a)
instance Scrunch (XXYYYXContGroupWithMarkers a b) (XXYYYXContGroupWithMarkers a b)
instance Scrunch (XXYYYXTwoContGroups a b) (XXYYYXTwoContGroups a b)
instance Scrunch (XXYYYXTwoContGroupsWithMarkers z a b) (XXYYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XXYYYYDownGroup a) (XXYYYYDownGroup a)
instance Scrunch (XXYYYYRightGroup a) (XXYYYYRightGroup a)
instance Scrunch (XXYYYYContGroupWithMarkers a b) (XXYYYYContGroupWithMarkers a b)
instance Scrunch (XXYYYYTwoContGroups a b) (XXYYYYTwoContGroups a b)
instance Scrunch (XXYYYYTwoContGroupsWithMarkers z a b) (XXYYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXXXXDownGroup a) (XYXXXXDownGroup a)
instance Scrunch (XYXXXXRightGroup a) (XYXXXXRightGroup a)
instance Scrunch (XYXXXXContGroupWithMarkers a b) (XYXXXXContGroupWithMarkers a b)
instance Scrunch (XYXXXXTwoContGroups a b) (XYXXXXTwoContGroups a b)
instance Scrunch (XYXXXXTwoContGroupsWithMarkers z a b) (XYXXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXXXYDownGroup a) (XYXXXYDownGroup a)
instance Scrunch (XYXXXYRightGroup a) (XYXXXYRightGroup a)
instance Scrunch (XYXXXYContGroupWithMarkers a b) (XYXXXYContGroupWithMarkers a b)
instance Scrunch (XYXXXYTwoContGroups a b) (XYXXXYTwoContGroups a b)
instance Scrunch (XYXXXYTwoContGroupsWithMarkers z a b) (XYXXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXXYXDownGroup a) (XYXXYXDownGroup a)
instance Scrunch (XYXXYXRightGroup a) (XYXXYXRightGroup a)
instance Scrunch (XYXXYXContGroupWithMarkers a b) (XYXXYXContGroupWithMarkers a b)
instance Scrunch (XYXXYXTwoContGroups a b) (XYXXYXTwoContGroups a b)
instance Scrunch (XYXXYXTwoContGroupsWithMarkers z a b) (XYXXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXXYYDownGroup a) (XYXXYYDownGroup a)
instance Scrunch (XYXXYYRightGroup a) (XYXXYYRightGroup a)
instance Scrunch (XYXXYYContGroupWithMarkers a b) (XYXXYYContGroupWithMarkers a b)
instance Scrunch (XYXXYYTwoContGroups a b) (XYXXYYTwoContGroups a b)
instance Scrunch (XYXXYYTwoContGroupsWithMarkers z a b) (XYXXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXYXXDownGroup a) (XYXYXXDownGroup a)
instance Scrunch (XYXYXXRightGroup a) (XYXYXXRightGroup a)
instance Scrunch (XYXYXXContGroupWithMarkers a b) (XYXYXXContGroupWithMarkers a b)
instance Scrunch (XYXYXXTwoContGroups a b) (XYXYXXTwoContGroups a b)
instance Scrunch (XYXYXXTwoContGroupsWithMarkers z a b) (XYXYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXYXYDownGroup a) (XYXYXYDownGroup a)
instance Scrunch (XYXYXYRightGroup a) (XYXYXYRightGroup a)
instance Scrunch (XYXYXYContGroupWithMarkers a b) (XYXYXYContGroupWithMarkers a b)
instance Scrunch (XYXYXYTwoContGroups a b) (XYXYXYTwoContGroups a b)
instance Scrunch (XYXYXYTwoContGroupsWithMarkers z a b) (XYXYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXYYXDownGroup a) (XYXYYXDownGroup a)
instance Scrunch (XYXYYXRightGroup a) (XYXYYXRightGroup a)
instance Scrunch (XYXYYXContGroupWithMarkers a b) (XYXYYXContGroupWithMarkers a b)
instance Scrunch (XYXYYXTwoContGroups a b) (XYXYYXTwoContGroups a b)
instance Scrunch (XYXYYXTwoContGroupsWithMarkers z a b) (XYXYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYXYYYDownGroup a) (XYXYYYDownGroup a)
instance Scrunch (XYXYYYRightGroup a) (XYXYYYRightGroup a)
instance Scrunch (XYXYYYContGroupWithMarkers a b) (XYXYYYContGroupWithMarkers a b)
instance Scrunch (XYXYYYTwoContGroups a b) (XYXYYYTwoContGroups a b)
instance Scrunch (XYXYYYTwoContGroupsWithMarkers z a b) (XYXYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYXXXDownGroup a) (XYYXXXDownGroup a)
instance Scrunch (XYYXXXRightGroup a) (XYYXXXRightGroup a)
instance Scrunch (XYYXXXContGroupWithMarkers a b) (XYYXXXContGroupWithMarkers a b)
instance Scrunch (XYYXXXTwoContGroups a b) (XYYXXXTwoContGroups a b)
instance Scrunch (XYYXXXTwoContGroupsWithMarkers z a b) (XYYXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYXXYDownGroup a) (XYYXXYDownGroup a)
instance Scrunch (XYYXXYRightGroup a) (XYYXXYRightGroup a)
instance Scrunch (XYYXXYContGroupWithMarkers a b) (XYYXXYContGroupWithMarkers a b)
instance Scrunch (XYYXXYTwoContGroups a b) (XYYXXYTwoContGroups a b)
instance Scrunch (XYYXXYTwoContGroupsWithMarkers z a b) (XYYXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYXYXDownGroup a) (XYYXYXDownGroup a)
instance Scrunch (XYYXYXRightGroup a) (XYYXYXRightGroup a)
instance Scrunch (XYYXYXContGroupWithMarkers a b) (XYYXYXContGroupWithMarkers a b)
instance Scrunch (XYYXYXTwoContGroups a b) (XYYXYXTwoContGroups a b)
instance Scrunch (XYYXYXTwoContGroupsWithMarkers z a b) (XYYXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYXYYDownGroup a) (XYYXYYDownGroup a)
instance Scrunch (XYYXYYRightGroup a) (XYYXYYRightGroup a)
instance Scrunch (XYYXYYContGroupWithMarkers a b) (XYYXYYContGroupWithMarkers a b)
instance Scrunch (XYYXYYTwoContGroups a b) (XYYXYYTwoContGroups a b)
instance Scrunch (XYYXYYTwoContGroupsWithMarkers z a b) (XYYXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYYXXDownGroup a) (XYYYXXDownGroup a)
instance Scrunch (XYYYXXRightGroup a) (XYYYXXRightGroup a)
instance Scrunch (XYYYXXContGroupWithMarkers a b) (XYYYXXContGroupWithMarkers a b)
instance Scrunch (XYYYXXTwoContGroups a b) (XYYYXXTwoContGroups a b)
instance Scrunch (XYYYXXTwoContGroupsWithMarkers z a b) (XYYYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYYXYDownGroup a) (XYYYXYDownGroup a)
instance Scrunch (XYYYXYRightGroup a) (XYYYXYRightGroup a)
instance Scrunch (XYYYXYContGroupWithMarkers a b) (XYYYXYContGroupWithMarkers a b)
instance Scrunch (XYYYXYTwoContGroups a b) (XYYYXYTwoContGroups a b)
instance Scrunch (XYYYXYTwoContGroupsWithMarkers z a b) (XYYYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYYYXDownGroup a) (XYYYYXDownGroup a)
instance Scrunch (XYYYYXRightGroup a) (XYYYYXRightGroup a)
instance Scrunch (XYYYYXContGroupWithMarkers a b) (XYYYYXContGroupWithMarkers a b)
instance Scrunch (XYYYYXTwoContGroups a b) (XYYYYXTwoContGroups a b)
instance Scrunch (XYYYYXTwoContGroupsWithMarkers z a b) (XYYYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (XYYYYYDownGroup a) (XYYYYYDownGroup a)
instance Scrunch (XYYYYYRightGroup a) (XYYYYYRightGroup a)
instance Scrunch (XYYYYYContGroupWithMarkers a b) (XYYYYYContGroupWithMarkers a b)
instance Scrunch (XYYYYYTwoContGroups a b) (XYYYYYTwoContGroups a b)
instance Scrunch (XYYYYYTwoContGroupsWithMarkers z a b) (XYYYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXXXXDownGroup a) (YXXXXXDownGroup a)
instance Scrunch (YXXXXXRightGroup a) (YXXXXXRightGroup a)
instance Scrunch (YXXXXXContGroupWithMarkers a b) (YXXXXXContGroupWithMarkers a b)
instance Scrunch (YXXXXXTwoContGroups a b) (YXXXXXTwoContGroups a b)
instance Scrunch (YXXXXXTwoContGroupsWithMarkers z a b) (YXXXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXXXYDownGroup a) (YXXXXYDownGroup a)
instance Scrunch (YXXXXYRightGroup a) (YXXXXYRightGroup a)
instance Scrunch (YXXXXYContGroupWithMarkers a b) (YXXXXYContGroupWithMarkers a b)
instance Scrunch (YXXXXYTwoContGroups a b) (YXXXXYTwoContGroups a b)
instance Scrunch (YXXXXYTwoContGroupsWithMarkers z a b) (YXXXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXXYXDownGroup a) (YXXXYXDownGroup a)
instance Scrunch (YXXXYXRightGroup a) (YXXXYXRightGroup a)
instance Scrunch (YXXXYXContGroupWithMarkers a b) (YXXXYXContGroupWithMarkers a b)
instance Scrunch (YXXXYXTwoContGroups a b) (YXXXYXTwoContGroups a b)
instance Scrunch (YXXXYXTwoContGroupsWithMarkers z a b) (YXXXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXXYYDownGroup a) (YXXXYYDownGroup a)
instance Scrunch (YXXXYYRightGroup a) (YXXXYYRightGroup a)
instance Scrunch (YXXXYYContGroupWithMarkers a b) (YXXXYYContGroupWithMarkers a b)
instance Scrunch (YXXXYYTwoContGroups a b) (YXXXYYTwoContGroups a b)
instance Scrunch (YXXXYYTwoContGroupsWithMarkers z a b) (YXXXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXYXXDownGroup a) (YXXYXXDownGroup a)
instance Scrunch (YXXYXXRightGroup a) (YXXYXXRightGroup a)
instance Scrunch (YXXYXXContGroupWithMarkers a b) (YXXYXXContGroupWithMarkers a b)
instance Scrunch (YXXYXXTwoContGroups a b) (YXXYXXTwoContGroups a b)
instance Scrunch (YXXYXXTwoContGroupsWithMarkers z a b) (YXXYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXYXYDownGroup a) (YXXYXYDownGroup a)
instance Scrunch (YXXYXYRightGroup a) (YXXYXYRightGroup a)
instance Scrunch (YXXYXYContGroupWithMarkers a b) (YXXYXYContGroupWithMarkers a b)
instance Scrunch (YXXYXYTwoContGroups a b) (YXXYXYTwoContGroups a b)
instance Scrunch (YXXYXYTwoContGroupsWithMarkers z a b) (YXXYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXYYXDownGroup a) (YXXYYXDownGroup a)
instance Scrunch (YXXYYXRightGroup a) (YXXYYXRightGroup a)
instance Scrunch (YXXYYXContGroupWithMarkers a b) (YXXYYXContGroupWithMarkers a b)
instance Scrunch (YXXYYXTwoContGroups a b) (YXXYYXTwoContGroups a b)
instance Scrunch (YXXYYXTwoContGroupsWithMarkers z a b) (YXXYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXXYYYDownGroup a) (YXXYYYDownGroup a)
instance Scrunch (YXXYYYRightGroup a) (YXXYYYRightGroup a)
instance Scrunch (YXXYYYContGroupWithMarkers a b) (YXXYYYContGroupWithMarkers a b)
instance Scrunch (YXXYYYTwoContGroups a b) (YXXYYYTwoContGroups a b)
instance Scrunch (YXXYYYTwoContGroupsWithMarkers z a b) (YXXYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYXXXDownGroup a) (YXYXXXDownGroup a)
instance Scrunch (YXYXXXRightGroup a) (YXYXXXRightGroup a)
instance Scrunch (YXYXXXContGroupWithMarkers a b) (YXYXXXContGroupWithMarkers a b)
instance Scrunch (YXYXXXTwoContGroups a b) (YXYXXXTwoContGroups a b)
instance Scrunch (YXYXXXTwoContGroupsWithMarkers z a b) (YXYXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYXXYDownGroup a) (YXYXXYDownGroup a)
instance Scrunch (YXYXXYRightGroup a) (YXYXXYRightGroup a)
instance Scrunch (YXYXXYContGroupWithMarkers a b) (YXYXXYContGroupWithMarkers a b)
instance Scrunch (YXYXXYTwoContGroups a b) (YXYXXYTwoContGroups a b)
instance Scrunch (YXYXXYTwoContGroupsWithMarkers z a b) (YXYXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYXYXDownGroup a) (YXYXYXDownGroup a)
instance Scrunch (YXYXYXRightGroup a) (YXYXYXRightGroup a)
instance Scrunch (YXYXYXContGroupWithMarkers a b) (YXYXYXContGroupWithMarkers a b)
instance Scrunch (YXYXYXTwoContGroups a b) (YXYXYXTwoContGroups a b)
instance Scrunch (YXYXYXTwoContGroupsWithMarkers z a b) (YXYXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYXYYDownGroup a) (YXYXYYDownGroup a)
instance Scrunch (YXYXYYRightGroup a) (YXYXYYRightGroup a)
instance Scrunch (YXYXYYContGroupWithMarkers a b) (YXYXYYContGroupWithMarkers a b)
instance Scrunch (YXYXYYTwoContGroups a b) (YXYXYYTwoContGroups a b)
instance Scrunch (YXYXYYTwoContGroupsWithMarkers z a b) (YXYXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYYXXDownGroup a) (YXYYXXDownGroup a)
instance Scrunch (YXYYXXRightGroup a) (YXYYXXRightGroup a)
instance Scrunch (YXYYXXContGroupWithMarkers a b) (YXYYXXContGroupWithMarkers a b)
instance Scrunch (YXYYXXTwoContGroups a b) (YXYYXXTwoContGroups a b)
instance Scrunch (YXYYXXTwoContGroupsWithMarkers z a b) (YXYYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYYXYDownGroup a) (YXYYXYDownGroup a)
instance Scrunch (YXYYXYRightGroup a) (YXYYXYRightGroup a)
instance Scrunch (YXYYXYContGroupWithMarkers a b) (YXYYXYContGroupWithMarkers a b)
instance Scrunch (YXYYXYTwoContGroups a b) (YXYYXYTwoContGroups a b)
instance Scrunch (YXYYXYTwoContGroupsWithMarkers z a b) (YXYYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYYYXDownGroup a) (YXYYYXDownGroup a)
instance Scrunch (YXYYYXRightGroup a) (YXYYYXRightGroup a)
instance Scrunch (YXYYYXContGroupWithMarkers a b) (YXYYYXContGroupWithMarkers a b)
instance Scrunch (YXYYYXTwoContGroups a b) (YXYYYXTwoContGroups a b)
instance Scrunch (YXYYYXTwoContGroupsWithMarkers z a b) (YXYYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YXYYYYDownGroup a) (YXYYYYDownGroup a)
instance Scrunch (YXYYYYRightGroup a) (YXYYYYRightGroup a)
instance Scrunch (YXYYYYContGroupWithMarkers a b) (YXYYYYContGroupWithMarkers a b)
instance Scrunch (YXYYYYTwoContGroups a b) (YXYYYYTwoContGroups a b)
instance Scrunch (YXYYYYTwoContGroupsWithMarkers z a b) (YXYYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXXXXDownGroup a) (YYXXXXDownGroup a)
instance Scrunch (YYXXXXRightGroup a) (YYXXXXRightGroup a)
instance Scrunch (YYXXXXContGroupWithMarkers a b) (YYXXXXContGroupWithMarkers a b)
instance Scrunch (YYXXXXTwoContGroups a b) (YYXXXXTwoContGroups a b)
instance Scrunch (YYXXXXTwoContGroupsWithMarkers z a b) (YYXXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXXXYDownGroup a) (YYXXXYDownGroup a)
instance Scrunch (YYXXXYRightGroup a) (YYXXXYRightGroup a)
instance Scrunch (YYXXXYContGroupWithMarkers a b) (YYXXXYContGroupWithMarkers a b)
instance Scrunch (YYXXXYTwoContGroups a b) (YYXXXYTwoContGroups a b)
instance Scrunch (YYXXXYTwoContGroupsWithMarkers z a b) (YYXXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXXYXDownGroup a) (YYXXYXDownGroup a)
instance Scrunch (YYXXYXRightGroup a) (YYXXYXRightGroup a)
instance Scrunch (YYXXYXContGroupWithMarkers a b) (YYXXYXContGroupWithMarkers a b)
instance Scrunch (YYXXYXTwoContGroups a b) (YYXXYXTwoContGroups a b)
instance Scrunch (YYXXYXTwoContGroupsWithMarkers z a b) (YYXXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXXYYDownGroup a) (YYXXYYDownGroup a)
instance Scrunch (YYXXYYRightGroup a) (YYXXYYRightGroup a)
instance Scrunch (YYXXYYContGroupWithMarkers a b) (YYXXYYContGroupWithMarkers a b)
instance Scrunch (YYXXYYTwoContGroups a b) (YYXXYYTwoContGroups a b)
instance Scrunch (YYXXYYTwoContGroupsWithMarkers z a b) (YYXXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXYXXDownGroup a) (YYXYXXDownGroup a)
instance Scrunch (YYXYXXRightGroup a) (YYXYXXRightGroup a)
instance Scrunch (YYXYXXContGroupWithMarkers a b) (YYXYXXContGroupWithMarkers a b)
instance Scrunch (YYXYXXTwoContGroups a b) (YYXYXXTwoContGroups a b)
instance Scrunch (YYXYXXTwoContGroupsWithMarkers z a b) (YYXYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXYXYDownGroup a) (YYXYXYDownGroup a)
instance Scrunch (YYXYXYRightGroup a) (YYXYXYRightGroup a)
instance Scrunch (YYXYXYContGroupWithMarkers a b) (YYXYXYContGroupWithMarkers a b)
instance Scrunch (YYXYXYTwoContGroups a b) (YYXYXYTwoContGroups a b)
instance Scrunch (YYXYXYTwoContGroupsWithMarkers z a b) (YYXYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXYYXDownGroup a) (YYXYYXDownGroup a)
instance Scrunch (YYXYYXRightGroup a) (YYXYYXRightGroup a)
instance Scrunch (YYXYYXContGroupWithMarkers a b) (YYXYYXContGroupWithMarkers a b)
instance Scrunch (YYXYYXTwoContGroups a b) (YYXYYXTwoContGroups a b)
instance Scrunch (YYXYYXTwoContGroupsWithMarkers z a b) (YYXYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYXYYYDownGroup a) (YYXYYYDownGroup a)
instance Scrunch (YYXYYYRightGroup a) (YYXYYYRightGroup a)
instance Scrunch (YYXYYYContGroupWithMarkers a b) (YYXYYYContGroupWithMarkers a b)
instance Scrunch (YYXYYYTwoContGroups a b) (YYXYYYTwoContGroups a b)
instance Scrunch (YYXYYYTwoContGroupsWithMarkers z a b) (YYXYYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYXXXDownGroup a) (YYYXXXDownGroup a)
instance Scrunch (YYYXXXRightGroup a) (YYYXXXRightGroup a)
instance Scrunch (YYYXXXContGroupWithMarkers a b) (YYYXXXContGroupWithMarkers a b)
instance Scrunch (YYYXXXTwoContGroups a b) (YYYXXXTwoContGroups a b)
instance Scrunch (YYYXXXTwoContGroupsWithMarkers z a b) (YYYXXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYXXYDownGroup a) (YYYXXYDownGroup a)
instance Scrunch (YYYXXYRightGroup a) (YYYXXYRightGroup a)
instance Scrunch (YYYXXYContGroupWithMarkers a b) (YYYXXYContGroupWithMarkers a b)
instance Scrunch (YYYXXYTwoContGroups a b) (YYYXXYTwoContGroups a b)
instance Scrunch (YYYXXYTwoContGroupsWithMarkers z a b) (YYYXXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYXYXDownGroup a) (YYYXYXDownGroup a)
instance Scrunch (YYYXYXRightGroup a) (YYYXYXRightGroup a)
instance Scrunch (YYYXYXContGroupWithMarkers a b) (YYYXYXContGroupWithMarkers a b)
instance Scrunch (YYYXYXTwoContGroups a b) (YYYXYXTwoContGroups a b)
instance Scrunch (YYYXYXTwoContGroupsWithMarkers z a b) (YYYXYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYXYYDownGroup a) (YYYXYYDownGroup a)
instance Scrunch (YYYXYYRightGroup a) (YYYXYYRightGroup a)
instance Scrunch (YYYXYYContGroupWithMarkers a b) (YYYXYYContGroupWithMarkers a b)
instance Scrunch (YYYXYYTwoContGroups a b) (YYYXYYTwoContGroups a b)
instance Scrunch (YYYXYYTwoContGroupsWithMarkers z a b) (YYYXYYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYYXXDownGroup a) (YYYYXXDownGroup a)
instance Scrunch (YYYYXXRightGroup a) (YYYYXXRightGroup a)
instance Scrunch (YYYYXXContGroupWithMarkers a b) (YYYYXXContGroupWithMarkers a b)
instance Scrunch (YYYYXXTwoContGroups a b) (YYYYXXTwoContGroups a b)
instance Scrunch (YYYYXXTwoContGroupsWithMarkers z a b) (YYYYXXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYYXYDownGroup a) (YYYYXYDownGroup a)
instance Scrunch (YYYYXYRightGroup a) (YYYYXYRightGroup a)
instance Scrunch (YYYYXYContGroupWithMarkers a b) (YYYYXYContGroupWithMarkers a b)
instance Scrunch (YYYYXYTwoContGroups a b) (YYYYXYTwoContGroups a b)
instance Scrunch (YYYYXYTwoContGroupsWithMarkers z a b) (YYYYXYTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYYYXDownGroup a) (YYYYYXDownGroup a)
instance Scrunch (YYYYYXRightGroup a) (YYYYYXRightGroup a)
instance Scrunch (YYYYYXContGroupWithMarkers a b) (YYYYYXContGroupWithMarkers a b)
instance Scrunch (YYYYYXTwoContGroups a b) (YYYYYXTwoContGroups a b)
instance Scrunch (YYYYYXTwoContGroupsWithMarkers z a b) (YYYYYXTwoContGroupsWithMarkers z a b)


instance Scrunch (YYYYYYDownGroup a) (YYYYYYDownGroup a)
instance Scrunch (YYYYYYRightGroup a) (YYYYYYRightGroup a)
instance Scrunch (YYYYYYContGroupWithMarkers a b) (YYYYYYContGroupWithMarkers a b)
instance Scrunch (YYYYYYTwoContGroups a b) (YYYYYYTwoContGroups a b)
instance Scrunch (YYYYYYTwoContGroupsWithMarkers z a b) (YYYYYYTwoContGroupsWithMarkers z a b)
