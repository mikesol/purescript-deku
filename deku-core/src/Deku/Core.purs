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
  , ParentId(..)
  , ChildId(..)
  , AttrIndex(..)
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
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn3, runSTFn1, runSTFn2, runSTFn3, runSTFn4)
import Control.Plus (empty)
import Data.Array (length)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Foldable (traverse_)
import Data.FoldableWithIndex (forWithIndex_)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, over, un)
import Data.Set as Set
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Debug (spy)
import Deku.Do as Deku
import Deku.Internal.Entities (DekuChild(..), DekuElement, DekuParent(..), DekuText, fromDekuElement, toDekuElement)
import Deku.Internal.Region (Anchor(..), Bound, ElementId(..), Region(..), StaticRegion(..), allocateRegion, fromParent, newSpan, newStaticRegion)
import Effect (Effect, forE)
import Effect.Console (log)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, mkEffectFn1, mkEffectFn2, mkEffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import FRP.Event as Event
import FRP.Event.Class (once)
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Partial.Unsafe (unsafePartial)
import Safe.Coerce (coerce)
import Web.DOM (Element)
import Web.DOM.DOMParser (_getParserError)
import Web.Event.Internal.Types (Event)

-- | A callback function that can be used as a value for a listener.
newtype Key = Key String
newtype Value = Value String
newtype Cb = Cb (Event -> Effect Boolean)

-- | Construct a `cb`. This is an alias for the newtype constructor.
cb :: (Event -> Effect Unit) -> Cb
cb = Cb <<< ((map <<< map) (const true))

prop' :: String -> String -> Attribute'
prop' k v = mkEffectFn4 \id ix e (DOMInterpret { setProp, markIndexAsNeedingHydration }) -> do
  when (Set.member k dynamicKeywords) $ liftST $ runSTFn2 markIndexAsNeedingHydration id ix
  runEffectFn3 setProp (Key k) (Value v) (toDekuElement e)

cb' :: String -> Cb -> Attribute'
cb' k v = mkEffectFn4
  \id ix e (DOMInterpret { markIndexAsNeedingHydration, setCb }) -> do
    liftST $ runSTFn2 markIndexAsNeedingHydration id ix
    runEffectFn3 setCb (Key k) v (toDekuElement e)

unset' :: String -> Attribute'
unset' k = mkEffectFn4 \_ _ e (DOMInterpret { unsetAttribute }) ->
  runEffectFn2 unsetAttribute (Key k) (toDekuElement e)

-- TODO: get rid of `Element` type
type Attribute' =
  EffectFn4 ElementId AttrIndex Element DOMInterpret Unit

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only.
newtype Attribute :: Row Type -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute :: forall e. Attribute e -> Attribute'
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: forall e. EffectFn4 ElementId AttrIndex Element DOMInterpret Unit -> Attribute e
unsafeAttribute = Attribute

dynamicKeywords :: Set.Set String
dynamicKeywords = Set.fromFoldable ["checked", "value", "disabled"]

attributeAtYourOwnRisk :: forall e. String -> String -> Attribute e
attributeAtYourOwnRisk k v = unsafeAttribute $ mkEffectFn4
  \_ _getParserError e (DOMInterpret { setProp }) -> do
    runEffectFn3 setProp (Key k) (Value v) (toDekuElement e)

callbackWithCaution
  :: forall e. String -> (Event -> Effect Boolean) -> Attribute e
callbackWithCaution k v = unsafeAttribute $ mkEffectFn4
  \id ix e (DOMInterpret { markIndexAsNeedingHydration, setCb }) -> do
    liftST $ runSTFn2 markIndexAsNeedingHydration id ix
    runEffectFn3 setCb (Key k) (Cb v) (toDekuElement e)

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> String -> Attribute e
xdata k v =
  attributeAtYourOwnRisk ("data-" <> k) v

newtype Tag = Tag String
newtype Namespace = Namespace String

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  EffectFn3 ElementId (Maybe Namespace) Tag DekuElement

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
type MakeText = EffectFn3 ElementId (Maybe String) Boolean DekuText

-- | Type used by Deku backends to set the text of a text element. For internal use only unless you're writing a custom
-- | backend.
type SetText = EffectFn4 Int String DekuText Boolean Unit

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
type BufferPortal = Effect DekuParent

newtype ParentId = ParentId Int

derive instance Newtype ParentId _
derive newtype instance Eq ParentId
derive newtype instance Ord ParentId
newtype ChildId = ChildId Int

derive instance Newtype ChildId _
derive newtype instance Eq ChildId
derive newtype instance Ord ChildId

newtype AttrIndex = AttrIndex Int

derive instance Newtype AttrIndex _
derive newtype instance Eq AttrIndex
derive newtype instance Ord AttrIndex

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA.
-- , SSR, and hydrated SSR.
newtype DOMInterpret = DOMInterpret
  { tagger :: ST.ST Global Int
  , dynamicDOMInterpret :: Unit -> DOMInterpret
  , registerParentChildRelationship :: STFn2 ParentId ChildId Global Unit
  , disqualifyFromStaticRendering :: STFn1 ElementId Global Unit
  , isBoring :: ElementId -> Boolean
  , makeElement :: MakeElement
  , incrementElementCount :: STFn1 StaticRegion Global Unit
  , shouldSkipAttribute :: ElementId -> AttrIndex -> Boolean
  , markIndexAsNeedingHydration :: STFn2 ElementId AttrIndex Global Unit
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
  , incrementPureTextCount :: STFn1 StaticRegion Global Unit
  -- 
  , bufferPortal :: BufferPortal
  , beamRegion :: BeamRegion
  }

derive instance Newtype DOMInterpret _

-- | Handles an optimized `Poll` by running the effect on each emitted value. Any resulting subscription gets written to 
-- | the given cleanup array.
pump'
  :: forall a
   . PSR
  -> Poll a
  -> (Boolean -> EffectFn1 a Unit)
  -> Effect Unit
pump' (PSR { defer: def }) p effF =
  go p
  where
  staticEff = effF true
  dynamicEff = effF false

  handleEvent :: Event.Event a -> Effect Unit
  handleEvent y = do
    uu <- runEffectFn2 Event.subscribeO y dynamicEff
    void $ liftST $ runSTFn1 def uu

  handlePoll
    :: ST.STRef Global (EffectFn1 a Unit) -> Event.Event a -> Effect Unit
  handlePoll whichF y = do
    uu <- runEffectFn2 Event.subscribeO y $ mkEffectFn1 \i -> do
      f <- liftST $ ST.read whichF
      runEffectFn1 f i
    void $ liftST $ runSTFn1 def uu

  go :: Poll a -> Effect Unit
  go = case _ of
    OnlyEvent x -> handleEvent x
    OnlyPure x -> runEffectFn2 Event.fastForeachE x staticEff
    OnlyPoll x -> do
      bang <- liftST $ Event.create
      -- start with the statif function
      f <- liftST $ ST.new staticEff
      handlePoll f (UPoll.sample x bang.event)
      bang.push identity
      -- after we peel off the "pure" values, switch to the dynamic function
      liftST $ void $ ST.write dynamicEff f
    PureAndEvent x y -> do
      go (OnlyPure x)
      go (OnlyEvent y)
    PureAndPoll x y -> do
      go (OnlyPure x)
      go (OnlyPoll y)

pump
  :: forall a
   . PSR
  -> Poll a
  -> EffectFn1 a Unit
  -> Effect Unit
pump psr poll fn = pump' psr poll (const fn)

newtype PSR = PSR
  { lifecycle :: Poll.Poll Unit
  -- used by `Nut`s to register or clear the last element of their region.
  , region :: StaticRegion
  -- used to indicate when an element should never be statically rendered
  -- it may be disqualified for other reasons, but this flag trumps them all
  , disqualifyFromStaticRendering :: Boolean
  -- scope
  , defer :: STFn1 (Effect Unit) Global Unit
  , dispose :: Effect Unit
  }

derive instance Newtype PSR _

newPSR :: STFn3 Boolean (Poll.Poll Unit) StaticRegion Global PSR
newPSR = mkSTFn3 \disqualifyFromStaticRendering lifecycle region -> do
  unsubs <- STArray.new
  let
    doDefer :: STFn1 (Effect Unit) Global Unit
    doDefer =
      mkSTFn1 \eff -> void (STArray.push eff unsubs)

    -- to correctly dispose, effect should be run in the reverse order of insertion
    dispose :: Effect Unit
    dispose = do
      -- runEffectFn1 Event.fastForeachThunkE =<< liftST (STArray.unsafeFreeze unsubs)
      stack <- liftST $ STArray.unsafeFreeze unsubs
      let l = Array.length stack
      forE 0 l \i -> do
        unsafePartial $ Array.unsafeIndex stack (l - 1 - i)

  pure
    ( PSR
        { lifecycle: once lifecycle
        , disqualifyFromStaticRendering
        , region
        , defer: doDefer
        , dispose
        }
    )

handleScope :: EffectFn1 PSR Unit
handleScope = mkEffectFn1 \psr -> do
  let
    handleLifecycle :: EffectFn1 Unit Unit
    handleLifecycle =
      mkEffectFn1 \_ -> (un PSR psr).dispose

  pump psr (un PSR psr).lifecycle handleLifecycle

newtype Nut =
  Nut (EffectFn2 PSR DOMInterpret Unit)

instance Semigroup Nut where
  append (Nut a) (Nut b) =
    -- unrolled version of `fixed`
    Nut $ mkEffectFn2 \psr di -> do
      -- first `Nut` should not handle any unsubs, they may still be needed for later elements
      emptyScope <- liftST $ runSTFn3 newPSR false (un PSR psr).lifecycle
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

-- Splits a poll into two polls, both of which are memoized versions of
-- the first
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
deferO = mkEffectFn2 \psr eff -> liftST (runSTFn1 (un PSR psr).defer eff)

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
useDynWith elements options cont = Nut $ mkEffectFn2 \psr di' -> do
  Region region <- liftST $ (un StaticRegion (un PSR psr).region).region
  span <- liftST $ runSTFn2 newSpan region.begin region.bump

  let
    handleElements :: Boolean -> EffectFn1 (Tuple (Maybe Int) value) Unit
    handleElements isStatic = mkEffectFn1 \(Tuple initialPos value) -> do
      let
        di =
          if isStatic then di'
          else (un DOMInterpret di').dynamicDOMInterpret unit
      Region eltRegion <- liftST $ runSTFn2 allocateRegion initialPos span
      tag <- liftST (un DOMInterpret di).tagger
      staticRegion <- liftST $ runSTFn4 newStaticRegion (ElementId tag) Nothing
        eltRegion.begin
        eltRegion.bump
      eltSendTo <- liftST Poll.create
      let
        sendTo :: Poll Int
        sendTo =
          Poll.merge [ options.sendTo value, eltSendTo.poll ]

      eltRemove <- liftST Poll.create
      let
        remove :: Poll Unit
        remove =
          Poll.merge
            [ options.remove value, eltRemove.poll, (un PSR psr).lifecycle ]

      eltPSR <- liftST $ runSTFn3 newPSR true remove staticRegion
      let
        Nut nut = cont
          { value
          , position: eltRegion.position
          , remove: eltRemove.push unit
          , sendTo: eltSendTo.push
          }

        handleSendTo :: EffectFn1 Int Unit
        handleSendTo = mkEffectFn1 \newPos -> do
          fromBegin <- liftST eltRegion.begin
          fromEnd <- liftST eltRegion.end
          liftST $ runSTFn1 eltRegion.sendTo newPos

          target <- liftST eltRegion.begin
          runEffectFn3 (un DOMInterpret di).beamRegion fromBegin fromEnd target

      runEffectFn2 deferO eltPSR (liftST eltRegion.remove)
      pump eltPSR sendTo handleSendTo
      runEffectFn2 nut eltPSR di

  pump' psr elements handleElements

  runEffectFn1 handleScope psr

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2 \psr di -> do
  emptyScope <- liftST $ runSTFn3 newPSR false (un PSR psr).lifecycle
    (un PSR psr).region
  let
    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \(Nut nut) ->
      runEffectFn2 nut emptyScope di

  -- run `nuts` without `unsubs` so they can't dispose them
  runEffectFn2 Event.fastForeachE nuts handleNuts
  -- actually dispose the `unsubs`
  runEffectFn1 handleScope psr

elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag arrAtts nuts = Nut $ mkEffectFn2 \psr di -> do
  id <- liftST (un DOMInterpret di).tagger
  -- let _ = spy "starting elementify" true
  let isBoring = (un DOMInterpret di).isBoring (ElementId id)
  -- when isBoring (log "booooooring")
  when true do -- (not isBoring) do
    liftST $ runSTFn2 (un DOMInterpret di).registerParentChildRelationship
      (ParentId (un ElementId (un StaticRegion (un PSR psr).region).tag))
      (ChildId id)
    let _ = spy "creating elt with info" { id, tag }
    elt <- runEffectFn3 (un DOMInterpret di).makeElement (ElementId id) (Namespace <$> ns)
      (Tag tag)
    regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
    liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element
      (Element (elt))

    when (un PSR psr).disqualifyFromStaticRendering do
      liftST $ runSTFn1 (un DOMInterpret di).disqualifyFromStaticRendering (ElementId id)
      -- let _ = spy "disqualifying from static rendering" id
      pure unit
    eltRegion <- liftST $ runSTFn3 fromParent (ElementId id) (Just (length nuts)) $
      DekuParent
        elt
    runEffectFn2 deferO psr do
      runEffectFn1 (un DOMInterpret di).removeElement elt

    let
      handleAtts :: AttrIndex -> Poll (Attribute element) -> Effect Unit
      handleAtts ix atts =
        pump' psr atts $ \useOriginalDi -> do
          let
            newDi =
              if useOriginalDi then di
              else (un DOMInterpret di).dynamicDOMInterpret unit
          mkEffectFn1 \(Attribute x) ->
            runEffectFn4 x (ElementId id) ix (fromDekuElement elt) newDi

    -- todo: in hydration, we don't need to set attributes
    -- that are already set
    -- it's easier to set them, but if there's a perf speedup in not setting
    -- them, then we should code up a mechanism to skip it
    forWithIndex_ arrAtts \ix att -> do
      when (not (un DOMInterpret di).shouldSkipAttribute (ElementId id) (AttrIndex ix)) do
        case att of
          OnlyPure _ -> pure unit
          _ -> liftST $ runSTFn2
                  (un DOMInterpret di).markIndexAsNeedingHydration (ElementId id) (AttrIndex ix)
        handleAtts (AttrIndex ix) att

    let
      handleNuts :: EffectFn1 Nut Unit
      handleNuts = mkEffectFn1 \(Nut nut) -> do
        scope <- liftST $ runSTFn3 newPSR false (un PSR psr).lifecycle eltRegion
        runEffectFn2 nut scope di
    runEffectFn2 Event.fastForeachE nuts handleNuts

    liftST $ runSTFn1 (un DOMInterpret di).incrementElementCount
      (un PSR psr).region
    runEffectFn2 (un DOMInterpret di).attachElement (DekuChild elt) regionEnd

    runEffectFn2 deferO psr do
      runEffectFn1 (un DOMInterpret di).removeElement elt

    runEffectFn1 handleScope psr

text_ :: String -> Nut
text_ txt =
  text (pure @Poll txt)

text :: Poll String -> Nut
text texts = Nut $ mkEffectFn2 \psr di -> do
  id <- liftST (un DOMInterpret di).tagger
  { txt, doesNotNeedReferenceInDOM } <- case texts of
    OnlyPure xs -> do
      let
        doesNotNeedReferenceInDOM = not
          (un PSR psr).disqualifyFromStaticRendering
      txt <- runEffectFn3 (un DOMInterpret di).makeText (ElementId id) (Array.last xs)
        doesNotNeedReferenceInDOM
      pure { txt, doesNotNeedReferenceInDOM }

    OnlyEvent _ -> do
      let doesNotNeedReferenceInDOM = false
      txt <- runEffectFn3 (un DOMInterpret di).makeText (ElementId id) Nothing
        doesNotNeedReferenceInDOM
      pure { txt, doesNotNeedReferenceInDOM }

    OnlyPoll _ -> do
      let doesNotNeedReferenceInDOM = false
      txt <- runEffectFn3 (un DOMInterpret di).makeText (ElementId id) Nothing
        doesNotNeedReferenceInDOM
      pure { txt, doesNotNeedReferenceInDOM }

    PureAndEvent xs _ -> do
      let doesNotNeedReferenceInDOM = false
      txt <- runEffectFn3 (un DOMInterpret di).makeText (ElementId id) (Array.last xs)
        doesNotNeedReferenceInDOM
      pure { txt, doesNotNeedReferenceInDOM }

    PureAndPoll xs _ -> do
      let doesNotNeedReferenceInDOM = false
      txt <- runEffectFn3 (un DOMInterpret di).makeText (ElementId id) (Array.last xs)
        doesNotNeedReferenceInDOM
      pure { txt, doesNotNeedReferenceInDOM }

  let
    modifiedPoll = case texts of
      OnlyPure _ -> OnlyPure []

      OnlyEvent e -> OnlyEvent e

      OnlyPoll p -> OnlyPoll p

      PureAndEvent _ e -> OnlyEvent e

      PureAndPoll _ p -> OnlyPoll p

  let
    handleTextUpdate :: Boolean -> EffectFn1 String Unit
    handleTextUpdate useOriginalDi =
      let
        di2 =
          if useOriginalDi then di
          else (un DOMInterpret di).dynamicDOMInterpret unit
      in
        mkEffectFn1 \x -> do
          runEffectFn4 (un DOMInterpret di2).setText id x txt
            doesNotNeedReferenceInDOM

  pump' psr modifiedPoll handleTextUpdate
  regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
  runEffectFn2 (un DOMInterpret di).attachText txt regionEnd
  liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element (Text txt)

  case texts of
    OnlyPure _ -> liftST $ runSTFn1 (un DOMInterpret di).incrementPureTextCount
      (un PSR psr).region
    _ -> pure unit

  runEffectFn2 deferO psr do
    runEffectFn1 (un DOMInterpret di).removeText txt

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

  tag <- liftST (un DOMInterpret di).tagger
  staticBuffer <- liftST $ runSTFn4 newStaticRegion (ElementId tag) Nothing
    (join $ ST.read trackBegin)
    ( mkSTFn1 \bound -> do
        void $ ST.write bound trackEnd
        bumped.push bound
    )
  runEffectFn2 toBeam
    ( over PSR _ { disqualifyFromStaticRendering = true, region = staticBuffer }
        psr
    )
    di

  let
    Nut hooked = cont $ portaled buffer (beamed.push unit) beamed.event
      bumped.event
      trackBegin
      trackEnd

    -- | Moves portaled content back into the buffer and empties it.
    -- maybe not necessary
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
    liftST $ runSTFn1 (un PSR psr).defer (unsubBeamed *> unsubBumped)

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