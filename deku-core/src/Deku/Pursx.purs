module Deku.Pursx where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Array (null)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (foldr, for_)
import Data.Maybe (Maybe(..))
import Data.Nullable (toMaybe)
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (Tuple(..))
import Deku.Core (DOMInterpret(..), DekuChild(..), DekuDynamic(..), DekuOutcome(..), DekuParent(..), DynOptions, Hook', Nut(..), PSR(..), actOnLifecycleForDyn, actOnLifecycleForElement, eltAttribution, eventOrBust, getLifecycle, notLucky, pollOrBust, pureOrBust, thunker)
import Deku.Interpret (attributeDynParentForElementEffect, toDekuElement)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.JSWeakRef (deref, weakRef)
import Deku.Path (symbolsToArray)
import Deku.Path as Path
import Deku.PathWalker (MElement)
import Deku.PathWalker as PW
import Deku.PursxParser as PxP
import Deku.UnsafeDOM (cloneTemplate, toTemplate)
import Effect (Effect)
import Effect.Ref (new)
import Effect.Uncurried (EffectFn4, mkEffectFn1, mkEffectFn2, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn8)
import FRP.Event (fastForeachE, subscribe)
import FRP.Event as Event
import FRP.Poll (Poll)
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Literals.Undefined (undefined)
import Prim.RowList as RL
import Prim.TypeError (class Warn, Above, Quote, Text)
import Type.Equality (class TypeEquals)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

class StringSubstitutionsAreKosher
  :: RL.RowList Type -> RL.RowList Type -> Constraint
class StringSubstitutionsAreKosher nostr str

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
  => Warn (Above (Text "Path") (Quote path))
  => PW.PathWalker scrunched r
  => Warn (Above (Text "Scrunched") (Quote scrunched))
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
      runEffectFn4
        ( PW.walk
            :: EffectFn4 (Proxy scrunched) { | r } DOMInterpret MElement Unit
        )
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

useTemplateWith
  :: forall (@html :: Symbol) value p pl r0 rl0 r rl plr path scrunched
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
  => Warn (Above (Text "Path") (Quote path))
  => PW.PathWalker scrunched r
  => Warn (Above (Text "Scrunched") (Quote scrunched))
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
      eltX <- runEffectFn1 toTemplate html
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
          runEffectFn4
            ( PW.walk
                :: EffectFn4 (Proxy scrunched) { | r } DOMInterpret MElement
                     Unit
            )
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
