module Deku.Korok where

import Prelude

import Control.Alt (class Alt, alt)
import Control.Alternative (class Alternative, empty)
import Control.Plus (class Plus)
import Data.Compactable (class Compactable, compactDefault)
import Data.Either (Either(..), hush)
import Data.Exists (Exists, mkExists, runExists)
import Data.Filterable (class Filterable, filter, filterMap, partitionMap)
import Data.Functor (voidRight)
import Data.Maybe (Maybe(..))
import FRP.Event (Event, memoize)
import FRP.Event.Class as EClass

newtype MapF b a = MapF { f :: a -> b, a :: Korok a }
type KMap b = Exists (MapF b)
newtype ApplyF b a = ApplyF { f :: Korok (a -> b), a :: Korok a }
type KApply b = Exists (ApplyF b)
newtype MemoF b a = MemoF { f :: Korok a -> b, a :: Korok a }
type KMemo b = Exists (MemoF b)
newtype FilterMapF b a = FilterMapF { f :: a -> Maybe b, a :: Korok a }
type KFilterMap b = Exists (FilterMapF b)
newtype SampleOnRightF b a = SampleOnRightF
  { f :: Korok (a -> b), a :: Korok a }

type KSampleOnRight b = Exists (SampleOnRightF b)
newtype SampleOnLeftF b a = SampleOnLeftF { f :: Korok (a -> b), a :: Korok a }
type KSampleOnLeft b = Exists (SampleOnLeftF b)

instance Functor Korok where
  map f a = KMap (mkExists (MapF { f, a }))

instance Apply Korok where
  apply f a = KApply (mkExists (ApplyF { f, a }))

instance Applicative Korok where
  pure = KPure

instance Alt Korok where
  alt = KAlt

instance Plus Korok where
  empty = KEmpty

instance Alternative Korok

instance Compactable Korok where
  compact f = compactDefault f
  separate = partitionMap identity

instance Filterable Korok where
  filterMap f a = KFilterMap (mkExists (FilterMapF { f, a }))
  filter f = filterMap (\x -> if f x then Just x else Nothing)
  partition f a = { yes: filter f a, no: filter (f >>> not) a }
  partitionMap f a =
    { left: filterMap (f >>> swap >>> hush) a, right: filterMap (f >>> hush) a }
    where
    swap (Left l) = Right l
    swap (Right r) = Left r

instance EClass.IsEvent Korok where
  keepLatest = KKeepLatest
  once = KOnce
  sampleOnLeft a f = KSampleOnLeft (mkExists (SampleOnLeftF { f, a }))
  sampleOnRight a f = KSampleOnRight (mkExists (SampleOnRightF { f, a }))
  fix = KFix

data Korok a
  = KMap (KMap a)
  | KApply (KApply a)
  | KPure a
  | KEvent (Event a)
  | KAlt (Korok a) (Korok a)
  | KMemo (KMemo a)
  | KEmpty
  | KFilterMap (KFilterMap a)
  | KSampleOnRight (KSampleOnRight a)
  | KSampleOnLeft (KSampleOnLeft a)
  | KFix (Korok a -> Korok a)
  | KKeepLatest (Korok (Korok a))
  | KOnce (Korok a)

runKorok
  :: forall a. Korok a -> (forall b. Event b -> Event a)
runKorok = case _ of
  KMap m -> runExists (\(MapF { f, a }) -> map (map f) (runKorok a)) m
  KApply m -> runExists
    (\(ApplyF { f, a }) -> apply <$> runKorok f <*> runKorok a)
    m
  KPure a -> voidRight a
  KEvent e -> const e
  KAlt m0 m1 -> alt <$> runKorok m0 <*> runKorok m1
  KMemo m -> runExists
    (\(MemoF { f, a }) -> runKorok a <#> \v -> memoize v (f <<< KEvent))
    m
  KEmpty -> const empty
  KFilterMap m -> runExists
    (\(FilterMapF { f, a }) -> filterMap f <$> runKorok a)
    m
  KSampleOnRight m -> runExists
    ( \(SampleOnRightF { f, a }) -> EClass.sampleOnRight <$> runKorok a <*>
        runKorok f
    )
    m
  KSampleOnLeft m -> runExists
    ( \(SampleOnLeftF { f, a }) -> EClass.sampleOnLeft <$> runKorok a <*>
        runKorok f
    )
    m
  KFix f -> \e -> EClass.fix \ee -> runKorok (f (KEvent ee)) e
  KKeepLatest ee -> \e -> EClass.keepLatest
    (runKorok (flip runKorok e <$> ee) e)
  KOnce a -> EClass.once <<< runKorok a

korokToEvent :: Korok ~> Event
korokToEvent = flip runKorok empty