-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core
  ( AssociateUnsubsToBeacon
  , AssociateUnsubsToElement
  , AssociateUnsubsToText
  , Attribute
  , Attribute'
  , AttributeBeaconFullRangeParent
  , AttributeBeaconParent
  , AttributeDynParentForBeaconFullRange
  , AttributeDynParentForBeacons
  , AttributeDynParentForElement
  , AttributeDynParentForText
  , AttributeElementParent
  , AttributeTextParent
  , Cb(..)
  , CleanUpBeacon
  , CleanUpElement
  , CleanUpText
  , DOMInterpret(..)
  , DekuBeacon(..)
  , DekuChild(..)
  , DekuDynamic(..)
  , DekuElement(..)
  , DekuOutcome(..)
  , DekuParent(..)
  , DekuText(..)
  , DynOptions
  , Hook
  , Hook'
  , Html(..)
  , Key(..)
  , MakeBeacon
  , MakeElement
  , MakePursx
  , MakeText
  , Namespace(..)
  , Nut(..)
  , PSR(..)
  , PursXable(..)
  , RemoveForDyn
  , RemoveForElement
  , RemoveForText
  , SendToPosForDyn
  , SendToPosForElement
  , SendToPosForText
  , SetCb
  , SetDelegateCb
  , SetProp
  , SetText
  , Tag(..)
  , UnsetAttribute
  , Value(..)
  , Verb(..)
  , actOnLifecycleForDyn
  , actOnLifecycleForElement
  , actOnLifecycleForText
  , beaconAttribution
  , pursxToElement
  , cb
  , cb'
  , class PursxToElement
  , dynOptions
  , elementify
  , eltAttribution
  , eventOrBust
  , fixed
  , getLifecycle
  , handleAtts
  , notLucky
  , pollOrBust
  , portal
  , prop'
  , unset'
  , pureOrBust
  , runListener
  , text
  , textAttribution
  , text_
  , thunker
  , unsafeAttribute
  , unsafeUnAttribute
  , useDeflect
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
  , useSplit
  , useRant'
  , useRef
  , useRefST
  , useState
  , useState'
  , useStateTagged'
  , withUnsub
  , xdata
  ----
  , toDekuElement
  , fromDekuElement
  , toDekuBeacon
  , fromDekuBeacon
  , toDekuText
  , fromDekuText
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Array (null)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Nullable (toMaybe)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Do as Deku
import Deku.JSMap as JSMap
import Deku.JSWeakRef (WeakRef, deref, weakRef)
import Effect (Effect, foreachE)
import Effect.Ref (Ref, new, write)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn8, mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn8, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn8)
import FRP.Event (fastForeachE, fastForeachThunkE, subscribe, subscribeO)
import FRP.Event as Event
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Foreign.Object as Object
import Prim.Row as Row
import Prim.RowList as RL
import Record (get)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (Comment, Element, Text)
import Web.DOM as Element
import Web.Event.Internal.Types (Event)

------
------
toDekuElement :: Element -> DekuElement
toDekuElement = unsafeCoerce

fromDekuElement :: DekuElement -> Element
fromDekuElement = unsafeCoerce

toDekuBeacon :: Comment -> DekuBeacon
toDekuBeacon = unsafeCoerce

fromDekuBeacon :: DekuBeacon -> Comment
fromDekuBeacon = unsafeCoerce

toDekuText :: Text -> DekuText
toDekuText = unsafeCoerce

fromDekuText :: DekuText -> Text
fromDekuText = unsafeCoerce

------
------
------
------
------
------
------

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
  runEffectFn3 setProp (toDekuElement e) (Key k) (Value v)

cb' :: String -> Cb -> Attribute'
cb' k v = mkEffectFn2 \e (DOMInterpret { setCb }) ->
  runEffectFn3 setCb (toDekuElement e) (Key k) v

unset' :: String -> Attribute'
unset' k = mkEffectFn2 \e (DOMInterpret { unsetAttribute }) ->
  runEffectFn2 unsetAttribute (toDekuElement e) (Key k)

type Attribute' = EffectFn2 Element DOMInterpret Unit

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype Attribute :: forall k. k -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute
  :: forall e. Attribute e -> EffectFn2 Element DOMInterpret Unit
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: forall e. EffectFn2 Element DOMInterpret Unit -> Attribute e
unsafeAttribute = Attribute

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> String -> Attribute e
xdata k v = unsafeAttribute $ mkEffectFn2 \e (DOMInterpret { setProp }) ->
  runEffectFn3 setProp (toDekuElement e) (Key $ "data-" <> k) (Value v)

------
------
------
------
------
------
------
------
------
newtype PSR = PSR
  { parent :: DekuElement
  , fromPortal :: Boolean
  , unsubs :: Array (Effect Unit)
  , beacon ::
      Maybe
        { start :: DekuBeacon
        , end :: DekuBeacon
        , pos :: Maybe Int
        , lucky :: Ref Boolean
        , lifecycle :: Maybe (Poll DekuDynamic)
        }
  }

derive instance Newtype PSR _

data DekuOutcome
  = DekuElementOutcome DekuElement
  | DekuTextOutcome DekuText
  | DekuBeaconOutcome DekuBeacon
  | NoOutcome

newtype Nut = Nut (EffectFn2 PSR DOMInterpret DekuOutcome)

instance Semigroup Nut where
  append a b = fixed [ a, b ]

instance Monoid Nut where
  mempty = Nut $ mkEffectFn2 \_ _ -> pure NoOutcome

data DekuDynamic = DekuSendToPos Int | DekuRemove

data DekuElement
data DekuText
data DekuBeacon

newtype Tag = Tag String
newtype Namespace = Namespace String
newtype DekuChild = DekuChild DekuElement
newtype DekuParent = DekuParent DekuElement

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  EffectFn2 (Maybe Namespace) Tag DekuElement

type SendToPosForDyn = EffectFn5 Int DekuBeacon DekuBeacon DekuBeacon DekuBeacon
  Unit

type SendToPosForElement = EffectFn5 (Ref Boolean) Int DekuElement DekuBeacon
  DekuBeacon
  Unit

type SendToPosForText = EffectFn5 (Ref Boolean) Int DekuText DekuBeacon
  DekuBeacon
  Unit

type RemoveForDyn = EffectFn3 Boolean DekuBeacon DekuBeacon Unit
type RemoveForElement = EffectFn2 Boolean DekuElement Unit
type RemoveForText = EffectFn2 Boolean DekuText Unit

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom backend.
type AttributeElementParent =
  EffectFn2 DekuChild DekuParent Unit

type AttributeBeaconParent =
  EffectFn2 DekuBeacon DekuParent Unit

type AttributeBeaconFullRangeParent =
  EffectFn2 DekuBeacon DekuParent Unit

type AttributeTextParent =
  EffectFn2 DekuText DekuParent Unit

type AssociateUnsubsToBeacon = EffectFn2 DekuBeacon (Array (Effect Unit))
  Unit

type AssociateUnsubsToText = EffectFn2 DekuText (Array (Effect Unit)) Unit

type AssociateUnsubsToElement = EffectFn2 DekuElement (Array (Effect Unit))
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForElement = EffectFn5 (Ref Boolean) DekuChild DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

type AttributeDynParentForBeaconFullRange = EffectFn4 DekuBeacon
  DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForBeacons = EffectFn5 DekuBeacon DekuBeacon DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForText = EffectFn5 (Ref Boolean) DekuText DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- | Type used by Deku backends to construct a text element. For internal use only unless you're writing a custom backend.
type MakeText = EffectFn1 (Maybe String) DekuText

-- | Type used by Deku backends to set the text of a text element. For internal use only unless you're writing a custom backend.
type SetText = EffectFn2 DekuText String Unit

-- | Type used by Deku backends to unset an attribute. For internal use only unless you're writing a custom backend.
type UnsetAttribute =
  EffectFn2 DekuElement Key Unit

-- | Type used by Deku backends to set an attribute. For internal use only unless you're writing a custom backend.
type SetProp = EffectFn3 DekuElement Key Value Unit

-- | Type used by Deku backends to set a listener. For internal use only unless you're writing a custom backend.
type SetCb =
  EffectFn3 DekuElement Key Cb Unit

type SetDelegateCb =
  EffectFn3 DekuElement Key (JSMap.JSMap Element.Element (Object.Object Cb))
    Unit

newtype Html = Html String
newtype Verb = Verb String
-- | Type used by Deku backends to make pursx. For internal use only unless you're writing a custom backend.
type MakePursx =
  EffectFn5 Html Verb (Object.Object PursXable)
    PSR
    DOMInterpret
    DekuElement

-- | Type used by Deku backends to make a beacon signaling the beginning or end of a dynamic construct. For internal use only unless you're writing a custom backend.
type MakeBeacon = Effect DekuBeacon

type CleanUpBeacon = EffectFn1 (WeakRef DekuBeacon) Unit
type CleanUpElement = EffectFn1 (WeakRef DekuElement) Unit
type CleanUpText = EffectFn1 (WeakRef DekuText) Unit

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA, SSR, and hydrated SSR.
-- | As an example, if you want to create a nullary interpreter that
-- | spits out `unit`, you can set everything to `mempty`.

newtype DOMInterpret = DOMInterpret
  { makeElement :: MakeElement
  , setProp :: SetProp
  , setCb :: SetCb
  , setDelegateCb :: SetDelegateCb
  , unsetAttribute :: UnsetAttribute
  , attributeElementParent :: AttributeElementParent
  , attributeDynParentForElement :: AttributeDynParentForElement
  , sendToPosForElement :: SendToPosForElement
  , removeForElement :: RemoveForElement
  --
  , makeOpenBeacon :: MakeBeacon
  , makeCloseBeacon :: MakeBeacon
  , attributeBeaconParent :: AttributeBeaconParent
  , attributeDynParentForBeacons :: AttributeDynParentForBeacons
  , attributeBeaconFullRangeParent :: AttributeBeaconFullRangeParent
  , attributeDynParentForBeaconFullRange :: AttributeDynParentForBeaconFullRange
  , sendToPosForDyn :: SendToPosForDyn
  , removeForDyn :: RemoveForDyn
  --
  , makeText :: MakeText
  , setText :: SetText
  , attributeTextParent :: AttributeTextParent
  , attributeDynParentForText :: AttributeDynParentForText
  , sendToPosForText :: SendToPosForText
  , removeForText :: RemoveForText
  --
  , makePursx :: MakePursx
  --
  }

derive instance Newtype DOMInterpret _

getLifecycle
  :: forall r
   . Maybe
       { end :: DekuBeacon
       , lifecycle :: Maybe (Poll DekuDynamic)
       , start :: DekuBeacon
       , lucky :: Ref Boolean
       | r
       }
  -> Maybe
       { e :: DekuBeacon
       , l :: Poll DekuDynamic
       , s :: DekuBeacon
       , lucky :: Ref Boolean
       }
getLifecycle mb = do
  m <- mb
  l <- m.lifecycle
  pure { l, s: m.start, e: m.end, lucky: m.lucky }

thunker :: STArray.STArray Global (Effect Unit) -> Effect Unit
thunker unsubs = do
  unsubsX <- liftST $ STArray.unsafeFreeze unsubs
  runEffectFn1 fastForeachThunkE unsubsX

runListener
  :: forall a
   . EffectFn1 a Unit
  -> STArray.STArray Global (Effect Unit)
  -> Poll a
  -> Effect Unit
runListener oh'hi associations = go
  where
  handleEvent y = do
    uu <- runEffectFn2 subscribeO y oh'hi
    void $ liftST $ STArray.push uu associations
  go = case _ of
    OnlyEvent x -> handleEvent x
    OnlyPure x -> runEffectFn2 fastForeachE x oh'hi
    OnlyPoll x -> do
      pump <- liftST $ Event.create
      handleEvent (UPoll.sample x pump.event)
      pump.push identity
    PureAndEvent x y -> do
      go (OnlyPure x)
      go (OnlyEvent y)
    PureAndPoll x y -> do
      go (OnlyPure x)
      go (OnlyPoll y)

notLucky :: Ref Boolean -> Effect Unit
notLucky = write false

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { attributeBeaconParent
         , attributeDynParentForBeacons
         , makeOpenBeacon
         , makeCloseBeacon
         }
     ) ->
    do
      lucky <- new true
      for_ psr.beacon (_.lucky >>> notLucky)
      dbStart <- makeOpenBeacon
      unsubs <- liftST $ STArray.new
      when (not (null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      dbEnd <- makeCloseBeacon
      case psr.beacon of
        Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent psr.parent)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent psr.parent)
        Just y -> do
          runEffectFn5 attributeDynParentForBeacons dbStart dbEnd
            y.start
            y.end
            Nothing
      let
        myPSR = PSR $ psr
          { unsubs = []
          , fromPortal = false
          , beacon = Just
              { start: dbStart
              , end: dbEnd
              , lucky
              , pos: Nothing
              , lifecycle: Nothing
              }
          }
      runEffectFn2 fastForeachE nuts $ mkEffectFn1 \(Nut nut) -> do
        void $ runEffectFn2 nut
          myPSR
          di
      for_ (getLifecycle psr.beacon) \{ l, s, e } -> do
        runEffectFn8 actOnLifecycleForDyn
          psr.fromPortal
          unsubs
          l
          di
          dbStart
          dbEnd
          s
          e
      pure $ DekuBeaconOutcome dbStart

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

useRefST :: forall a. a -> Poll a -> Hook (ST Global a)
useRefST a e f = Nut $ mkEffectFn2 \psr di -> do
  r <- liftST $ STRef.new a
  { event, push } <- liftST $ Event.create
  u <- subscribe (Poll.sample e event) \i -> void $ liftST $ STRef.write i r
  push identity
  let Nut nut = f (STRef.read r)
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
type DynOptions v =
  { sendTo :: v -> Poll Int, remove :: v -> Poll Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ -> empty, remove: \_ -> empty }

useDyn
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn p = useDynWith p dynOptions

useDynAtBeginning
  :: forall value
   . Poll value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginning b = useDynAtBeginningWith b dynOptions

useDynAtBeginningWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginningWith e = useDynWith (map (Just 0 /\ _) e)

useDynAtEnd
  :: forall value
   . Poll value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEnd b = useDynAtEndWith b dynOptions

pureOrBust :: forall a. Poll a -> Maybe (Array a)
pureOrBust (OnlyPure p) = Just p
pureOrBust (PureAndPoll p _) = Just p
pureOrBust _ = Nothing

eventOrBust :: forall a. Poll a -> Maybe (Event.Event a)
eventOrBust (OnlyEvent e) = Just e
eventOrBust _ = Nothing

pollOrBust :: forall a. Poll a -> Maybe (UPoll.Poll a)
pollOrBust (OnlyPoll p) = Just p
pollOrBust (PureAndPoll _ p) = Just p
pollOrBust _ = Nothing

useDynAtEndWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEndWith e = useDynWith (map (Nothing /\ _) e)

useDynWith
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith p d f = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { attributeBeaconParent
         , attributeDynParentForBeacons
         , makeOpenBeacon
         , makeCloseBeacon
         }
     ) ->
    do
      lucky <- new true
      for_ psr.beacon (_.lucky >>> notLucky)
      dbStart <- makeOpenBeacon
      unsubs <- liftST $ STArray.new
      when (not (null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      dbEnd <- makeCloseBeacon
      case psr.beacon of
        Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent psr.parent)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent psr.parent)
        Just y -> do
          runEffectFn5 attributeDynParentForBeacons dbStart dbEnd
            y.start
            y.end
            Nothing
      let this' = pureOrBust p
      let those' = eventOrBust p
      let that' = pollOrBust p
      let
        oh'hi sstaaarrrrrt eeeeeennnnd = mkEffectFn1 \(Tuple mpos value) -> do
          let sendTo = d.sendTo value
          let remove = d.remove value
          sendTo' <- liftST $ Poll.create
          remove' <- liftST $ Poll.create
          let
            (Nut nut) = f
              { value
              , remove: remove'.push DekuRemove
              , sendTo: DekuSendToPos >>> sendTo'.push
              }
          void $ runEffectFn2 nut
            ( PSR $ psr
                { unsubs = []
                , fromPortal = false
                , beacon = Just
                    { start: sstaaarrrrrt
                    , end: eeeeeennnnd
                    , pos: mpos
                    , lucky
                    , lifecycle: Just $ Poll.merge
                        [ DekuSendToPos <$> sendTo
                        , sendTo'.poll
                        , remove $> DekuRemove
                        , remove'.poll
                        ]
                    }
                }
            )
            di
      for_ this' \t -> runEffectFn2 fastForeachE t (oh'hi dbStart dbEnd)
      let
        handleEvent t = do
          wrStart <- runEffectFn1 weakRef dbStart
          wrEnd <- runEffectFn1 weakRef dbEnd
          uu <- subscribe t \yy -> do
            drStart <- runEffectFn1 deref wrStart
            drEnd <- runEffectFn1 deref wrEnd
            case toMaybe drStart, toMaybe drEnd of
              Just dbStartx, Just dbEndy -> runEffectFn1 (oh'hi dbStartx dbEndy)
                yy
              _, _ -> do
                -- only need to run on head as head is reference
                thunker unsubs
          void $ liftST $ STArray.push uu unsubs
      for_ those' handleEvent
      for_ that' \t -> do
        pump <- liftST $ Event.create
        handleEvent (UPoll.sample t pump.event)
        pump.push identity
      for_ (getLifecycle psr.beacon) \{ l, s, e } -> runEffectFn8
        actOnLifecycleForDyn
        psr.fromPortal
        unsubs
        l
        di
        dbStart
        dbEnd
        s
        e
      pure $ DekuBeaconOutcome dbStart

actOnLifecycleForText
  :: EffectFn8 Boolean (Ref Boolean) (STArray.STArray Global (Effect Unit))
       (Poll DekuDynamic)
       DOMInterpret
       DekuText
       DekuBeacon
       DekuBeacon
       Unit
actOnLifecycleForText = mkEffectFn8
  \fromPortal
   lucky
   associations
   p
   ( DOMInterpret
       { sendToPosForText, removeForText }
   )
   txt'
   startAnchor'
   endAnchor' -> do
    txtWr <- runEffectFn1 weakRef txt'
    startAnchorWr <- runEffectFn1 weakRef startAnchor'
    endAnchorWr <- runEffectFn1 weakRef endAnchor'
    let
      oh'hi = mkEffectFn1 \x -> do
        txtX <- runEffectFn1 deref txtWr
        startAnchorX <- runEffectFn1 deref startAnchorWr
        endAnchorX <- runEffectFn1 deref endAnchorWr
        case
          toMaybe txtX,
          toMaybe startAnchorX,
          toMaybe endAnchorX
          of
          Just txt, Just startAnchor, Just endAnchor ->
            case x of
              DekuSendToPos i -> runEffectFn5 sendToPosForText lucky i txt
                startAnchor
                endAnchor
              DekuRemove -> runEffectFn2 removeForText fromPortal txt
          _, _, _ -> do
            thunker associations
    runListener oh'hi associations p

actOnLifecycleForDyn
  :: EffectFn8 Boolean (STArray.STArray Global (Effect Unit)) (Poll DekuDynamic)
       DOMInterpret
       DekuBeacon
       DekuBeacon
       DekuBeacon
       DekuBeacon
       Unit
actOnLifecycleForDyn = mkEffectFn8
  \fromPortal
   associations
   p
   ( DOMInterpret
       { sendToPosForDyn, removeForDyn }
   )
   dbStart'
   -- todo: we're just using dbend for the weakref
   -- do we need it?
   dbEnd'
   startAnchor'
   endAnchor' -> do
    dbStartWr <- runEffectFn1 weakRef dbStart'
    dbEndWr <- runEffectFn1 weakRef dbEnd'
    startAnchorWr <- runEffectFn1 weakRef startAnchor'
    endAnchorWr <- runEffectFn1 weakRef endAnchor'
    let
      oh'hi = mkEffectFn1 \x -> do
        dbStartX <- runEffectFn1 deref dbStartWr
        dbEndX <- runEffectFn1 deref dbEndWr
        startAnchorX <- runEffectFn1 deref startAnchorWr
        endAnchorX <- runEffectFn1 deref endAnchorWr
        case
          toMaybe dbStartX,
          toMaybe dbEndX,
          toMaybe startAnchorX,
          toMaybe endAnchorX
          of
          Just dbStart, Just dbEnd, Just startAnchor, Just endAnchor ->
            case x of
              DekuSendToPos i -> runEffectFn5 sendToPosForDyn i dbStart dbEnd
                startAnchor
                endAnchor
              DekuRemove -> runEffectFn3 removeForDyn
                fromPortal
                dbStart
                dbEnd
          _, _, _, _ -> do
            -- only need to run on head as head is reference
            thunker associations
    runListener oh'hi associations p

actOnLifecycleForElement
  :: EffectFn8 Boolean (Ref Boolean) (STArray.STArray Global (Effect Unit))
       (Poll DekuDynamic)
       DOMInterpret
       DekuElement
       DekuBeacon
       DekuBeacon
       Unit
actOnLifecycleForElement = mkEffectFn8
  \fromPortal
   lucky
   associations
   p
   ( DOMInterpret
       { sendToPosForElement
       , removeForElement
       }
   )
   elt'
   startAnchor'
   endAnchor' -> do
    eltWr <- runEffectFn1 weakRef elt'
    startAnchorWr <- runEffectFn1 weakRef startAnchor'
    endAnchorWr <- runEffectFn1 weakRef endAnchor'
    let
      oh'hi = mkEffectFn1 \x -> do
        eltX <- runEffectFn1 deref eltWr
        startAnchorX <- runEffectFn1 deref startAnchorWr
        endAnchorX <- runEffectFn1 deref endAnchorWr
        case
          toMaybe eltX,
          toMaybe startAnchorX,
          toMaybe endAnchorX
          of
          Just elt, Just startAnchor, Just endAnchor ->
            case x of
              DekuSendToPos i -> runEffectFn5 sendToPosForElement lucky i elt
                startAnchor
                endAnchor
              DekuRemove -> runEffectFn2 removeForElement fromPortal elt
          _, _, _ -> do
            thunker associations
    runListener oh'hi associations p

-- elt
eltAttribution :: EffectFn3 PSR DOMInterpret DekuElement Unit
eltAttribution = mkEffectFn3
  \(PSR psr)
   (DOMInterpret { attributeElementParent, attributeDynParentForElement })
   elt -> case psr.beacon of
    Nothing -> do
      runEffectFn2 attributeElementParent (DekuChild elt)
        (DekuParent psr.parent)
    Just y -> do
      runEffectFn5 attributeDynParentForElement y.lucky (DekuChild elt)
        y.start
        y.end
        y.pos

handleAtts
  :: DOMInterpret
  -> DekuElement
  -> STArray.STArray Global (Effect Unit)
  -> Array (Poll Attribute')
  -> Effect Unit
handleAtts di elt unsubs atts =
  do
    let
      handleAttrEvent y = do
        wr <- runEffectFn1 weakRef elt
        uu <- subscribe y \x -> do
          drf <- runEffectFn1 deref wr
          case toMaybe drf of
            Just yy -> runEffectFn2 x (fromDekuElement yy) di
            Nothing -> thunker unsubs
        void $ liftST $ STArray.push uu unsubs
      handleAttrPoll y = do
        pump <- liftST $ Event.create
        handleAttrEvent (UPoll.sample y pump.event)
        pump.push identity
    let
      go ii = case ii of
        OnlyPure x -> foreachE x \x' -> do
          runEffectFn2 x' (fromDekuElement elt) di
        OnlyEvent y -> handleAttrEvent y
        OnlyPoll y -> handleAttrPoll y
        PureAndEvent x y -> do
          foreachE x \x' -> do
            runEffectFn2 x' (fromDekuElement elt) di
          handleAttrEvent y
        PureAndPoll x y -> do
          foreachE x \x' -> do
            runEffectFn2 x' (fromDekuElement elt) di
          handleAttrPoll y

    foreachE atts \ii -> go ii

elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag atts nuts = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di@
     ( DOMInterpret
         { makeElement
         }
     ) ->
    do
      elt <- runEffectFn2 makeElement (Namespace <$> ns) (Tag tag)
      unsubs <- liftST $ STArray.new
      when (not (null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      runEffectFn3 eltAttribution ps di elt
      handleAtts di elt unsubs (map (map unsafeUnAttribute) atts)
      let
        oh'hi = mkEffectFn1 \(Nut nut) -> do
          void $ runEffectFn2 nut
            ( PSR $ psr
                { beacon = Nothing
                , parent = elt
                , unsubs = []
                , fromPortal = false
                }
            )
            di
      runEffectFn2 fastForeachE nuts oh'hi
      for_ (getLifecycle psr.beacon) \{ l, s, e, lucky } -> runEffectFn8
        actOnLifecycleForElement
        psr.fromPortal
        lucky
        unsubs
        l
        di
        elt
        s
        e
      pure $ DekuElementOutcome elt

-- text
textAttribution :: EffectFn3 PSR DOMInterpret DekuText Unit
textAttribution = mkEffectFn3 \(PSR psr) (DOMInterpret di) txt ->
  case psr.beacon of
    Nothing -> do
      runEffectFn2 di.attributeTextParent txt (DekuParent psr.parent)
    Just y -> do
      runEffectFn5 di.attributeDynParentForText y.lucky txt
        y.start
        y.end
        Nothing

text_ :: String -> Nut
text_ = pure >>> text

text :: Poll String -> Nut
text p = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di@
     ( DOMInterpret
         { makeText
         , setText
         }
     ) ->
    do
      let this' = pureOrBust p
      let those' = eventOrBust p
      let that' = pollOrBust p
      txt <- runEffectFn1 makeText (this' >>= Array.last)

      unsubs <- liftST $ STArray.new
      when (not (null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      runEffectFn3 textAttribution ps di txt
      let
        handleEvent y = do
          wr <- runEffectFn1 weakRef txt
          uu <- subscribe y \yy -> do
            drf <- runEffectFn1 deref wr
            case toMaybe drf of
              Just yyy -> runEffectFn2 setText yyy yy
              Nothing -> thunker unsubs
          void $ liftST $ STArray.push uu unsubs
      for_ those' handleEvent
      for_ that' \y -> do
        pump <- liftST $ Event.create
        handleEvent (UPoll.sample y pump.event)
        pump.push identity
      for_ (getLifecycle psr.beacon) \{ l, s, e, lucky } -> runEffectFn8
        actOnLifecycleForText
        psr.fromPortal
        lucky
        unsubs
        l
        di
        txt
        s
        e
      pure $ DekuTextOutcome txt

-- portal
beaconAttribution :: EffectFn3 PSR DOMInterpret DekuBeacon Unit
beaconAttribution = mkEffectFn3
  \(PSR psr)
   ( DOMInterpret
       { attributeBeaconFullRangeParent, attributeDynParentForBeaconFullRange }
   )
   to -> case psr.beacon of
    Nothing -> do
      runEffectFn2 attributeBeaconFullRangeParent to
        (DekuParent psr.parent)
    Just y -> do
      runEffectFn4 attributeDynParentForBeaconFullRange to
        y.start
        y.end
        Nothing

portal :: Nut -> Hook Nut
portal (Nut toBeam) f = Nut $ mkEffectFn2
  \psr
   di@(DOMInterpret { makeElement }) ->
    do
      frag <- runEffectFn2 makeElement Nothing (Tag "div")
      beamMe <- runEffectFn2 toBeam
        ( PSR
            { parent: frag
            , fromPortal: true
            , unsubs: []
            , beacon: Nothing
            }
        )
        di
      let giveNewParent = Nut $ oh'hi beamMe
      let Nut nut = f giveNewParent
      runEffectFn2 nut psr di
  where
  oh'hi beamMe = mkEffectFn2
    \ps
     di -> do
      case beamMe of
        -- if the outcome is an element, just move it
        DekuElementOutcome elt -> runEffectFn3 eltAttribution ps di elt
        -- if the outcome is a text, just move it
        DekuTextOutcome txt -> runEffectFn3 textAttribution ps di txt
        --beacon
        DekuBeaconOutcome stBeacon -> do
          -- if the outcome is a beacon and the beacon's parent is an element, we're in for a slog, itearte over the whole thing
          runEffectFn3 beaconAttribution ps di stBeacon
        NoOutcome -> pure unit
      pure beamMe

-- pursx

data PursXable = PXAttr (Poll Attribute') | PXStr String | PXNut Nut

class
  PursxToElement (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> r where
  pursxToElement
    :: Proxy rl
    -> { | r }
    -> Object.Object PursXable

instance pursxToElementConsNut ::
  ( Row.Cons key Nut r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Nut) rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk) (PXNut (get pxk r)) o
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Poll (Attribute deku)) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Poll (Attribute deku)) rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk)
      (PXAttr (unsafeUnAttribute <$> (get pxk r)))
      o
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsStr ::
  ( Row.Cons key String r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key String rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk)
      (PXStr (get pxk r))
      o
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ = Object.empty
