-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core
  ( Attribute
  , Attribute'
  , Cb(..)
  , Key(..)
  , Value(..)
  , Namespace(..)
  , Tag(..)

  , MakeElement
  , SetCb
  , SetProp
  , UnsetAttribute
  , AttachElement
  , RemoveElement
  , MakeText
  , SetText
  , AttachText
  , RemoveText
  , BufferPortal
  , BeamRegion

  , DOMInterpret(..)
  , Hook
  , Hook'
  , Nut(..)
  , PSR(..)
  , ScopeDepth(..)
  , newPSR
  , pump
  , handleScope
  , attributeAtYourOwnRisk
  , callbackWithCaution
  , cb
  , cb'

  , elementify
  , fixed
  , prop'
  , text
  , text_
  , unsafeAttribute
  , unsafeUnAttribute
  , unset'
  , useDeflect

  , DynOptions
  , dynOptions
  , useDyn
  , useDynAtBeginning
  , useDynAtBeginningWith
  , useDynAtEnd
  , useDynAtEndWith
  , useDynWith

  , useHot
  , useHotRant
  , useMailboxed
  , useMailboxedS
  , useRant
  , useRant'
  , useRef
  , useRefST
  , useSplit
  , useState
  , useState'
  , useStateTagged'
  , portal
  , defer
  , deferO
  , xdata
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn1, STFn2, mkSTFn1, mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over, un)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Do as Deku
import Deku.Internal.Entities (DekuChild(..), DekuElement, DekuParent(..), DekuText, fromDekuElement, toDekuElement)
import Deku.Internal.Region (Anchor(..), Bound, Region(..), StaticRegion(..), allocateRegion, fromParent, newSpan, newStaticRegion)
import Effect (Effect, forE)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, mkEffectFn1, mkEffectFn2, mkEffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import FRP.Event as Event
import FRP.Event.Class (once)
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Partial.Unsafe (unsafePartial)
import Safe.Coerce (coerce)
import Web.DOM (Element)
import Web.Event.Internal.Types (Event)

-- | A callback function that can be used as a value for a listener.
newtype Key = Key String
newtype Value = Value String
newtype Cb = Cb (Event -> Effect Boolean)

-- | Construct a `cb`. This is an alias for the newtype constructor.
cb :: (Event -> Effect Unit) -> Cb
cb = Cb <<< ((map <<< map) (const true))

prop' :: String -> String -> Attribute'
prop' k v = mkEffectFn2 \e (DOMInterpret { setProp }) ->
  runEffectFn3 setProp (Key k) (Value v) (toDekuElement e)

cb' :: String -> Cb -> Attribute'
cb' k v = mkEffectFn2 \e (DOMInterpret { setCb }) ->
  runEffectFn3 setCb (Key k) v (toDekuElement e)

unset' :: String -> Attribute'
unset' k = mkEffectFn2 \e (DOMInterpret { unsetAttribute }) ->
  runEffectFn2 unsetAttribute (Key k) (toDekuElement e)

-- TODO: get rid of `Element` type
type Attribute' =
  EffectFn2 Element DOMInterpret Unit

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype Attribute :: Row Type -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute
  :: forall e. Attribute e -> EffectFn2 Element DOMInterpret Unit
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: forall e. EffectFn2 Element DOMInterpret Unit -> Attribute e
unsafeAttribute = Attribute

attributeAtYourOwnRisk :: forall e. String -> String -> Attribute e
attributeAtYourOwnRisk k v = unsafeAttribute $ mkEffectFn2
  \e (DOMInterpret { setProp }) ->
    runEffectFn3 setProp (Key k) (Value v) (toDekuElement e)

callbackWithCaution
  :: forall e. String -> (Event -> Effect Boolean) -> Attribute e
callbackWithCaution k v = unsafeAttribute $ mkEffectFn2
  \e (DOMInterpret { setCb }) ->
    runEffectFn3 setCb (Key k) (Cb v) (toDekuElement e)

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> String -> Attribute e
xdata k v =
  attributeAtYourOwnRisk ("data-" <> k) v

newtype Tag = Tag String
newtype Namespace = Namespace String

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  EffectFn2 (Maybe Namespace) Tag DekuElement

type RemoveElement = EffectFn1 DekuElement Unit
type RemoveText = EffectFn1 DekuText Unit

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom
-- | backend.
type AttachElement =
  EffectFn2 DekuChild Anchor Unit

type AttachText =
  EffectFn2 DekuText Anchor Unit

-- | Type used by Deku backends to construct a text element. For internal use only unless you're writing a custom
-- | backend.
type MakeText = EffectFn1 (Maybe String) DekuText

-- | Type used by Deku backends to set the text of a text element. For internal use only unless you're writing a custom
-- | backend.
type SetText = EffectFn2 String DekuText Unit

-- | Type used by Deku backends to unset an attribute. For internal use only unless you're writing a custom backend.
type UnsetAttribute =
  EffectFn2 Key DekuElement Unit

-- | Type used by Deku backends to set an attribute. For internal use only unless you're writing a custom backend.
type SetProp = EffectFn3 Key Value DekuElement Unit

-- | Type used by Deku backends to set a listener. For internal use only unless you're writing a custom backend.
type SetCb =
  EffectFn3 Key Cb DekuElement Unit

-- | This effect takes 3 `Anchor`s and moves the elements "between" the first and second `Anchor` "after" the last
-- | `Anchor`. Because `Anchor` includes `Node`s and `ParentNode`s we'll have to define "between" and "after".
-- | - between: A region is the collection of elements after the beginning up and including the end. The beginning is
-- |   never included in the collection. This means that when begin and end point to the same `Node` the collection is
-- |   empty. 
-- | - after: This is more straightforward: for `Node`s it's simply after the `Node` and for `ParentNode` its before the
-- |   first child `Node`.
type BeamRegion =
  EffectFn3 Anchor Anchor Anchor Unit

-- | Generates a place for portals to render into that will not be displayed immediatly.
type BufferPortal =
  Effect DekuParent

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA.
-- , SSR, and hydrated SSR.
newtype DOMInterpret = DOMInterpret
  { makeElement :: MakeElement
  , setProp :: SetProp
  , setCb :: SetCb
  , unsetAttribute :: UnsetAttribute
  , attachElement :: AttachElement
  , removeElement :: RemoveElement
  --
  , makeText :: MakeText
  , setText :: SetText
  , attachText :: AttachText
  , removeText :: RemoveText
  -- 
  , bufferPortal :: BufferPortal
  , beamRegion :: BeamRegion
  }

derive instance Newtype DOMInterpret _

-- | Tracks the depths of the current dispose action. The initial level will be `ScopeDepth 0`. Every descent into an
-- | `elementify` `Nut` will increase the depth.
newtype ScopeDepth =
  ScopeDepth Int

derive instance Newtype ScopeDepth _

newtype PSR = PSR
  { lifecycle :: Poll.Poll ScopeDepth
  -- used by `Nut`s to register or clear the last element of their region.
  , region :: StaticRegion
  -- scope
  , defer :: STFn1 (EffectFn1 ScopeDepth Unit) Global Unit
  , dispose :: EffectFn1 ScopeDepth Unit
  }

derive instance Newtype PSR _

-- | Handles an optimized `Poll` by running the effect on each emitted value. Any resulting subscription gets written to 
-- | the given cleanup array.
pump :: forall a. EffectFn3 PSR (Poll.Poll a) (EffectFn1 a Unit) Unit
pump = mkEffectFn3 \(PSR { defer: def }) p eff -> do
  let
    handleEvent :: EffectFn1 (Event.Event a) Unit
    handleEvent = mkEffectFn1 \y -> do
      uu <- runEffectFn2 Event.subscribeO y eff
      void $ liftST $ runSTFn1 def $ mkEffectFn1 \_ -> uu

    go :: EffectFn1 (Poll a) Unit
    go = mkEffectFn1 case _ of
      OnlyEvent x -> runEffectFn1 handleEvent x
      OnlyPure x -> runEffectFn2 Event.fastForeachE x eff
      OnlyPoll x -> do
        bang <- liftST $ Event.create
        runEffectFn1 handleEvent (UPoll.sample x bang.event)
        bang.push identity
      PureAndEvent x y -> do
        runEffectFn1 go (OnlyPure x)
        runEffectFn1 go (OnlyEvent y)
      PureAndPoll x y -> do
        runEffectFn1 go (OnlyPure x)
        runEffectFn1 go (OnlyPoll y)

  runEffectFn1 go p

newPSR :: STFn2 (Poll.Poll ScopeDepth) StaticRegion Global PSR
newPSR = mkSTFn2 \lifecycle region -> do
  unsubs <- STArray.new
  let
    doDefer :: STFn1 (EffectFn1 ScopeDepth Unit) Global Unit
    doDefer =
      mkSTFn1 \eff -> void (STArray.push eff unsubs)

    -- to correctly dispose, effect should be run in the reverse order of insertion
    dispose :: EffectFn1 ScopeDepth Unit
    dispose = mkEffectFn1 \d -> do
      stack <- liftST $ STArray.unsafeFreeze unsubs
      let l = Array.length stack
      forE 0 l \i -> do
        runEffectFn1 (unsafePartial $ Array.unsafeIndex stack (l - 1 - i)) d

  pure (PSR { lifecycle: once lifecycle, region, defer: doDefer, dispose })

handleScope :: EffectFn1 PSR Unit
handleScope = mkEffectFn1 \psr -> do
  runEffectFn3 pump psr (un PSR psr).lifecycle (un PSR psr).dispose

newtype Nut =
  Nut (EffectFn2 PSR DOMInterpret Unit)

instance Semigroup Nut where
  append (Nut a) (Nut b) =
    -- unrolled version of `fixed`
    Nut $ mkEffectFn2 \psr di -> do
      -- first `Nut` should not handle any unsubs, they may still be needed for later elements
      emptyScope <- liftST $ runSTFn2 newPSR (un PSR psr).lifecycle
        (un PSR psr).region

      runEffectFn2 a emptyScope di
      runEffectFn2 b psr di

instance Monoid Nut where
  mempty =
    -- while we contribute no UI elements we still have to handle any deferred effects by our hooks
    Nut $ mkEffectFn2 \psr _ -> runEffectFn1 handleScope psr

-- hooks

type Hook' a r = (a -> r) -> Nut
type Hook a = (a -> Nut) -> Nut

useDeflect :: forall a. Poll a -> Hook (Poll a)
useDeflect e f = Nut $ mkEffectFn2 \psr di -> do
  d <- liftST $ Poll.deflect e
  runEffectFn2 (coerce $ f d) psr di

useHot
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ Poll a)
useHot a f = Deku.do
  push /\ poll <- useState'
  r <- useRefST a poll
  f (push /\ (Poll.stToPoll r <|> poll))

useHotRant :: forall a. Poll a -> Hook (Poll a)
useHotRant e f = Deku.do
  r <- useRefST Nothing (Just <$> e)
  p <- useRant e
  -- we `once e` in case it has an initial value
  f $ compact (Poll.stToPoll r <|> (Just <$> p))

useMailboxed
  :: forall a b
   . Ord a
  => Hook (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Poll b))
useMailboxed f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.mailbox
  runEffectFn2 (coerce $ f (push /\ poll)) psr di

useMailboxedS
  :: forall b
   . Hook
       ( ({ address :: String, payload :: b } -> Effect Unit) /\
           (String -> Poll b)
       )
useMailboxedS f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.mailboxS
  runEffectFn2 (coerce $ f (push /\ poll)) psr di

useRant :: forall a. Poll a -> Hook (Poll a)
useRant e f = Nut $ mkEffectFn2 \psr di -> do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  runEffectFn2 deferO psr (liftST unsubscribe)
  runEffectFn2 (coerce $ f poll) psr di

useSplit :: forall a. Poll a -> Hook { first :: Poll a, second :: Poll a }
useSplit e f = Nut $ mkEffectFn2 \psr di -> do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  p0 <- liftST $ Poll.create
  p1 <- liftST $ Poll.create
  e0 <- liftST $ Event.create
  o <- Event.subscribe (Poll.sample poll e0.event) \i -> do
    p0.push i
    p1.push i
  e0.push identity
  runEffectFn2 deferO psr (o *> liftST unsubscribe)
  runEffectFn2 (coerce $ f { first: p0.poll, second: p1.poll }) psr di

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> Hook ((t -> Effect Unit) /\ Poll a)
useRant' f0 f1 = Deku.do
  push /\ e <- useState'
  m <- useRant (f0 e)
  f1 (push /\ m)

useRef :: forall a. a -> Poll a -> Hook (Effect a)
useRef a b f = Deku.do
  r <- useRefST a b
  f (liftST r)

deferO :: EffectFn2 PSR (Effect Unit) Unit
deferO = mkEffectFn2 \psr eff -> liftST (runSTFn1 (un PSR psr).defer (mkEffectFn1 \_ -> eff))

defer :: PSR -> Effect Unit -> Effect Unit
defer =
  runEffectFn2 deferO

useRefST :: forall a. a -> Poll a -> Hook (ST.ST Global a)
useRefST a e f = Nut $ mkEffectFn2 \psr di -> do
  r <- liftST $ ST.new a
  { event, push } <- liftST $ Event.create
  u <- Event.subscribe (Poll.sample e event) \i -> void $ liftST $ ST.write i r
  push identity
  let Nut nut = f (ST.read r)
  runEffectFn2 deferO psr u
  runEffectFn2 nut psr di

useState' :: forall a. Hook ((a -> Effect Unit) /\ Poll a)
useState' f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.create
  let Nut nut = f (push /\ poll)
  runEffectFn2 nut psr di

useStateTagged' :: forall a. String -> Hook ((a -> Effect Unit) /\ Poll a)
useStateTagged' tag f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.createTagged tag
  let Nut nut = f (push /\ poll)
  runEffectFn2 nut psr di

useState :: forall a. a -> Hook ((a -> Effect Unit) /\ Poll a)
useState a f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.create
  let Nut nut = f (push /\ (pure a <|> poll))
  runEffectFn2 nut psr di

-- dyn
type DynOptions value =
  { sendTo :: value -> Poll Int, remove :: value -> Poll Unit }

type DynControl value =
  { value :: value
  , position :: Poll Int
  , remove :: Effect Unit
  , sendTo :: Int -> Effect Unit
  }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ -> empty, remove: \_ -> empty }

useDyn
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> Hook (DynControl value)
useDyn p = useDynWith p dynOptions

useDynAtBeginning
  :: forall value
   . Poll value
  -> Hook (DynControl value)
useDynAtBeginning b = useDynAtBeginningWith b dynOptions

useDynAtBeginningWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook (DynControl value)
useDynAtBeginningWith e = useDynWith (map (Just 0 /\ _) e)

useDynAtEnd
  :: forall value
   . Poll value
  -> Hook (DynControl value)
useDynAtEnd b = useDynAtEndWith b dynOptions

useDynAtEndWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook (DynControl value)
useDynAtEndWith e = useDynWith (map (Nothing /\ _) e)

useDynWith
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> DynOptions value
  -> Hook (DynControl value)
useDynWith elements options cont = Nut $ mkEffectFn2 \psr di -> do
  Region region <- liftST $ (un StaticRegion (un PSR psr).region).region
  span <- liftST $ runSTFn2 newSpan region.begin region.bump

  let
    handleElements :: EffectFn1 (Tuple (Maybe Int) value) Unit
    handleElements = mkEffectFn1 \(Tuple initialPos value) -> do
      Region eltRegion <- liftST $ runSTFn2 allocateRegion initialPos span
      staticRegion <- liftST $ runSTFn2 newStaticRegion eltRegion.begin
        eltRegion.bump

      -- this controls whether the user can influence the element via `remove` or `sentTo`, it will change to `false`
      -- after initialization and back to `true` before removal. This means that the user is only in control the element
      -- between initialization and removal.
      eltDisposed <- liftST $ ST.new true

      eltSendTo <- liftST Poll.create
      let
        sendTo :: Poll Int
        sendTo =
          Poll.merge [ options.sendTo value, eltSendTo.poll ]

      eltRemove <- liftST Poll.create
      let
        remove :: Poll ScopeDepth
        remove =
          Poll.merge
            [ const (ScopeDepth 0) <$> options.remove value
            , const (ScopeDepth 0) <$> eltRemove.poll
            , (un PSR psr).lifecycle
            ]

      eltLifecycle <- liftST Poll.create
      eltPSR <- liftST $ runSTFn2 newPSR eltLifecycle.poll staticRegion
      let
        Nut nut = cont
          { value
          , position: eltRegion.position
          , remove: eltRemove.push unit
          , sendTo: eltSendTo.push
          }

        handleSendTo :: EffectFn1 Int Unit
        handleSendTo = mkEffectFn1 \newPos -> do
          whenM (not <$> liftST (ST.read eltDisposed)) do
            fromBegin <- liftST eltRegion.begin
            fromEnd <- liftST eltRegion.end
            liftST $ runSTFn1 eltRegion.sendTo newPos

            target <- liftST eltRegion.begin
            runEffectFn3 (un DOMInterpret di).beamRegion fromBegin fromEnd
              target

        -- | We need explicit ordering here, if just pass the lifecycle of the parent to the child element it is not 
        -- | guarantueed that the child will dispose itself before the parent.
        handleRemove :: EffectFn1 ScopeDepth Unit
        handleRemove = mkEffectFn1 \depth -> do
          whenM (not <$> liftST (ST.read eltDisposed)) do
            -- disable user control
            void $ liftST $ ST.write true eltDisposed
            eltLifecycle.push depth
            liftST eltRegion.remove

      runEffectFn3 pump eltPSR sendTo handleSendTo
      runEffectFn3 pump eltPSR (once remove) handleRemove
      runEffectFn2 nut eltPSR di
      -- enable user control
      void $ liftST $ ST.write false eltDisposed
      
  runEffectFn3 pump psr elements handleElements
  runEffectFn1 handleScope psr

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2 \psr di -> do
  emptyScope <- liftST $ runSTFn2 newPSR (un PSR psr).lifecycle
    (un PSR psr).region
  let
    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \(Nut nut) ->
      runEffectFn2 nut emptyScope di

  -- run `nuts` with separate scope
  runEffectFn2 Event.fastForeachE nuts handleNuts
  -- actually handle the scope
  runEffectFn1 handleScope psr

elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag arrAtts nuts = Nut $ mkEffectFn2 \psr di -> do
  elt <- runEffectFn2 (un DOMInterpret di).makeElement (Namespace <$> ns)
    (Tag tag)
  regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
  liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element
    (Element (elt))

  let
    handleAtts :: EffectFn1 (Poll (Attribute element)) Unit
    handleAtts = mkEffectFn1 \atts ->
      runEffectFn3 pump psr atts $ mkEffectFn1 \(Attribute x) ->
        runEffectFn2 x (fromDekuElement elt) di
  runEffectFn2 Event.fastForeachE arrAtts handleAtts

  eltRegion <- liftST $ runSTFn1 fromParent $ DekuParent elt
  let
    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \(Nut nut) -> do
      scope <- liftST $ runSTFn2 newPSR
        (over ScopeDepth (add 1) <$> (un PSR psr).lifecycle)
        eltRegion
      runEffectFn2 nut scope di
  runEffectFn2 Event.fastForeachE nuts handleNuts

  let 
    handleRemove :: EffectFn1 ScopeDepth Unit
    handleRemove = mkEffectFn1 case _ of
      ScopeDepth 0 ->
        runEffectFn1 (un DOMInterpret di).removeElement elt

      -- on higher `ScopeDepth`s we don't have to do anything, when this ancestor has been removed this will also
      -- disappear from screen
      _ ->
        pure unit

  runEffectFn2 (un DOMInterpret di).attachElement (DekuChild elt) regionEnd
  liftST $ runSTFn1 (un PSR psr).defer handleRemove

  runEffectFn1 handleScope psr

text_ :: String -> Nut
text_ txt =
  text (pure @Poll txt)

text :: Poll String -> Nut
text texts = Nut $ mkEffectFn2 \psr di -> do
  let
    handleTextUpdate :: EffectFn2 (Event.Event String) DekuText Unit
    handleTextUpdate = mkEffectFn2 \xs txt -> do
      sub <- runEffectFn2 Event.subscribeO xs $ mkEffectFn1 \x ->
        runEffectFn2 (un DOMInterpret di).setText x txt
      liftST $ runSTFn1 (un PSR psr).defer $ mkEffectFn1 \_ -> sub

  txt <- case texts of
    OnlyPure xs -> do
      runEffectFn1 (un DOMInterpret di).makeText (Array.last xs)

    OnlyEvent e -> do
      txt <- runEffectFn1 (un DOMInterpret di).makeText Nothing
      runEffectFn2 handleTextUpdate e txt
      pure txt

    OnlyPoll p -> do
      txt <- runEffectFn1 (un DOMInterpret di).makeText Nothing
      bang <- liftST Event.create
      runEffectFn2 handleTextUpdate (UPoll.sample p bang.event) txt
      bang.push identity
      pure txt

    PureAndEvent xs e -> do
      txt <- runEffectFn1 (un DOMInterpret di).makeText (Array.last xs)
      runEffectFn2 handleTextUpdate e txt
      pure txt

    PureAndPoll xs p -> do
      txt <- runEffectFn1 (un DOMInterpret di).makeText (Array.last xs)
      bang <- liftST Event.create
      runEffectFn2 handleTextUpdate (UPoll.sample p bang.event) txt
      bang.push identity
      pure txt

  regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
  runEffectFn2 (un DOMInterpret di).attachText txt regionEnd
  liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element (Text txt)

  let
    handleRemove :: EffectFn1 ScopeDepth Unit
    handleRemove = mkEffectFn1 case _ of
      ScopeDepth 0 ->
        runEffectFn1 (un DOMInterpret di).removeText txt

      -- like `elementify` we rely on our ancestor for removal
      _ ->
        pure unit

  liftST $ runSTFn1 (un PSR psr).defer handleRemove
  runEffectFn1 handleScope psr

-- | Creates a `Nut` that can be attached to another part of the application. The lifetime of the `Nut` is no longer
-- | than that of `Nut` that created it.
-- maybe also attach the lifetime to its mountpoints and/or do reference counting
portal :: Nut -> Hook Nut
portal (Nut toBeam) cont = Nut $ mkEffectFn2 \psr di -> do

  -- set up a StaticRegion for the portal contents and track its begin and end
  buffer <- pure @(ST.ST Global) <<< ParentStart <$>
    (un DOMInterpret di).bufferPortal
  trackBegin <- liftST $ ST.new buffer
  trackEnd <- liftST $ ST.new $ Nothing @Anchor

  -- signal for other locations of the portal that its contents have moved
  beamed <- liftST Event.create
  bumped <- liftST Event.createPure

  staticBuffer <- liftST $ runSTFn2 newStaticRegion
    (join $ ST.read trackBegin)
    ( mkSTFn1 \bound -> do
        void $ ST.write bound trackEnd
        bumped.push bound
    )
  runEffectFn2 toBeam
    (over PSR _ { region = staticBuffer } psr)
    di

  let
    Nut hooked = cont $ portaled buffer (beamed.push unit) beamed.event
      bumped.event
      trackBegin
      trackEnd

    -- | We can't rely on our ancestor to move our nodes of the screen so we move portaled content of the screen back
    -- | into the buffer. Afterwards we mark the buffer as empty so all references get lost.
    dispose :: Effect Unit
    dispose = do
      beamed.push unit
      begin <- liftST $ join $ ST.read trackBegin
      end <- liftST $ ST.read trackEnd
      target <- liftST buffer
      runEffectFn3 (un DOMInterpret di).beamRegion begin (fromMaybe begin end)
        target
      void $ liftST $ ST.write Nothing trackEnd

  runEffectFn2 deferO psr dispose
  runEffectFn2 hooked psr di

portaled
  :: Bound
  -> Effect Unit
  -> Event.Event Unit
  -> Event.Event (Maybe Anchor)
  -> ST.STRef Global Bound
  -> ST.STRef Global (Maybe Anchor)
  -> Nut
portaled buffer beam beamed bumped trackBegin trackEnd =
  Nut $ mkEffectFn2 \psr di -> do

    -- signal to other portaled `Nut`s that we are about to steal their content
    beam

    -- set up region and its eventual cleanup
    Region region <- liftST (un StaticRegion (un PSR psr).region).region
    stolen <- liftST $ ST.new false

    unsubBeamed <- runEffectFn2 Event.subscribeO beamed $ mkEffectFn1 \_ -> do
      whenM (not <$> liftST (ST.read stolen)) do
        void $ liftST $ ST.write true stolen

    unsubBumped <- runEffectFn2 Event.subscribeO bumped $ mkEffectFn1 $ liftST
      <<< runSTFn1 region.bump

    -- region starts empty, only bump when we actually have an end
    liftST $ ST.read trackEnd >>= traverse_ (runSTFn1 region.bump <<< Just)

    -- actuall insert portal contents
    do
      begin <- liftST $ join $ ST.read trackBegin
      end <- liftST $ ST.read trackEnd
      target <- liftST region.begin
      runEffectFn3 (un DOMInterpret di).beamRegion begin (fromMaybe begin end)
        target

    -- update the tracked begin so other portaled `Nut`s can steal the contents correctly
    void $ liftST $ ST.write region.begin trackBegin

    -- lifecycle handling
    liftST $ runSTFn1 (un PSR psr).defer $ mkEffectFn1 \_ -> (unsubBeamed *> unsubBumped)

    let
      restoreBuffer :: Effect Unit
      restoreBuffer = do
        whenM (not <$> liftST (ST.read stolen)) do
          -- send portaled content back to buffer
          begin <- liftST region.begin
          end <- liftST $ ST.read trackEnd
          target <- liftST buffer
          runEffectFn3 (un DOMInterpret di).beamRegion begin
            (fromMaybe begin end)
            target
          void $ liftST $ ST.write buffer trackBegin
          void $ liftST $ ST.write true stolen

    runEffectFn2 deferO psr restoreBuffer
    runEffectFn1 handleScope psr