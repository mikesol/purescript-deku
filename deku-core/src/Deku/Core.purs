-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Array (null)
import Data.Array as Array
import Data.Compactable (compact)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (Attribute, Attribute', AttributeValue(..), Cb, Key(..), Value(..), unsafeUnAttribute)
import Deku.Do as Deku
import Effect (Effect, foreachE)
import Effect.Random (randomInt)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import FRP.Event (subscribe)
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

newtype PSR = PSR
  { parent :: DekuElement
  -- the maybe here indicates if we're in a portal
  -- portals don't track unsubs because they could come back
  -- at any time and we want the changes to persist
  -- during the time they're not visible
  , unsubs :: Maybe (Array (Effect Unit))
  , beacon ::
      Maybe
        { start :: DekuBeacon
        , end :: DekuBeacon
        , pos :: Maybe Int
        , lifecycle :: Maybe (Poll DekuDynamic)
        }
  }

data DekuOutcome
  = DekuElementOutcome DekuElement
  | DekuTextOutcome DekuText
  | DekuBeaconOutcome DekuBeacon DekuBeacon
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

type GetFragmentParent = EffectFn1 DekuBeacon (Maybe DekuElement)

type MakeFragment = Effect DekuElement

type SendToPosForDyn = EffectFn3 Int DekuBeacon DekuBeacon Unit
type SendToPosForElement = EffectFn2 Int DekuElement Unit
type SendToPosForText = EffectFn2 Int DekuText Unit

type RemoveForDyn = EffectFn3 Boolean DekuBeacon DekuBeacon Unit
type RemoveForElement = EffectFn1 DekuElement Unit
type RemoveForText = EffectFn1 DekuText Unit

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom backend.
type AttributeElementParent =
  EffectFn2 DekuChild DekuParent Unit

type AttributeBeaconParent =
  EffectFn2 DekuBeacon DekuParent Unit

type AttributeBeaconFromToParent =
  EffectFn3 DekuBeacon DekuBeacon DekuParent Unit

type AttributeTextParent =
  EffectFn2 DekuText DekuParent Unit

type AssociateUnsubsToBeacon = EffectFn2 DekuBeacon (Array (Effect Unit))
  Unit

type AssociateUnsubsToText = EffectFn2 DekuText (Array (Effect Unit)) Unit

type AssociateUnsubsToElement = EffectFn2 DekuElement (Array (Effect Unit))
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForElement = EffectFn4 DekuChild DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

type AttributeDynParentForBeaconFromTo = EffectFn5 DekuBeacon DekuBeacon
  DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForBeacon = EffectFn4 DekuBeacon DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- parent is not needed because we may be in a portal
-- we always grab the parent from the beacon
type AttributeDynParentForText = EffectFn4 DekuText DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

-- | Type used by Deku backends to set give an element a new parent. For internal use only unless you're writing a custom backend.
type GiveNewParent =
  EffectFn2 DekuChild DekuParent Unit

type GiveNewParentForDyn = EffectFn3 DekuChild DekuParent DekuBeacon Unit

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

newtype Html = Html String
newtype PxScope = PxScope String
newtype Verb = Verb String
-- | Type used by Deku backends to make pursx. For internal use only unless you're writing a custom backend.
type MakePursx =
  EffectFn5 Html PxScope Verb (Object.Object (Poll (Attribute')))
    (Object.Object Nut)
    DekuElement

-- | Type used by Deku backends to make a beacon signaling the beginning or end of a dynamic construct. For internal use only unless you're writing a custom backend.
type MakeBeacon = Effect DekuBeacon

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA, SSR, and hydrated SSR.
-- | As an example, if you want to create a nullary interpreter that
-- | spits out `unit`, you can set everything to `mempty`.

newtype DOMInterpret = DOMInterpret
  { makeElement :: MakeElement
  , getFragmentParent :: GetFragmentParent
  , makeFragment :: MakeFragment
  , attributeDynParentForElement :: AttributeDynParentForElement
  , attributeElementParent :: AttributeElementParent
  , makeBeacon :: MakeBeacon
  , attributeBeaconParent :: AttributeBeaconParent
  , attributeDynParentForBeacon :: AttributeDynParentForBeacon
  , attributeBeaconFromToParent :: AttributeBeaconFromToParent
  , attributeDynParentForBeaconFromTo :: AttributeDynParentForBeaconFromTo
  , makeText :: MakeText
  , attributeDynParentForText :: AttributeDynParentForText
  , attributeTextParent :: AttributeTextParent
  , makePursx :: MakePursx
  , giveNewParent :: GiveNewParent
  , giveNewParentForDyn :: GiveNewParentForDyn
  , setProp :: SetProp
  , setCb :: SetCb
  , unsetAttribute :: UnsetAttribute
  , setText :: SetText
  , associateUnsubsToBeacon :: AssociateUnsubsToBeacon
  , associateUnsubsToElement :: AssociateUnsubsToElement
  , associateUnsubsToText :: AssociateUnsubsToText
  , sendToPosForDyn :: SendToPosForDyn
  , sendToPosForElement :: SendToPosForElement
  , sendToPosForText :: SendToPosForText
  , removeForDyn :: RemoveForDyn
  , removeForElement :: RemoveForElement
  , removeForText :: RemoveForText
  }

derive instance Newtype DOMInterpret _

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { attributeBeaconParent
         , attributeDynParentForBeacon
         , associateUnsubsToBeacon
         , makeBeacon
         }
     ) ->
    do
      dbStart <- makeBeacon
      let
        Tuple doAssociations unsubs = case psr.unsubs of
          Just unsubs -> Tuple true unsubs
          Nothing -> Tuple false []
      when (doAssociations && not (null unsubs)) do
        runEffectFn2 associateUnsubsToBeacon dbStart unsubs
      dbEnd <- makeBeacon
      case psr.beacon of
        Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent psr.parent)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent psr.parent)
        Just y -> do
          runEffectFn4 attributeDynParentForBeacon dbStart
            y.start
            y.end
            Nothing
          runEffectFn4 attributeDynParentForBeacon dbEnd y.start
            y.end
            Nothing
      foreachE nuts \(Nut nut) -> do
        void $ runEffectFn2 nut
          ( PSR $ psr
              { unsubs = Just []
              , beacon = Just
                  { start: dbStart
                  , end: dbEnd
                  , pos: Nothing
                  , lifecycle: Nothing
                  }
              }
          )
          di
      for_ (psr.beacon >>= _.lifecycle) \l ->
        runEffectFn5 actOnLifecycleForDyn doAssociations l di dbStart dbEnd
      pure $ DekuBeaconOutcome dbStart dbEnd

-- hooks

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

useRant :: forall a. Poll a -> Hook (Poll a)
useRant e f = Nut $ mkEffectFn2 \psr di -> do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  runEffectFn2 (coerce $ f poll) (withUnsub (liftST unsubscribe) psr) di

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
withUnsub u (PSR psr) = PSR $ psr { unsubs = flip Array.snoc u <$> psr.unsubs }

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
         , attributeDynParentForBeacon
         , associateUnsubsToBeacon
         , makeBeacon
         }
     ) ->
    do
      dbStart <- makeBeacon
      let
        Tuple doAssociations unsubs = case psr.unsubs of
          Just unsubs -> Tuple true unsubs
          Nothing -> Tuple false []
      when (doAssociations && not (null unsubs)) do
        runEffectFn2 associateUnsubsToBeacon dbStart unsubs
      dbEnd <- makeBeacon
      case psr.beacon of
        Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent psr.parent)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent psr.parent)
        Just y -> do
          runEffectFn4 attributeDynParentForBeacon dbStart
            y.start
            y.end
            Nothing
          runEffectFn4 attributeDynParentForBeacon dbEnd y.start
            y.end
            Nothing
      let this' = pureOrBust p
      let those' = eventOrBust p
      let that' = pollOrBust p
      let
        oh'hi (Tuple mpos value) = do
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
                { unsubs = Just []
                , beacon = Just
                    { start: dbStart
                    , end: dbEnd
                    , pos: mpos
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
      for_ this' \t -> foreachE t oh'hi
      for_ those' \t -> do
        uu <- subscribe t oh'hi
        when doAssociations $ runEffectFn2 associateUnsubsToBeacon dbStart
          [ uu ]
      for_ that' \t -> do
        pump <- liftST $ Event.create
        uu <- subscribe (UPoll.sample t pump.event) oh'hi
        when doAssociations $ runEffectFn2 associateUnsubsToBeacon dbStart
          [ uu ]
        pump.push identity
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn5 actOnLifecycleForDyn
        doAssociations
        l
        di
        dbStart
        dbEnd
      pure $ DekuBeaconOutcome dbStart dbEnd

actOnLifecycleForDyn
  :: EffectFn5 Boolean (Poll DekuDynamic) DOMInterpret DekuBeacon DekuBeacon
       Unit
actOnLifecycleForDyn = mkEffectFn5
  \doAssociations
   p
   (DOMInterpret { associateUnsubsToBeacon, sendToPosForDyn, removeForDyn })
   dbStart
   dbEnd -> do
    pump <- liftST $ Event.create
    uu <- subscribe (Poll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn3 sendToPosForDyn i dbStart dbEnd
      DekuRemove -> runEffectFn3 removeForDyn (not doAssociations) dbStart dbEnd
    when doAssociations $ runEffectFn2 associateUnsubsToBeacon dbStart [ uu ]
    pump.push identity

actOnLifecycleForElement
  :: EffectFn4 Boolean (Poll DekuDynamic) DOMInterpret DekuElement Unit
actOnLifecycleForElement = mkEffectFn4
  \doAssociations
   p
   ( DOMInterpret
       { associateUnsubsToElement, sendToPosForElement, removeForElement }
   )
   elt -> do
    pump <- liftST $ Event.create
    uu <- subscribe (Poll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn2 sendToPosForElement i elt
      DekuRemove -> runEffectFn1 removeForElement elt
    when doAssociations $ runEffectFn2 associateUnsubsToElement elt [ uu ]
    pump.push identity

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
      runEffectFn4 attributeDynParentForElement (DekuChild elt)
        y.start
        y.end
        Nothing

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
         { associateUnsubsToElement
         , makeElement
         , setProp
         , setCb
         , unsetAttribute
         }
     ) ->
    do
      elt <- runEffectFn2 makeElement (Namespace <$> ns) (Tag tag)
      let
        Tuple doAssociations unsubs = case psr.unsubs of
          Just unsubs -> Tuple true unsubs
          Nothing -> Tuple false []
      when (doAssociations && not (null unsubs)) do
        runEffectFn2 associateUnsubsToElement elt unsubs
      runEffectFn3 eltAttribution ps di elt
      let
        oh'hi'attr att = do
          let { key, value } = unsafeUnAttribute att
          case value of
            Prop' v -> runEffectFn3 setProp elt (Key key) (Value v)
            Cb' cb -> runEffectFn3 setCb elt (Key key) cb
            Unset' -> runEffectFn2 unsetAttribute elt (Key key)
        handleAttrEvent y = do
          uu <- subscribe y oh'hi'attr
          when doAssociations $ runEffectFn2 associateUnsubsToElement elt [ uu ]
        handleAttrPoll y = do
          pump <- liftST $ Event.create
          handleAttrEvent (UPoll.sample y pump.event)
          pump.push identity
      foreachE atts case _ of
        OnlyPure x -> foreachE x oh'hi'attr
        OnlyEvent y -> handleAttrEvent y
        OnlyPoll y -> handleAttrPoll y
        PureAndPoll x y -> do
          foreachE x oh'hi'attr
          handleAttrPoll y
      let
        oh'hi (Nut nut) = do
          void $ runEffectFn2 nut
            ( PSR $ psr
                { beacon = Nothing
                , parent = elt
                , unsubs = Just []
                }
            )
            di
      foreachE nuts oh'hi
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn4
        actOnLifecycleForElement
        doAssociations
        l
        di
        elt
      pure $ DekuElementOutcome elt

actOnLifecycleForText
  :: EffectFn4 Boolean (Poll DekuDynamic) DOMInterpret DekuText Unit
actOnLifecycleForText = mkEffectFn4
  \doAsscoiations
   p
   ( DOMInterpret
       { associateUnsubsToText, sendToPosForText, removeForText }
   )
   txt -> do
    pump <- liftST $ Event.create
    uu <- subscribe (Poll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn2 sendToPosForText i txt
      DekuRemove -> runEffectFn1 removeForText txt
    when doAsscoiations $ runEffectFn2 associateUnsubsToText txt [ uu ]
    pump.push identity

-- text
textAttribution :: EffectFn3 PSR DOMInterpret DekuText Unit
textAttribution = mkEffectFn3 \(PSR psr) (DOMInterpret di) txt ->
  case psr.beacon of
    Nothing -> do
      runEffectFn2 di.attributeTextParent txt (DekuParent psr.parent)
    Just y -> do
      runEffectFn4 di.attributeDynParentForText txt
        y.start
        y.end
        Nothing

text :: Poll String -> Nut
text p = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di@
     ( DOMInterpret
         { associateUnsubsToText
         , makeText
         , setText
         }
     ) ->
    do
      let this' = pureOrBust p
      let those' = eventOrBust p
      let that' = pollOrBust p
      txt <- runEffectFn1 makeText (this' >>= Array.last)
      let
        Tuple doAssociations unsubs = case psr.unsubs of
          Just unsubs -> Tuple true unsubs
          Nothing -> Tuple false []
      when (doAssociations && not (null unsubs)) do
        runEffectFn2 associateUnsubsToText txt unsubs
      runEffectFn3 textAttribution ps di txt
      let
        oh'hi str = runEffectFn2 setText txt str
      for_ those' \y -> do
        uu <- subscribe y oh'hi
        when doAssociations $ runEffectFn2 associateUnsubsToText txt [ uu ]
      for_ that' \y -> do
        pump <- liftST $ Event.create
        uu <- subscribe (UPoll.sample y pump.event) oh'hi
        when doAssociations $ runEffectFn2 associateUnsubsToText txt [ uu ]
        pump.push identity
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn4
        actOnLifecycleForText
        doAssociations
        l
        di
        txt
      pure $ DekuTextOutcome txt

-- portal
beaconAttribution :: EffectFn4 PSR DOMInterpret DekuBeacon DekuBeacon Unit
beaconAttribution = mkEffectFn4
  \(PSR psr)
   ( DOMInterpret
       { attributeBeaconFromToParent, attributeDynParentForBeaconFromTo }
   )
   from
   to -> case psr.beacon of
    Nothing -> do
      runEffectFn3 attributeBeaconFromToParent from to
        (DekuParent psr.parent)
    Just y -> do
      runEffectFn5 attributeDynParentForBeaconFromTo from to
        y.start
        y.end
        Nothing

portal :: Nut -> Hook Nut
portal (Nut toBeam) f = Nut $ mkEffectFn2
  \psr
   di@(DOMInterpret { makeFragment }) ->
    do
      frag <- makeFragment
      beamMe <- runEffectFn2 toBeam
        ( PSR
            { parent: frag
            , unsubs: Nothing
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
     di@
       ( DOMInterpret
           { getFragmentParent
           }
       ) ->
      do
        case beamMe of
          -- if the outcome is an element, just move it
          DekuElementOutcome elt -> runEffectFn3 eltAttribution ps di elt
          -- if the outcome is a text, just move it
          DekuTextOutcome txt -> runEffectFn3 textAttribution ps di txt
          --beacon
          DekuBeaconOutcome from to -> do
            gfp <- runEffectFn1 getFragmentParent from
            -- if the outcome is a beacon and the beacon's parent is a frag, we're in luck, copy wholesale
            case gfp of
              Just elt -> runEffectFn3 eltAttribution ps di elt
              -- if the outcome is a beacon and the beacon's parent is an element, we're in for a slog, itearte over the whole thing
              Nothing -> runEffectFn4 beaconAttribution ps di from to
          NoOutcome -> pure unit
        pure beamMe

-- pursx

class
  PursxToElement (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { atts :: Object.Object (Poll Attribute'), nuts :: Object.Object Nut }

instance pursxToElementConsNut ::
  ( Row.Cons key Nut r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Nut) rest)
    r where
  pursxToElement pxScope _ r = do
    let
      o = pursxToElement pxScope (Proxy :: Proxy rest) r
    o { nuts = Object.insert (reflectType pxk) (get pxk r) o.nuts }
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
  pursxToElement pxScope _ r = do
    let
      o = pursxToElement pxScope (Proxy :: Proxy rest) r
    o
      { atts = Object.insert (reflectType pxk)
          (unsafeUnAttribute <$> (get pxk r))
          o.atts
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ _ =
    { atts: Object.empty
    , nuts: Object.empty
    }

unsafeMakePursx
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> { | r }
  -> Nut
unsafeMakePursx = unsafeMakePursx' "~"

unsafeMakePursx'
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> String
  -> { | r }
  -> Nut
unsafeMakePursx' verb html r = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di@
     ( DOMInterpret
         { associateUnsubsToElement
         , makePursx
         }
     ) ->
    do
      pxScope <- show <$> randomInt 1 2147483646
      let
        { atts, nuts } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      elt <- runEffectFn5 makePursx (Html html) (PxScope pxScope) (Verb verb)
        atts
        nuts
      let
        Tuple doAssociations unsubs = case psr.unsubs of
          Just unsubs -> Tuple true unsubs
          Nothing -> Tuple false []
      when (doAssociations && not (null unsubs)) do
        runEffectFn2 associateUnsubsToElement elt unsubs
      runEffectFn3 eltAttribution ps di elt
      pure $ DekuElementOutcome elt
