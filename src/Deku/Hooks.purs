-- | Deku Hooks, modeled after React Hooks, are a way to have stateful poll in Deku.
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
  , cycle
  , dynOptions
  , guard
  , guardWith
  , switcher
  , switcherFlipped
  , useDyn
  , useDynAtBeginning
  , useDynAtBeginningWith
  , useDynAtEnd
  , useDynAtEndWith
  , useDynWith
  , useEffect
  , useMailboxed
  , useMemoized
  , useMemoized'
  , useRef
  , useRefNE
  , useRefST
  , useRefSTNE
  , useState
  ) where

import Prelude

import Bolson.Control (Flatten, behaving, behaving')
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..))
import Bolson.Core as BCore
import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Debug (spy)
import Deku.Core (Child(..), DOMInterpret(..), DekuExtra, Hook, Node(..), Node', Nut(..), NutF(..), dyn, remove, sendToPos, unsafeSetPos)
import Deku.Do as Deku
import Effect (Effect)
import FRP.Poll (sample)
import FRP.Event (Event, create, createPure, filterMap, mailbox, mapAccum, merge)
import FRP.Event.Class (once)

flattenArgs
  :: forall payload. Flatten Int (DOMInterpret payload) Node DekuExtra payload
flattenArgs =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , deferPayload: \(DOMInterpret { deferPayload }) -> deferPayload
  , forcePayload: \(DOMInterpret { forcePayload }) -> forcePayload
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
useState
  :: forall a
   . Hook ((a -> Effect Unit) /\ Event a)
useState f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving \ee _ subscribe -> do
    { event, push } <- create
    let _ = spy "USESTATE" true
    let Nut nf = f ((\i -> let _ = spy "STAGETOPUSH" i in do
          pure unit
          let _ = spy "RUNNINGPUSH" true
          push i) /\ event)
    subscribe (sample (__internalDekuFlatten nf i di) ee)


guard :: (Event Unit -> Event Boolean) -> Nut -> Nut
guard b e = switcher (if _ then e else mempty) b

guardWith :: forall a. (Event Unit -> Event (Maybe a)) -> (a -> Nut) -> Nut
guardWith m f = m <#~> case _ of
  Just x -> f x
  Nothing -> mempty

useEffect
  :: Event (Effect Unit)
  -> (Unit -> Nut)
  -> Nut
useEffect e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di@(DOMInterpret { oneOffEffect }) = behaving' \ff ee _ subscribe -> do
    let Nut nf = f unit
    let
      exv = merge
        [ sample (__internalDekuFlatten nf i di) ee
        , ( \effect ->
              let
                _ = spy "oneOffEffect" true
              in
                ff
                  (oneOffEffect { effect })
          ) <$> e

        ]
    subscribe exv identity

-- | A hook to work with memoized values. See [`useMemoized`](https://purescript-deku.netlify.app/core-concepts/more-hooks#the-case-for-memoization) in the Deku guide for example usage.
useMemoized :: forall a. Event a -> Hook (Event a)
useMemoized e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving' \_ ee _ subscribe -> do
    { event, push } <- createPure
    subscribe e (\_ -> push)
    -- we `once e` in case it has an initial value
    let Nut nf = f (once e <|> event)
    subscribe (sample (__internalDekuFlatten nf i di) ee) identity

-- | A hook to work with memoized values that lack an initial value. See [`useMemoized'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.

useMemoized'
  :: forall t a
   . (Event t -> Event a)
  -> (Tuple (t -> Effect Unit) (Event a) -> Nut)
  -> Nut
useMemoized' f0 makeHook = Deku.do
  push /\ e <- useState
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
  go i di = behaving' \_ ee _ subscribe -> do
    rf <- STRef.new a
    let Nut nf = makeHook (STRef.read rf)
    subscribe (sample (__internalDekuFlatten nf i di) ee) identity
    subscribe e \_ x -> do
      void $ liftST $ STRef.write x rf

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
  go i di = behaving \e _ subscribe -> do
    { event, push } <- mailbox
    let Nut nf = f (push /\ event)
    subscribe (sample (__internalDekuFlatten nf i di) e)

type DynOptions v =
  { sendTo :: v -> (Event Unit -> Event Int), remove :: v -> (Event Unit -> Event Unit) }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ _ -> empty, remove: \_ _ -> empty }

useDyn
  :: forall value
   . (Event Unit -> Event (Tuple Int value))
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn y = useDynWith y dynOptions

useDynWith
  :: forall value
   . (Event Unit -> Event (Tuple Int value))
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
  go i di = behaving \ee _ subscribe -> do
    c1 <- create
    let _ = spy "USEDYNWITH CALLED" true
    let
      mc (Tuple pos v) = Tuple
        ( merge
            [ opts.remove v (ee $> unit) $> Child BCore.Remove
            , Child <<< BCore.Logic <$> opts.sendTo v (ee $> unit)
            , c1.event
            ]
        )
        ( unsafeSetPos pos $ f
            { value: v
            , remove: c1.push remove
            , sendTo: c1.push <<< sendToPos
            }
        )
    let
      Nut nf = dyn $ map mc (e (ee $> unit))
    subscribe (sample (__internalDekuFlatten nf i di) ee)

useDynAtBeginningWith
  :: forall value
   . (Event Unit -> Event value)
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginningWith e = useDynWith (map (map (0 /\ _)) e)

useDynAtBeginning
  :: forall value
   . (Event Unit -> Event value)
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginning b = useDynAtBeginningWith b dynOptions

useDynAtEndWith
  :: forall value
   . (Event Unit -> Event value)
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEndWith e = useDynWith
  (map (mapAccum (\a b -> (a + 1) /\ (a /\ b)) 0) e)

useDynAtEnd
  :: forall value
   . (Event Unit -> Event value)
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEnd b = useDynAtEndWith b dynOptions

-- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- | and creates a `Nut`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher :: forall a. (a -> Nut) -> (Event Unit -> Event a) -> Nut
switcher f event = Deku.do
  --ctr <- useMemoized (counter event)
  { value } <- useDynAtBeginningWith (counter <$> event) $ dynOptions
    { remove = \(Tuple oldV _) ee -> filterMap
        (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
        (counter (event ee))
    }
  f (snd value)
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (a /\ b)

cycle :: (Event Unit -> Event Nut )-> Nut
cycle = switcher identity

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped :: forall a. (Event Unit -> Event a) -> (a -> Nut) -> Nut
switcherFlipped a b = switcher b a

infixl 1 switcherFlipped as <#~>
