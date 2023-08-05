-- | Deku Hooks, modeled after React Hooks, are a way to have stateful behavior in Deku.
-- | At a basic level, Deku hooks look very much like their react counterparts:
-- |
-- | ```purescript
-- | Deku.do
-- |  setCount /\ count <- useState 0
-- |  Deku.button (click' $ counter <#> add 1 >>> setCount) [ textShow' count ]
-- | ```
-- |
-- | Deku hooks are covered more extensively in the
-- | [Deku guide section on state](https://purescript-deku.netlify.app/core-concepts/state)
-- | and the [Deku guide section on collections](https://purescript-deku.netlify.app/core-concepts/collections).
module Deku.Hooks
  ( (<#~>)
  , (<$~>)
  , class Switcher
  , class UseEffect
  , class UseMemoized
  , useHot
  , cycle
  , dynOptions
  , guard
  , guardWith
  , switcher
  , switcherFlipped
  , useDyn
  , useDynAtBeginning
  , useDynAtBeginningWith
  , useDynAtBeginningWith_
  , useDynAtBeginning_
  , useDynAtEnd
  , useDynAtEndWith
  , useDynAtEndWith_
  , useDynAtEnd_
  , useDynWith
  , useDynWith_
  , useDyn_
  , useEffect
  , useMailboxed
  , useMemoized
  , useMemoized'
  , useRef
  , useRefNE
  , useRefST
  , useRefSTNE
  , useState
  , useState'
  , useStateWithRef
  ) where

import Prelude

import Bolson.Control (Flatten)
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..))
import Bolson.Core as BCore
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Array as Array
import Data.Functor.Product (Product(..))
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..), tail, (:|))
import Data.Traversable (sequence, traverse)
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Child(..), DOMInterpret(..), DekuExtra, Hook, Node(..), Node', Nut(..), NutF(..), dyn, remove, sendToPos, unsafeSetPos)
import Deku.Do as Deku
import Effect (Effect)
import FRP.Behavior (behavior)
import FRP.Event (Event, create, filterMap, mailbox, makeEvent, makeLemmingEvent, mapAccum, merge, subscribe)

flattenArgs
  :: forall payload. Flatten Int (DOMInterpret payload) Node DekuExtra payload
flattenArgs =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , deferPayload: \(DOMInterpret { deferPayload }) -> deferPayload
  , forcePayload: \(DOMInterpret { forcePayload }) -> forcePayload
  , redecorateDeferredPayload: \(DOMInterpret { redecorateDeferredPayload }) ->
      redecorateDeferredPayload
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> e
  }

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten (NutF c) a b = Bolson.flatten flattenArgs c a b

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState'
  :: forall a
   . Hook ((a -> Effect Unit) /\ Event a)
useState' f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- create
    let Nut nf = f (push /\ event)
    __internalDekuFlatten nf i di

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ NonEmpty Event a)
useState a f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- create
    let Nut nf = f (push /\ NonEmpty a event)
    __internalDekuFlatten nf i di

-- | A hot state hook.
useHot
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ Product (ST Global) Event a)
useHot a f = Deku.do
  push /\ event <- useState'
  ref <- useRefST a event
  f (Tuple push (Product (Tuple ref event)))

guard :: forall f. Switcher f => f Boolean -> Nut -> Nut
guard b e = switcher (if _ then e else mempty) b

guardWith :: forall f a. Switcher f => f (Maybe a) -> (a -> Nut) -> Nut
guardWith m f = m <#~> case _ of
  Just x -> f x
  Nothing -> mempty

useEffect'
  :: Maybe (ST Global (Effect Unit))
  -> Event (Effect Unit)
  -> (Unit -> Nut)
  -> Nut
useEffect' mm e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di@(DOMInterpret { oneOffEffect }) = do
    let Nut nf = f unit
    Tuple sub (Tuple unsub ev) <- __internalDekuFlatten nf i di
    pure
      ( Tuple
          ( sub <> maybe empty
              ( pure <<< oneOffEffect <<< { effect: _ } <<< join <<<
                  liftST
              )
              mm
          )
          (Tuple unsub $ merge [ ev, e <#> \effect -> oneOffEffect { effect } ])
      )

class UseEffect f where
  -- | A hook to work with effects.
  useEffect :: f (Effect Unit) -> Hook Unit

instance UseEffect (NonEmpty Event) where
  useEffect (h :| t) = useEffect' (Just (pure h)) t

instance UseEffect (Product (ST Global) Event) where
  useEffect (Product (Tuple h t)) = useEffect' (Just h) t

instance UseEffect Event where
  useEffect = useEffect' Nothing

class UseMemoized a where
  -- | A hook to work with memoized values. See [`useMemoized`](https://purescript-deku.netlify.app/core-concepts/more-hooks#the-case-for-memoization) in the Deku guide for example usage.
  useMemoized :: a -> Hook a

instance UseMemoized (NonEmpty Event a) where
  useMemoized (h :| t) f = Deku.do
    tn <- useMemoized t
    f (h :| tn)

instance UseMemoized (Product (ST Global) Event a) where
  useMemoized (Product (Tuple h t)) f = Deku.do
    tn <- useMemoized t
    f (Product (Tuple h tn))

instance UseMemoized (Event a) where
  useMemoized e f = Nut go'
    where
    go' :: forall payload. NutF payload
    go' = NutF (Element' (Node (Element go)))

    go
      :: forall payload
       . Node' payload
    go i di = do
      { event, push } <- create
      u <- subscribe e push
      let Nut nf = f event
      Tuple sub (Tuple unsub evt) <- __internalDekuFlatten nf i di
      pure $ Tuple sub $ Tuple unsub $ makeEvent \k -> do
        o <- subscribe evt k
        pure do
          u
          o

-- | A hook to work with memoized values that lack an initial value. See [`useMemoized'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.

useMemoized'
  :: forall t a
   . UseMemoized a
  => (Event t -> a)
  -> (Tuple (t -> Effect Unit) a -> Nut)
  -> Nut
useMemoized' f0 makeHook = Deku.do
  push /\ e <- useState'
  m <- useMemoized (f0 e)
  makeHook (push /\ m)

useRef ∷ ∀ a. a → Event a → Hook (Effect a)
useRef a b f = useRefST a b \x -> f $ liftST x

useRefNE ∷ ∀ a. NonEmpty Event a → Hook (Effect a)
useRefNE a f = useRefSTNE a \x -> f $ liftST x

useRefSTNE
  :: forall a
   . NonEmpty Event a
  -> Hook (ST Global a)
useRefSTNE (NonEmpty x y) = useRefST x y

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRefST
  :: forall a
   . a
  -> Event a
  -> Hook (ST Global a)
useRefST a e makeHook = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    rf <- STRef.new a
    let Nut nf = makeHook (STRef.read rf)
    Tuple sub (Tuple unsub evt) <- __internalDekuFlatten nf i di
    pure $ Tuple sub $ Tuple unsub $ makeEvent \k -> do
      u0 <- subscribe e \x -> do
        void $ liftST $ STRef.write x rf
      u1 <- subscribe evt k
      pure do
        u0
        u1

useStateWithRef
  :: forall a
   . a
  -> Hook (Effect a /\ (a -> Effect Unit) /\ NonEmpty Event a)
useStateWithRef a f = Deku.do
  push /\ e <- useState a
  ref <- useRef a (tail e)
  f (ref /\ push /\ e)

-- | A hook that provides an event creator instead of events. Event creators turn into events when
-- | given an address, at which point they listen for a payload. This is useful when listening to
-- | large domains like updates of single items over large lists. It runs in _O(log n)_ time.
-- | For example usage, see [`useMailboxed`](https://purescript-deku.netlify.app/core-concepts/more-hooks#use-mailboxed) in the Deku guide.
useMailboxed
  :: forall a b
   . Ord a
  => Hook (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Event b))
useMailboxed f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- mailbox
    let Nut nf = f (push /\ event)
    __internalDekuFlatten nf i di

type DynOptions v =
  { sendTo :: v -> Event Int, remove :: v -> Event Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: const empty, remove: const empty }

useDyn
  :: forall value
   . Array (Tuple Int (ST Global value))
  -> Event (Tuple Int value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn x y = useDynWith x y dynOptions

useDynWith
  :: forall value
   . Event (Tuple Int value)
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith e opts f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behavior \e -> makeLemmingEvent \subscribe k -> do
    urf <- STRef.new (pure unit)
    ugh <- subscribe e \f -> do
      let
        mc cx (Tuple pos v) = Tuple
          ( merge
              [ opts.remove v $> Child BCore.Remove
              , Child <<< BCore.Logic <$> opts.sendTo v
              , cx.event
              ]
          )
          ( unsafeSetPos pos $ f
              { value: v
              , remove: cx.push remove
              , sendTo: cx.push <<< sendToPos
              }
          )
      c1 <- create
      let
        Nut nf = dyn $ map (mc c1) e
      __internalDekuFlatten nf i di
    pure do
      ugh
useDynAtBeginningWith
  :: forall value
   . Array (ST Global value)
  -> Event value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginningWith a e = useDynWith ((0 /\ _) <$> a) ((0 /\ _) <$> e)

useDynAtBeginning
  :: forall value
   . Array (ST Global value)
  -> Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginning a b = useDynAtBeginningWith a b dynOptions

useDynAtEndWith
  :: forall value
   . Array (ST Global value)
  -> Event value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEndWith arr e = useDynWith (mapWithIndex Tuple arr)
  (mapAccum (\a b -> (a + 1) /\ (a /\ b)) (Array.length arr) e)

useDynAtEnd
  :: forall value
   . Array (ST Global value)
  -> Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEnd a b = useDynAtEndWith a b dynOptions

class Switcher f where
  -- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
  -- | and creates a `Nut`. This allows you to use an event to switch between different
  -- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
  -- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
  -- | and should be used when the content needs to be replaced wholesale. For a more efficient
  -- | approach, see the `useDyn` hook.
  switcher :: forall a. (a -> Nut) -> f a -> Nut

instance Switcher Event where
  switcher f event = Deku.do
    ctr <- useMemoized (counter event)
    { value } <- useDynAtBeginningWith_ ctr $ dynOptions
      { remove = \(Tuple oldV _) -> filterMap
          (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
          ctr
      }
    f (snd value)
    where
    counter = mapAccum fn 0
      where
      fn a b = (a + 1) /\ (a /\ b)

instance Switcher (NonEmpty Event) where
  switcher f (NonEmpty h event) = Deku.do
    ctr <- useMemoized (counter event)
    { value } <- useDynAtBeginningWith [ pure (Tuple 0 h) ] ctr $
      dynOptions
        { remove = \(Tuple oldV _) -> filterMap
            (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
            ctr
        }
    f (snd value)
    where
    counter = mapAccum fn 1
      where
      fn a b = (a + 1) /\ (a /\ b)

instance Switcher (Product (ST Global) Event) where
  switcher f (Product (Tuple h event)) = Deku.do
    ctr <- useMemoized (counter event)
    { value } <- useDynAtBeginningWith [ Tuple 0 <$> h ] ctr $
      dynOptions
        { remove = \(Tuple oldV _) -> filterMap
            (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
            ctr
        }
    f (snd value)
    where
    counter = mapAccum fn 1
      where
      fn a b = (a + 1) /\ (a /\ b)

cycle :: forall f. Switcher f => f Nut -> Nut
cycle = switcher identity

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped :: forall f a. Switcher f => f a -> (a -> Nut) -> Nut
switcherFlipped = flip switcher

infixl 1 switcherFlipped as <#~>

useDyn_
  :: forall value
   . Event (Tuple Int value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn_ = useDyn []

useDynWith_
  :: forall value
   . Event (Tuple Int value)
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith_ = useDynWith []

useDynAtBeginning_
  :: forall value
   . Event value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginning_ = useDynAtBeginning []

useDynAtBeginningWith_
  :: forall value
   . Event value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginningWith_ = useDynAtBeginningWith []

useDynAtEnd_
  :: forall value
   . Event value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEnd_ = useDynAtEnd []

useDynAtEndWith_
  :: forall value
   . Event value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEndWith_ = useDynAtEndWith []