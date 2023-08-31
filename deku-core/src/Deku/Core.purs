-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Reader (ReaderT, ask, lift)
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
import Data.These (These(..), both, that, this)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute (Attribute, AttributeValue(..), Cb, Key(..), Value(..), unsafeUnAttribute)
import Effect (Effect, foreachE)
import Effect.Ref (Ref, modify_, read, write)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, mkEffectFn2, mkEffectFn3, mkEffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5)
import FRP.Event (subscribe)
import FRP.Event as Event
import FRP.Poll (Poll)
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Foreign.Object (Object)

newtype DekuM a = DekuM (ReaderT DOMCache Effect a)

derive instance Functor DekuM
derive newtype instance Apply DekuM
derive newtype instance Applicative DekuM
derive newtype instance Bind DekuM
derive newtype instance Monad DekuM
derive newtype instance Semigroup a => Semigroup (DekuM a)
derive newtype instance Monoid a => Monoid (DekuM a)

newtype PSR = PSR
  { parent :: Maybe DekuElement
  , beacon ::
      Maybe
        { start :: DekuBeacon
        , end :: DekuBeacon
        , pos :: Maybe Int
        , lifecycle :: Maybe (Poll DekuDynamic)
        }
  }

newtype Nut = Nut (EffectFn2 PSR DOMInterpret Unit)

instance Semigroup Nut where
  append a b = fixed [ a, b ]

instance Monoid Nut where
  mempty = Nut $ mkEffectFn2 \_ _ -> pure unit

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

type SendToPosForDyn = EffectFn3 Int DekuBeacon DekuBeacon Unit
type SendToPosForElement = EffectFn2 Int DekuElement Unit
type SendToPosForText = EffectFn2 Int DekuText Unit

type RemoveForDyn = EffectFn2 DekuBeacon DekuBeacon Unit
type RemoveForElement = EffectFn1 DekuElement Unit
type RemoveForText = EffectFn1 DekuText Unit

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom backend.
type AttributeElementParent =
  EffectFn2 DekuChild DekuParent Unit

type AttributeBeaconParent =
  EffectFn2 DekuBeacon DekuParent Unit

type AttributeTextParent =
  EffectFn2 DekuText DekuParent Unit

type AssociateUnsubsToBeacon = EffectFn2 DekuBeacon (Array (Effect Unit))
  Unit

type AssociateUnsubsToText = EffectFn2 DekuText (Array (Effect Unit)) Unit

type AssociateUnsubsToElement = EffectFn2 DekuElement (Array (Effect Unit))
  Unit

type AttributeDynParentForElement = EffectFn5 DekuChild DekuParent DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

type AttributeDynParentForBeacon = EffectFn5 DekuBeacon DekuParent DekuBeacon
  DekuBeacon
  (Maybe Int)
  Unit

type AttributeDynParentForText = EffectFn5 DekuText DekuParent DekuBeacon
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

-- | Type used by Deku backends to make pursx. For internal use only unless you're writing a custom backend.
type MakePursx =
  EffectFn1
    { html :: String
    , pxScope :: String
    , verb :: String
    , cache :: Object Boolean
    }
    Unit

-- | Type used by Deku backends to make a beacon signaling the beginning or end of a dynamic construct. For internal use only unless you're writing a custom backend.
type MakeBeacon = Effect DekuBeacon

-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA, SSR, and hydrated SSR.
-- | As an example, if you want to create a nullary interpreter that
-- | spits out `unit`, you can set everything to `mempty`.

newtype DOMInterpret = DOMInterpret
  { unsubs :: Ref (Array (Effect Unit))
  , makeElement :: MakeElement
  , attributeDynParentForElement :: AttributeDynParentForElement
  , attributeElementParent :: AttributeElementParent
  , makeBeacon :: MakeBeacon
  , attributeBeaconParent :: AttributeBeaconParent
  , attributeDynParentForBeacon :: AttributeDynParentForBeacon
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

newtype DOMCache = DOMCache
  { unsubs :: Ref (Array (Effect Unit))
  }

derive instance Newtype DOMCache _

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { unsubs
         , attributeBeaconParent
         , attributeDynParentForBeacon
         , associateUnsubsToBeacon
         , makeBeacon
         }
     ) ->
    do
      dbStart <- makeBeacon
      u <- read unsubs
      when (not (null u)) do
        runEffectFn2 associateUnsubsToBeacon dbStart u
        write [] unsubs
      dbEnd <- makeBeacon
      case psr.parent, psr.beacon of
        Just x, Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent x)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent x)
        Just x, Just y -> do
          runEffectFn5 attributeDynParentForBeacon dbStart (DekuParent x)
            y.start
            y.end
            Nothing
          runEffectFn5 attributeDynParentForBeacon dbEnd (DekuParent x) y.start
            y.end
            Nothing
        Nothing, _ -> pure unit
      foreachE nuts \(Nut nut) -> do
        runEffectFn2 nut
          ( PSR $ psr
              { beacon = Just
                  { start: dbStart
                  , end: dbEnd
                  , pos: Nothing
                  , lifecycle: Nothing
                  }
              }
          )
          di
      for_ (psr.beacon >>= _.lifecycle) \l ->
        runEffectFn4 actOnLifecycleForDyn l di dbStart dbEnd

-- hooks

useDeflect :: forall a. Poll a -> DekuM (Poll a)
useDeflect e = DekuM $ do
  lift $ liftST $ Poll.deflect e

useHot
  :: forall a
   . a
  -> DekuM ((a -> Effect Unit) /\ Poll a)
useHot a = do
  push /\ poll <- useState'
  r <- useRefST a poll
  pure (push /\ (Poll.stToPoll r <|> poll))

useHotRant :: forall a. Poll a -> DekuM (Poll a)
useHotRant e = do
  r <- useRefST Nothing (Just <$> e)
  p <- useRant e
  -- we `once e` in case it has an initial value
  pure $ compact (Poll.stToPoll r <|> (Just <$> p))

useMailboxed
  :: forall a b
   . Ord a
  => DekuM (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Poll b))
useMailboxed = DekuM $ do
  { poll, push } <- lift $ liftST $ Poll.mailbox
  pure (push /\ poll)

useRant :: forall a. Poll a -> DekuM (Poll a)
useRant e = DekuM $ do
  DOMCache { unsubs } <- ask
  { poll, unsubscribe } <- lift $ liftST $ Poll.rant e
  lift $ modify_ (_ <> [ liftST unsubscribe ]) unsubs
  pure poll

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> DekuM ((t -> Effect Unit) /\ Poll a)
useRant' f0 = do
  push /\ e <- useState'
  m <- useRant (f0 e)
  pure (push /\ m)

useRef :: forall a. a -> Poll a -> DekuM (Effect a)
useRef = map (map (map liftST)) useRefST

useRefST :: forall a. a -> Poll a -> DekuM (ST Global a)
useRefST a e = DekuM $ do
  DOMCache { unsubs } <- ask
  r <- lift $ liftST $ STRef.new a
  lift do
    { event, push } <- liftST $ Event.create
    u <- subscribe (UPoll.sample e event) \i -> void $ liftST $ STRef.write i r
    push identity
    modify_ (_ <> [ u ]) unsubs
    pure (STRef.read r)

useState' :: forall a. DekuM ((a -> Effect Unit) /\ Poll a)
useState' = DekuM $ do
  { poll, push } <- lift $ liftST $ Poll.create
  pure (push /\ poll)

useState :: forall a. a -> DekuM ((a -> Effect Unit) /\ Poll a)
useState a = DekuM $ do
  { poll, push } <- lift $ liftST $ Poll.create
  pure (push /\ (pure a <|> poll))

-- dyn
type DynOptions v =
  { sendTo :: v -> Poll Int, remove :: v -> Poll Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ -> empty, remove: \_ -> empty }

dynAtBeginning
  :: forall value
   . Poll value
  -> ( { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       -> Nut
     )
  -> Nut
dynAtBeginning b = dynAtBeginningWith b dynOptions

dynAtBeginningWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> ( { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       -> Nut
     )
  -> Nut
dynAtBeginningWith e = dynWith (map (Just 0 /\ _) e)

dynAtEnd
  :: forall value
   . Poll value
  -> ( { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       -> Nut
     )
  -> Nut
dynAtEnd b = dynAtEndWith b dynOptions

dynAtEndWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> ( { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       -> Nut
     )
  -> Nut
dynAtEndWith e = dynWith (map (Nothing /\ _) e)

dynWith
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> DynOptions value
  -> ( { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       -> Nut
     )
  -> Nut
dynWith (Poll.APoll p) d f = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { unsubs
         , attributeBeaconParent
         , attributeDynParentForBeacon
         , associateUnsubsToBeacon
         , makeBeacon
         }
     ) ->
    do
      dbStart <- makeBeacon
      u <- read unsubs
      when (not (null u)) do
        runEffectFn2 associateUnsubsToBeacon dbStart u
        write [] unsubs
      dbEnd <- makeBeacon
      case psr.parent, psr.beacon of
        Just x, Nothing -> do
          runEffectFn2 attributeBeaconParent dbStart (DekuParent x)
          runEffectFn2 attributeBeaconParent dbEnd (DekuParent x)
        Just x, Just y -> do
          runEffectFn5 attributeDynParentForBeacon dbStart (DekuParent x)
            y.start
            y.end
            Nothing
          runEffectFn5 attributeDynParentForBeacon dbEnd (DekuParent x) y.start
            y.end
            Nothing
        Nothing, _ -> pure unit
      let this' = this p <|> (fst <$> both p)
      let that' = that p <|> (snd <$> both p)
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
          runEffectFn2 nut
            ( PSR $ psr
                { beacon = Just
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
      for_ that' \t -> do
        pump <- liftST $ Event.create
        uu <- subscribe (UPoll.sample t pump.event) oh'hi
        runEffectFn2 associateUnsubsToBeacon dbStart [ uu ]
        pump.push identity
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn4 actOnLifecycleForDyn
        l
        di
        dbStart
        dbEnd

actOnLifecycleForDyn
  :: EffectFn4 (Poll DekuDynamic) DOMInterpret DekuBeacon DekuBeacon Unit
actOnLifecycleForDyn = mkEffectFn4
  \p
   (DOMInterpret { associateUnsubsToBeacon, sendToPosForDyn, removeForDyn })
   dbStart
   dbEnd -> do
    pump <- liftST $ Event.create
    uu <- subscribe (UPoll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn3 sendToPosForDyn i dbStart dbEnd
      DekuRemove -> runEffectFn2 removeForDyn dbStart dbEnd
    runEffectFn2 associateUnsubsToBeacon dbStart [ uu ]
    pump.push identity

actOnLifecycleForElement
  :: EffectFn3 (Poll DekuDynamic) DOMInterpret DekuElement Unit
actOnLifecycleForElement = mkEffectFn3
  \p
   ( DOMInterpret
       { associateUnsubsToElement, sendToPosForElement, removeForElement }
   )
   elt -> do
    pump <- liftST $ Event.create
    uu <- subscribe (UPoll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn2 sendToPosForElement i elt
      DekuRemove -> runEffectFn1 removeForElement elt
    runEffectFn2 associateUnsubsToElement elt [ uu ]
    pump.push identity

-- elt
elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag atts nuts = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { unsubs
         , attributeElementParent
         , attributeDynParentForElement
         , associateUnsubsToElement
         , makeElement
         , setProp
         , setCb
         , unsetAttribute
         }
     ) ->
    do
      elt <- runEffectFn2 makeElement (Namespace <$> ns) (Tag tag)
      u <- read unsubs
      when (not (null u)) do
        runEffectFn2 associateUnsubsToElement elt u
        write [] unsubs
      case psr.parent, psr.beacon of
        Just x, Nothing -> do
          runEffectFn2 attributeElementParent (DekuChild elt) (DekuParent x)
        Just x, Just y -> do
          runEffectFn5 attributeDynParentForElement (DekuChild elt)
            (DekuParent x)
            y.start
            y.end
            Nothing
        Nothing, _ -> pure unit
      let
        oh'hi'attr att = do
          let { key, value } = unsafeUnAttribute att
          case value of
            Prop' v -> runEffectFn3 setProp elt (Key key) (Value v)
            Cb' cb -> runEffectFn3 setCb elt (Key key) cb
            Unset' -> runEffectFn2 unsetAttribute elt (Key key)
        handleAttrPoll y = do
          pump <- liftST $ Event.create
          uu <- subscribe (UPoll.sample y pump.event) oh'hi'attr
          runEffectFn2 associateUnsubsToElement elt [ uu ]
          pump.push identity
      foreachE atts case _ of
        Poll.APoll (This x) -> foreachE x oh'hi'attr
        Poll.APoll (That y) -> handleAttrPoll y
        Poll.APoll (Both x y) -> do
          foreachE x oh'hi'attr
          handleAttrPoll y
      let
        oh'hi (Nut nut) = do
          runEffectFn2 nut
            ( PSR $ psr
                { beacon = Nothing
                , parent = Just elt
                }
            )
            di
      foreachE nuts oh'hi
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn3
        actOnLifecycleForElement
        l
        di
        elt

actOnLifecycleForText
  :: EffectFn3 (Poll DekuDynamic) DOMInterpret DekuText Unit
actOnLifecycleForText = mkEffectFn3
  \p
   ( DOMInterpret
       { associateUnsubsToText, sendToPosForText, removeForText }
   )
   txt -> do
    pump <- liftST $ Event.create
    uu <- subscribe (UPoll.sample p pump.event) case _ of
      DekuSendToPos i -> runEffectFn2 sendToPosForText i txt
      DekuRemove -> runEffectFn1 removeForText txt
    runEffectFn2 associateUnsubsToText txt [ uu ]
    pump.push identity

-- text
text :: Poll String -> Nut
text (Poll.APoll p) = Nut $ mkEffectFn2
  \(PSR psr)
   di@
     ( DOMInterpret
         { unsubs
         , attributeTextParent
         , attributeDynParentForText
         , associateUnsubsToText
         , makeText
         , setText
         }
     ) ->
    do
      let this' = this p <|> (fst <$> both p)
      let that' = that p <|> (snd <$> both p)
      txt <- runEffectFn1 makeText (this' >>= Array.last)
      u <- read unsubs
      when (not (null u)) do
        runEffectFn2 associateUnsubsToText txt u
        write [] unsubs
      case psr.parent, psr.beacon of
        Just x, Nothing -> do
          runEffectFn2 attributeTextParent txt (DekuParent x)
        Just x, Just y -> do
          runEffectFn5 attributeDynParentForText txt
            (DekuParent x)
            y.start
            y.end
            Nothing
        Nothing, _ -> pure unit
      let
        oh'hi str = runEffectFn2 setText txt str
      for_ that' \y -> do
        pump <- liftST $ Event.create
        uu <- subscribe (UPoll.sample y pump.event) oh'hi
        runEffectFn2 associateUnsubsToText txt [ uu ]
        pump.push identity
      for_ (psr.beacon >>= _.lifecycle) \l -> runEffectFn3
        actOnLifecycleForText
        l
        di
        txt
