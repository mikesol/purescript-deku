module Deku.Pursx where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Plus (class Plus, empty)
import Data.Array (null)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Either (Either(..))
import Data.Foldable (foldr, for_)
import Data.Maybe (Maybe(..))
import Data.Nullable (toMaybe)
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (Tuple(..))
import Deku.Attribute (Attribute', AttributeValue(..), Cb, Key(..), Value(..))
import Deku.Core (DOMInterpret(..), DekuChild(..), DekuDynamic(..), DekuElement, DekuOutcome(..), DekuParent(..), DynOptions, Hook', Nut(..), PSR(..), actOnLifecycleForDyn, actOnLifecycleForElement, eltAttribution, eventOrBust, getLifecycle, notLucky, pollOrBust, pureOrBust, thunker)
import Deku.Interpret (attributeDynParentForElementEffect, fromDekuElement, toDekuElement)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.JSMap as JSMap
import Deku.JSWeakRef (deref, weakRef)
import Deku.Path (symbolsToArray)
import Deku.Path as Path
import Deku.PathWalker (InstructionDelegate(..), MElement, mEltElt, processAttPursx, processNutPursx, processStringImpl, returnReplacement, splitTextAndReturnReplacement)
import Deku.PathWalker as PW
import Deku.PursxParser as PxP
import Deku.UnsafeDOM (cloneTemplate, toTemplate, unsafeFirstChild)
import Effect (Effect, foreachE)
import Effect.Ref (new)
import Effect.Uncurried (EffectFn1, EffectFn5, EffectFn7, mkEffectFn1, mkEffectFn2, mkEffectFn4, mkEffectFn7, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn7, runEffectFn8)
import FRP.Event (fastForeachE, subscribe)
import FRP.Event as Event
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Foreign.Object (Object)
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Literals.Undefined (undefined)
import Prim.Row as R
import Prim.RowList as RL
import Record as Record
import Type.Equality (class TypeEquals)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Untagged.Union (toEither1)
import Web.DOM (Element)
import Web.DOM.DocumentFragment as DocumentFragment
import Web.DOM.Element (removeAttribute)
import Web.HTML.HTMLTemplateElement as HtmlTemplateElement

class EmptyMe (r :: Row Type) (rl :: RL.RowList Type) | rl -> r where
  emptyMe :: Proxy rl -> { | r }

instance EmptyMe () RL.Nil where
  emptyMe _ = {}

instance  (IsSymbol k, Plus f, R.Lacks k r', R.Cons k (f a) r' r, EmptyMe r' rl) => EmptyMe r (RL.Cons k (f a) rl) where
  emptyMe _ = Record.insert (Proxy :: _ k) empty (emptyMe (Proxy :: _ rl))
else instance  (IsSymbol k,  Monoid m, R.Lacks k r', R.Cons k m r' r, EmptyMe r' rl) => EmptyMe r (RL.Cons k m rl) where
  emptyMe _ = Record.insert (Proxy :: _ k) mempty (emptyMe (Proxy :: _ rl))

class StringSubstitutionsAreKosher
  :: RL.RowList Type -> RL.RowList Type -> Constraint
class StringSubstitutionsAreKosher nostr str | str -> nostr

instance StringSubstitutionsAreKosher RL.Nil RL.Nil

instance
  StringSubstitutionsAreKosher c d =>
  StringSubstitutionsAreKosher (RL.Cons k Nut c) (RL.Cons k String d)

else instance
  StringSubstitutionsAreKosher c d =>
  StringSubstitutionsAreKosher (RL.Cons k Nut c) (RL.Cons k Nut d)

else instance
  ( TypeEquals a b
  , StringSubstitutionsAreKosher c d
  ) =>
  StringSubstitutionsAreKosher (RL.Cons k (a) c)
    (RL.Cons k (b) d)

makePursx
  :: forall (html :: Symbol) p pl r0 rl0 r rl plr path scrunched
   . IsSymbol html
  => PxP.PXStart "~" " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => StringSubstitutionsAreKosher rl0 rl
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  -- => Warn (Above (Text "PL") (Quote (Proxy pl)))
  => Path.RLReverses pl plr
  -- => Warn (Above (Text "PLR") (Quote (Proxy plr)))
  => Path.Process plr path
  => Path.Scrunch path scrunched
  -- => Warn (Above (Text "Path") (Quote path))
  => PW.PathWalker scrunched r
  -- => Warn (Above (Text "Scrunched") (Quote scrunched))
  => Proxy html
  -> { | r }
  -> Nut
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall verb (html :: Symbol) r0 rl0 p pl r rl plr path scrunched
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => StringSubstitutionsAreKosher rl0 rl
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Nut
makePursx' _ _ r = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di ->
    do
      let
        rlProxy = Proxy :: _ rl
        htmlProxy = Proxy :: _ html
        scrunch = Proxy :: _ scrunched
        syms = symbolsToArray rlProxy
        html = foldr
          ( \pat h -> String.replaceAll (String.Pattern ("~" <> pat <> "~"))
              (String.Replacement "")
              h
          )
          (reflectSymbol htmlProxy)
          syms
      eltX <- runEffectFn1 toTemplate html
      elt <- runEffectFn1 cloneTemplate eltX
      let unsafeMElement = unsafeCoerce { p: undefined, e: elt }
      runEffectFn3 eltAttribution ps di (toDekuElement elt)
      runEffectFn5
        ( PW.walk
            :: EffectFn5 InstructionDelegate (Proxy scrunched) { | r } DOMInterpret MElement Unit
        )
        (InstructionDelegate {
                processString: mkEffectFn4 \a b _ d -> runEffectFn3 processStringImpl a b d,
                processAttribute: mkEffectFn4 \a b c d -> runEffectFn4 processAttPursx a b c d,
                processNut: mkEffectFn4 \a b c d -> runEffectFn4 (processNutPursx splitTextAndReturnReplacement) a b c d
            })
        scrunch
        r
        di
        unsafeMElement
      unsubs <- liftST $ STArray.new
      when (not (Array.null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      runEffectFn2 oneOffFinalizationRegistry elt (thunker unsubs)
      for_ (getLifecycle psr.beacon) \{ l, s, e, lucky } -> runEffectFn8
        actOnLifecycleForElement
        psr.fromPortal
        lucky
        unsubs
        l
        di
        (toDekuElement elt)
        s
        e
      pure $ DekuElementOutcome (toDekuElement elt)

infixr 5 makePursx as ~~

pxHandleAtts
  :: EffectFn7 DOMInterpret
                  (STObject.STObject Global Boolean)
                  Element
                  (JSMap.JSMap Element (Object Cb))
                  Element
                  (STArray.STArray Global (Effect Unit))
                  (Array (Poll Attribute'))
                  Unit
pxHandleAtts = mkEffectFn7 \(DOMInterpret { setProp, setDelegateCb }) topCache par cache elt unsubs atts ->
  do
    let
      oh'hi'attr :: DekuElement -> EffectFn1 Attribute' Unit
      oh'hi'attr eeeee = mkEffectFn1 \att -> do
        let { key, value } = att
        case value of
          Prop' v -> runEffectFn3 setProp eeeee (Key key) (Value  v)
          Cb' cb -> do
            maybeL <- liftST $ STObject.peek key topCache
            case maybeL of
              Just _ -> pure unit
              Nothing -> do
                runEffectFn3 setDelegateCb (toDekuElement par) (Key key) cache
                void $ liftST $ STObject.poke key true topCache
            myObj <- runEffectFn2 JSMap.getImpl elt cache
            case toEither1 myObj of
               Right o -> runEffectFn3 JSMap.setImpl elt (Object.insert key cb o) cache
               Left _ -> runEffectFn3 JSMap.setImpl elt (Object.singleton key cb) cache
          -- ugh - this is a dom primitive which sort of breaks the impl contract, find a way
          -- to remove this
          Unset' -> removeAttribute key (fromDekuElement eeeee)
      handleAttrEvent y = do
        wr <- runEffectFn1 weakRef (toDekuElement elt)
        uu <- subscribe y \x -> do
          drf <- runEffectFn1 deref wr
          case toMaybe drf of
            Just yy -> runEffectFn1 (oh'hi'attr yy) x
            Nothing -> thunker unsubs
        void $ liftST $ STArray.push uu unsubs
      handleAttrPoll y = do
        pump <- liftST $ Event.create
        handleAttrEvent (UPoll.sample y pump.event)
        pump.push identity
    let ohi = oh'hi'attr (toDekuElement elt)
    foreachE atts \ii -> case ii of
      OnlyPure x -> runEffectFn2 fastForeachE x ohi
      OnlyEvent y -> handleAttrEvent y
      OnlyPoll y -> handleAttrPoll y
      PureAndPoll x y -> do
        runEffectFn2 fastForeachE x ohi
        handleAttrPoll y

useTemplateWith
  :: forall (@html :: Symbol) value p pl r0 rl0 r rl plr path scrunched
   . IsSymbol html
  => PxP.PXStart "~" " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => StringSubstitutionsAreKosher rl0 rl
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => EmptyMe r rl
  -- => Warn (Above (Text "PL") (Quote (Proxy pl)))
  => Path.RLReverses pl plr
  -- => Warn (Above (Text "PLR") (Quote (Proxy plr)))
  => Path.Process plr path
  => Path.Scrunch path scrunched
  -- => Warn (Above (Text "Path") (Quote path))
  => PW.PathWalker scrunched r
  -- => Warn (Above (Text "Scrunched") (Quote scrunched))
  => Poll (Tuple (Maybe Int) value)
  -> DynOptions value
  -> Hook'
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
       { | r }
useTemplateWith p d f = Nut $ mkEffectFn2
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
      let
        rlProxy = Proxy :: _ rl
        htmlProxy = Proxy :: _ html
        scrunch = Proxy :: _ scrunched
        syms = symbolsToArray rlProxy
        html = foldr
          ( \pat h -> String.replaceAll (String.Pattern ("~" <> pat <> "~"))
              (String.Replacement "")
              h
          )
          (reflectSymbol htmlProxy)
          syms
      toplevelListenerCache :: STObject.STObject Global Boolean <- liftST $ STObject.new
      elementlevelListenerCache :: JSMap.JSMap Element (Object Cb)  <- JSMap.newImpl
      eltX <- runEffectFn1 toTemplate html
      do
        -- this bloc splits all of the dynamic text nodes into
        -- separate text nodes, which makes recursing over them faster as
        -- we only need to do previousNode instead of splitText
        ctnt <- HtmlTemplateElement.content eltX
        elt <- runEffectFn1 unsafeFirstChild (DocumentFragment.toNode ctnt)
        runEffectFn5
            ( PW.walk
                :: EffectFn5 InstructionDelegate (Proxy scrunched) { | r } DOMInterpret MElement
                     Unit
            )
            (InstructionDelegate {
                processString: mkEffectFn4 \_ _ _ _ -> pure unit,
                processAttribute: mkEffectFn4 \_ _ _ _ -> pure unit,
                processNut: mkEffectFn4 \a _ _ dd -> void $ runEffectFn2 splitTextAndReturnReplacement a dd
            })
            scrunch
            (emptyMe (Proxy :: _ rl))
            di
            (unsafeCoerce { p: undefined, e: elt })
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
            r = f
              { value
              , remove: remove'.push DekuRemove
              , sendTo: DekuSendToPos >>> sendTo'.push
              }
          elt <- runEffectFn1 cloneTemplate eltX
          let unsafeMElement = unsafeCoerce { p: undefined, e: elt }
          runEffectFn5 attributeDynParentForElementEffect lucky
            (DekuChild (toDekuElement elt))
            sstaaarrrrrt
            eeeeeennnnd
            mpos
          runEffectFn5
            ( PW.walk
                :: EffectFn5 InstructionDelegate (Proxy scrunched) { | r } DOMInterpret MElement
                     Unit
            )
            (InstructionDelegate {
                processString: mkEffectFn4 \a b _ dd -> runEffectFn3 processStringImpl a b dd,
                processAttribute: mkEffectFn4 \_ b _ dd ->
                  runEffectFn7 pxHandleAtts di toplevelListenerCache (fromDekuElement psr.parent) elementlevelListenerCache (mEltElt dd) unsubs [  b ]
                ,
                processNut: mkEffectFn4 \a b c dd -> runEffectFn4 (processNutPursx returnReplacement) a b c dd
            })
            scrunch
            r
            di
            unsafeMElement
          let
            lifecycle = Poll.merge
              [ DekuSendToPos <$> sendTo
              , sendTo'.poll
              , remove $> DekuRemove
              , remove'.poll
              ]
          runEffectFn8
            actOnLifecycleForElement
            psr.fromPortal
            lucky
            unsubs
            lifecycle
            di
            (toDekuElement elt)
            sstaaarrrrrt
            eeeeeennnnd
      let ohi = oh'hi dbStart dbEnd
      for_ this' \t -> foreachE t \a -> runEffectFn1 ohi a
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
