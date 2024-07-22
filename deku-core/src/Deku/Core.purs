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
  , DekuDynamic(..)
  , Hook
  , Hook'
  , Nut(..)
  , PSR(..)
  , ParentId(..)
  , ChildId(..)
  , attributeAtYourOwnRisk
  , callbackWithCaution
  , cb
  , cb'

  , elementify
  , fixed
  -- , portal
  , prop'
  , pump
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
  , withUnsub
  , xdata
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn1, STFn2, mkSTFn1, runSTFn1, runSTFn2, runSTFn3, runSTFn4)
import Control.Plus (empty)
import Data.Array (length)
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
import Deku.Internal.Region (Anchor(..), Bound, Region(..), RegionSpan(..), StaticRegion(..), fromParent, newSpan, newStaticRegion)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, mkEffectFn1, mkEffectFn2, runEffectFn1, runEffectFn2, runEffectFn3)
import FRP.Event as Event
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Safe.Coerce (coerce)
import Web.DOM (Element)
import Web.Event.Internal.Types (Event)

-- | A callback function that can be used as a value for a listener.
newtype Key = Key String
newtype Value = Value String
newtype Cb = Cb (Event -> Effect Boolean)

derive instance newtypeCb :: Newtype Cb _
instance eqCb :: Eq Cb where
  eq _ _ = false

instance ordCb :: Ord Cb where
  compare _ _ = LT

instance showCb :: Show Cb where
  show _ = "{callback}"

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
-- | In general, this type is for internal use only.
newtype Attribute :: Row Type -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute :: forall e. Attribute e -> Attribute'
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

data DekuDynamic = DekuSendToPos Int | DekuRemove

newtype Tag = Tag String
newtype Namespace = Namespace String

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  EffectFn3 Int (Maybe Namespace) Tag DekuElement

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
type MakeText = EffectFn3 Int (Maybe String) Boolean DekuText

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
type BufferPortal = Effect DekuParent

newtype ParentId = ParentId Int

derive instance Newtype ParentId _
newtype ChildId = ChildId Int

derive instance Newtype ChildId _

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA.
-- , SSR, and hydrated SSR.
newtype DOMInterpret = DOMInterpret
  { tagger :: ST.ST Global Int
  , dynamicDOMInterpret :: Unit -> DOMInterpret
  , registerParentChildRelationship :: STFn2 ParentId ChildId Global Unit
  , disqualifyFromStaticRendering :: STFn1 Int Global Unit
  , isBoring :: Int -> Boolean
  , makeElement :: MakeElement
  , incrementElementCount :: STFn1 StaticRegion Global Unit
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

collectUnsubs :: EffectFn1 PSR (STArray.STArray Global (Effect Unit))
collectUnsubs = mkEffectFn1 \(PSR psr) -> do
  unsubs <- liftST $ STArray.new
  when (not (Array.null psr.unsubs)) do
    void $ liftST $ STArray.pushAll psr.unsubs unsubs
  pure unsubs

disposeUnsubs :: EffectFn1 (STArray.STArray Global (Effect Unit)) Unit
disposeUnsubs = mkEffectFn1 \unsubs -> do
  runEffectFn1 Event.fastForeachThunkE =<< liftST (STArray.unsafeFreeze unsubs)

-- | Handles an optimized `Poll` by running the effect on each emitted value. Any resulting subscription gets written to 
-- | the given cleanup array.
pump
  :: forall a
   . STArray.STArray Global (Effect Unit)
  -> Poll a
  -> EffectFn1 a Unit
  -> Effect Unit
pump associations p eff =
  go p

  where

  handleEvent :: Event.Event a -> Effect Unit
  handleEvent y = do
    uu <- runEffectFn2 Event.subscribeO y eff
    void $ liftST $ STArray.push uu associations

  go :: Poll a -> Effect Unit
  go = case _ of
    OnlyEvent x -> handleEvent x
    OnlyPure x -> runEffectFn2 Event.fastForeachE x eff
    OnlyPoll x -> do
      bang <- liftST $ Event.create
      handleEvent (UPoll.sample x bang.event)
      bang.push identity
    PureAndEvent x y -> do
      go (OnlyPure x)
      go (OnlyEvent y)
    PureAndPoll x y -> do
      go (OnlyPure x)
      go (OnlyPoll y)

newtype PSR = PSR
  { lifecycle :: Poll.Poll Unit
  -- used by `Nut`s to register or clear the last element of their region.
  , region :: StaticRegion
  -- used to indicate when an element should never be statically rendered
  -- it may be disqualified for other reasons, but this flag trumps them all
  , disqualifyFromStaticRendering :: Boolean
  , unsubs :: Array (Effect Unit)
  }

derive instance Newtype PSR _

newtype Nut =
  Nut (EffectFn2 PSR DOMInterpret Unit)

instance Semigroup Nut where
  append (Nut a) (Nut b) =
    -- unrolled version of `fixed`
    Nut $ mkEffectFn2 \psr di -> do
      -- first `Nut` should not handle any unsubs, they may still be needed for later elements
      runEffectFn2 a (over PSR _ { unsubs = [] } psr) di
      runEffectFn2 b psr di

instance Monoid Nut where
  mempty =
    -- while we contribute no UI elements we still have to handle any unsubs created by our hooks
    Nut $ mkEffectFn2 \psr _ -> do
      unsubs <- runEffectFn1 collectUnsubs psr

      let
        handleLifecycle :: EffectFn1 Unit Unit
        handleLifecycle =
          mkEffectFn1 \_ -> runEffectFn1 disposeUnsubs unsubs

      pump unsubs (un PSR psr).lifecycle handleLifecycle

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
  runEffectFn2 (coerce $ f poll) (withUnsub (liftST unsubscribe) psr) di

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
  runEffectFn2 (coerce $ f { first: p0.poll, second: p1.poll })
    (withUnsub (o *> liftST unsubscribe) psr)
    di

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

withUnsub :: Effect Unit -> PSR -> PSR
withUnsub u (PSR psr) = PSR $ psr { unsubs = Array.snoc psr.unsubs u }

useRefST :: forall a. a -> Poll a -> Hook (ST.ST Global a)
useRefST a e f = Nut $ mkEffectFn2 \psr di -> do
  r <- liftST $ ST.new a
  { event, push } <- liftST $ Event.create
  u <- Event.subscribe (Poll.sample e event) \i -> void $ liftST $ ST.write i r
  push identity
  let Nut nut = f (ST.read r)
  runEffectFn2 nut (withUnsub u psr) di

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
  RegionSpan span <- liftST do
    Region region <- (un StaticRegion (un PSR psr).region).region
    runSTFn2 newSpan region.begin region.bump

  lifecycle <- liftST Poll.create
  unsubs <- runEffectFn1 collectUnsubs psr

  let
    handleElements :: EffectFn1 (Tuple (Maybe Int) value) Unit
    handleElements = mkEffectFn1 \(Tuple initialPos value) -> do
      let
        di = (un DOMInterpret di').dynamicDOMInterpret unit
      Region eltRegion <- liftST $ runSTFn1 span initialPos
      tag <- liftST (un DOMInterpret di).tagger
      region <- liftST $ runSTFn4 newStaticRegion tag Nothing eltRegion.begin
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
          Poll.merge [ options.remove value, eltRemove.poll, lifecycle.poll ]

      eltUnsubs <- liftST STArray.new
      let
        Nut nut = cont
          { value
          , position: eltRegion.position
          , remove: eltRemove.push unit
          , sendTo: eltSendTo.push
          }

        eltPSR :: PSR
        eltPSR =
          PSR
            { region
            , disqualifyFromStaticRendering: true
            , unsubs: []
            , lifecycle: remove
            }

        handleManagedLifecycle :: EffectFn1 Unit Unit
        handleManagedLifecycle =
          mkEffectFn1 \_ -> do
            liftST eltRegion.remove
            runEffectFn1 disposeUnsubs eltUnsubs

        handleSendTo :: EffectFn1 Int Unit
        handleSendTo = mkEffectFn1 \newPos -> do
          fromBegin <- liftST eltRegion.begin
          fromEnd <- liftST eltRegion.end
          liftST $ runSTFn1 eltRegion.sendTo newPos

          target <- liftST eltRegion.begin
          runEffectFn3 (un DOMInterpret di).beamRegion fromBegin fromEnd target

      pump eltUnsubs sendTo handleSendTo
      pump eltUnsubs remove handleManagedLifecycle

      runEffectFn2 nut eltPSR di

    handleDynLifecycle :: EffectFn1 Unit Unit
    handleDynLifecycle = mkEffectFn1 \_ -> do
      -- first let children dispose of themselves
      lifecycle.push unit
      -- and only then unsub
      runEffectFn1 disposeUnsubs unsubs

  pump unsubs elements handleElements
  pump unsubs (un PSR psr).lifecycle handleDynLifecycle

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2 \psr di -> do
  let
    cleared :: PSR
    cleared =
      over PSR _ { unsubs = [] } psr

    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \(Nut nut) ->
      runEffectFn2 nut cleared di

    Nut dispose = mempty

  -- run `nuts` without `unsubs` so they can't dispose them
  runEffectFn2 Event.fastForeachE nuts handleNuts
  -- run an empty `Nut` to actually dispose the `unsubs`
  runEffectFn2 dispose psr di

elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag arrAtts nuts = Nut $ mkEffectFn2 \psr di -> do
  id <- liftST (un DOMInterpret di).tagger
  let isBoring = (un DOMInterpret di).isBoring id
  when (not isBoring) do
    liftST $ runSTFn2 (un DOMInterpret di).registerParentChildRelationship
      (ParentId (un StaticRegion (un PSR psr).region).tag)
      (ChildId id)
    elt <- runEffectFn3 (un DOMInterpret di).makeElement id (Namespace <$> ns)
      (Tag tag)
    regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
    liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element
      (Element (elt))

    unsubs <- runEffectFn1 collectUnsubs psr

    when (un PSR psr).disqualifyFromStaticRendering do
      liftST $ runSTFn1 (un DOMInterpret di).disqualifyFromStaticRendering id
    eltRegion <- liftST $ runSTFn3 fromParent id (Just (length nuts)) $
      DekuParent
        elt

    let
      handleAtts :: EffectFn1 (Poll (Attribute element)) Unit
      handleAtts = mkEffectFn1 \atts ->
        pump unsubs atts $ mkEffectFn1 \(Attribute x) ->
          runEffectFn2 x (fromDekuElement elt) di
    
    -- todo: in hydration, we don't need to set attributes
    -- that are already set
    -- it's easier to set them, but if there's a perf speedup in not setting
    -- them, then we should code up a mechanism to skip it
    runEffectFn2 Event.fastForeachE arrAtts handleAtts

    let
      handleNuts :: EffectFn1 Nut Unit
      handleNuts = mkEffectFn1 \(Nut nut) ->
        runEffectFn2 nut
          ( PSR
              { unsubs: []
              , disqualifyFromStaticRendering: false
              , lifecycle: (un PSR psr).lifecycle
              , region: eltRegion
              }
          )
          di
    runEffectFn2 Event.fastForeachE nuts handleNuts

    liftST $ runSTFn1 (un DOMInterpret di).incrementElementCount
      (un PSR psr).region
    runEffectFn2 (un DOMInterpret di).attachElement (DekuChild elt) regionEnd

    let
      handleLifecycle :: EffectFn1 Unit Unit
      handleLifecycle = mkEffectFn1 \_ -> do
        runEffectFn1 (un DOMInterpret di).removeElement elt
        runEffectFn1 disposeUnsubs unsubs

    pump unsubs (un PSR psr).lifecycle handleLifecycle

text_ :: String -> Nut
text_ txt =
  text (pure @Poll txt)

text :: Poll String -> Nut
text texts = Nut $ mkEffectFn2 \psr di -> do
  id <- liftST (un DOMInterpret di).tagger
  unsubs <- runEffectFn1 collectUnsubs psr

  let
    handleTextUpdate :: EffectFn2 (Event.Event String) DekuText Unit
    handleTextUpdate = mkEffectFn2 \xs txt -> do
      sub <- runEffectFn2 Event.subscribeO xs $ mkEffectFn1 \x ->
        runEffectFn2 (un DOMInterpret di).setText x txt
      void $ liftST $ STArray.push sub unsubs

  txt <- case texts of
    OnlyPure xs -> do
      runEffectFn3 (un DOMInterpret di).makeText id (Array.last xs) true

    OnlyEvent e -> do
      txt <- runEffectFn3 (un DOMInterpret di).makeText id Nothing false
      runEffectFn2 handleTextUpdate e txt
      pure txt

    OnlyPoll p -> do
      txt <- runEffectFn3 (un DOMInterpret di).makeText id Nothing false
      bang <- liftST Event.create
      runEffectFn2 handleTextUpdate (UPoll.sample p bang.event) txt
      bang.push identity
      pure txt

    PureAndEvent xs e -> do
      txt <- runEffectFn3 (un DOMInterpret di).makeText id (Array.last xs) false
      runEffectFn2 handleTextUpdate e txt
      pure txt

    PureAndPoll xs p -> do
      txt <- runEffectFn3 (un DOMInterpret di).makeText id (Array.last xs) false
      bang <- liftST Event.create
      runEffectFn2 handleTextUpdate (UPoll.sample p bang.event) txt
      bang.push identity
      pure txt

  regionEnd <- liftST (un StaticRegion (un PSR psr).region).end
  runEffectFn2 (un DOMInterpret di).attachText txt regionEnd
  liftST $ runSTFn1 (un StaticRegion (un PSR psr).region).element (Text txt)

  case texts of
    OnlyPure _ -> liftST $ runSTFn1 (un DOMInterpret di).incrementPureTextCount
      (un PSR psr).region
    _ -> pure unit
  let
    handleLifecycle :: EffectFn1 Unit Unit
    handleLifecycle = mkEffectFn1 \_ -> do
      runEffectFn1 (un DOMInterpret di).removeText txt
      runEffectFn1 disposeUnsubs unsubs

  pump unsubs (un PSR psr).lifecycle handleLifecycle

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

  -- signal for other locations of the portal that it's contents have moved
  beamed <- liftST Event.create
  bumped <- liftST Event.createPure

  tag <- liftST (un DOMInterpret di).tagger
  staticBuffer <- liftST $ runSTFn4 newStaticRegion tag Nothing
    (join $ ST.read trackBegin)
    ( mkSTFn1 \bound -> do
        void $ ST.write bound trackEnd
        bumped.push bound
    )
  runEffectFn2 toBeam
    ( over PSR _ { disqualifyFromStaticRendering = true, region = staticBuffer }
        psr
    )
    $ (un DOMInterpret di).dynamicDOMInterpret unit

  let
    Nut hooked = cont $ portaled buffer (beamed.push unit) beamed.event
      bumped.event
      trackBegin
      trackEnd

    -- | Removes portaled content back into the buffer and empties it.
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

  runEffectFn2 hooked (withUnsub dispose psr) di

portaled
  :: Bound
  -> Effect Unit
  -> Event.Event Unit
  -> Event.Event (Maybe Anchor)
  -> ST.STRef Global Bound
  -> ST.STRef Global (Maybe Anchor)
  -> Nut
portaled buffer beam beamed bumped trackBegin trackEnd = Nut $ mkEffectFn2
  \psr di ->
    do
      -- signal to other portaled `Nut`s that we are about to steal their content
      beam

      -- set up region and its eventual cleanup
      Region region <- liftST (un StaticRegion (un PSR psr).region).region
      stolen <- liftST $ ST.new false

      unsubBeamed <- runEffectFn2 Event.subscribeO beamed $ mkEffectFn1 \_ -> do
        void $ liftST $ ST.write true stolen
        liftST region.remove

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
      unsubs <- runEffectFn1 collectUnsubs psr
      void $ liftST $ STArray.push unsubBeamed unsubs
      void $ liftST $ STArray.push unsubBumped unsubs

      let
        handleLifecycle :: EffectFn1 Unit Unit
        handleLifecycle = mkEffectFn1 \_ -> do
          whenM (not <$> liftST (ST.read stolen)) do
            -- send portaled content back to buffer
            begin <- liftST $ join $ ST.read trackBegin
            end <- liftST $ ST.read trackEnd
            target <- liftST buffer
            runEffectFn3 (un DOMInterpret di).beamRegion begin
              (fromMaybe begin end)
              target
            void $ liftST $ ST.write buffer trackBegin
            liftST region.remove

          runEffectFn1 disposeUnsubs unsubs

      pump unsubs (un PSR psr).lifecycle handleLifecycle