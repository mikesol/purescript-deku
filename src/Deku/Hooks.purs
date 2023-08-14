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
  , useHot
  , useDynAtEndWith
  , useDynWith
  , useEffect
  , useMailboxed
  , useRant
  , useDeflect
  , useState'
  , useRant'
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
import Control.Alt (alt, (<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Foldable (oneOf)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Child(..), DOMInterpret(..), DekuExtra, Hook, Node(..), Node', Nut(..), NutF(..), dyn, remove, sendToPos, unsafeSetPos)
import Deku.Do as Deku
import Effect (Effect)
import FRP.Event (Event, filterMap, mailbox, mapAccum, merge)
import FRP.Poll (Poll, sample, sample_, stToPoll)
import FRP.Poll as Poll

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
useState'
  :: forall a
   . Hook ((a -> Effect Unit) /\ Poll a)
useState' f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving \ee _ subscribe -> do
    { poll, push } <- Poll.create
    let
      Nut nf = f (push /\ poll)
    subscribe (sample (__internalDekuFlatten nf i di) ee)

useState
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ Poll a)
useState a f = Deku.do
  p <- useState'
  f (map (alt (pure a)) p)

useHot
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ Poll a)
useHot a f = Deku.do
  push /\ poll <- useState'
  r <- useRefST a poll
  f (push /\ stToPoll r)

guard :: Poll Boolean -> Nut -> Nut
guard b e = switcher (if _ then e else mempty) b

guardWith :: forall a. (Poll (Maybe a)) -> (a -> Nut) -> Nut
guardWith m f = m <#~> case _ of
  Just x -> f x
  Nothing -> mempty

useEffect
  :: Poll (Effect Unit)
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
        , sample_ ((\effect -> ff (oneOffEffect { effect })) <$> e) ee

        ]
    subscribe exv identity

useRant :: forall a. Poll a -> Hook (Poll a)
useRant e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving' \_ ee _ subscribe -> do
    -- todo: should we incorporate the unsub?
    { poll: p } <- Poll.rant e
    -- we `once e` in case it has an initial value
    let Nut nf = f p
    subscribe (sample (__internalDekuFlatten nf i di) ee) identity

useDeflect :: forall a. Poll a -> Hook (Poll a)
useDeflect e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving' \_ ee _ subscribe -> do
    -- todo: should we incorporate the unsub?
    p <- Poll.deflect e
    -- we `once e` in case it has an initial value
    let Nut nf = f p
    subscribe (sample (__internalDekuFlatten nf i di) ee) identity

-- | A hook to work with memoized values that lack an initial value. See [`useRant'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> (Tuple (t -> Effect Unit) (Poll a) -> Nut)
  -> Nut
useRant' f0 makeHook = Deku.do
  push /\ e <- useState'
  m <- useRant (f0 e)
  makeHook (push /\ m)

useRef ∷ ∀ a. a → Poll a → Hook (Effect a)
useRef a b f = useRefST a b \x -> f $ liftST x

useRefNE ∷ ∀ a. NonEmpty Poll a → Hook (Effect a)
useRefNE a f = useRefSTNE a \x -> f $ liftST x

useRefSTNE
  :: forall a
   . NonEmpty Poll a
  -> Hook (ST Global a)
useRefSTNE (NonEmpty x y) = useRefST x y

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRefST
  :: forall a
   . a
  -> Poll a
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
    subscribe (sample_ e ee) \_ x -> do
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
  { sendTo :: v -> Poll Int, remove :: v -> Poll Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ -> empty, remove: \_ -> empty }

useDyn
  :: forall value
   . Poll (Tuple Int value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn y = useDynWith y dynOptions

useDynWith
  :: forall value
   . (Poll (Tuple Int value))
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
    c1 <- Poll.mailbox
    let
      mc ix (Tuple pos v) = Tuple
        ( oneOf
            [ opts.remove v $> Child BCore.Remove
            , Child <<< BCore.Logic <$> opts.sendTo v
            , c1.poll ix
            ]
        )
        ( unsafeSetPos pos $ f
            { value: v
            , remove: c1.push { address: ix, payload: remove }
            , sendTo: c1.push <<< { address: ix, payload: _ } <<< sendToPos
            }
        )
    let
      Nut nf = dyn $ mapWithIndex mc e
    subscribe (sample (__internalDekuFlatten nf i di) ee)

useDynAtBeginningWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginningWith e = useDynWith (map (0 /\ _) e)

useDynAtBeginning
  :: forall value
   . Poll value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginning b = useDynAtBeginningWith b dynOptions

useDynAtEndWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEndWith e = useDynWith
  (mapAccum (\a b -> (a + 1) /\ (a /\ b)) 0 e)

useDynAtEnd
  :: forall value
   . Poll value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEnd b = useDynAtEndWith b dynOptions

-- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- | and creates a `Nut`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher :: forall a. (a -> Nut) -> Poll a -> Nut
switcher f poll = Deku.do
  ctr <- useRant (counter poll)
  dctr <- useDeflect (counter poll)
  { value } <- useDynAtBeginningWith (ctr <|> dctr) $ dynOptions
    { remove = \(Tuple oldV _) -> filterMap
        (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
        ctr
    }
  f (snd value)
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (a /\ b)

cycle :: Poll Nut -> Nut
cycle = switcher identity

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped :: forall a. Poll a -> (a -> Nut) -> Nut
switcherFlipped a b = switcher b a

infixl 1 switcherFlipped as <#~>
