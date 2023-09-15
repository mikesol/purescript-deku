module Deku.Pursx
  ( pursx
  , pursx'
  , template
  , class PursxSubstitutions
  , class ToElementCache
  , class TemplateSubstitutions
  , class SymbolsToObjectAndArray
  , class PursxWalker
  , StringSplit
  , class TemplateWalker
  , class InitWalker
  , symbolsToObjectAndArray
  , walkPx
  , walkTemplate
  , walkInit
  , CommentCache
  , Ix(..)
  ) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Data.Array (null, (!!))
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldrWithIndex)
import Data.Function.Uncurried (Fn2, Fn3, Fn4, runFn2, runFn3, runFn4)
import Data.Identity (Identity(..))
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple (Tuple(..))
import Deku.Attribute (Attribute, Attribute', AttributeValue(..), Cb(..), Key(..), Value(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), DekuElement, DekuOutcome(..), Html(..), Nut(..), PSR(..), Verb(..), actOnLifecycleForElement, eltAttribution, getLifecycle, handleAtts, notLucky, runListener, thunker)
import Deku.DOM (class TagToCtor, ctor)
import Deku.Interpret (fromDekuElement, toDekuElement)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.PursxParser as PxP
import Deku.PxTypes (PxAtt, PxNut)
import Deku.Some (class AsTypeConstructor, EffectOp, EffectOpWith(..), Some)
import Deku.Some as Some
import Deku.UnsafeDOM (addEventListener, appendChild, cloneTemplate, eventListener, insertAdjacentHTML, insertBefore, setTextContent, toTemplate, unsafeCreateDocumentFragment, unsafeGetElementById, unsafeParentElement, unsafeParentNode)
import Effect (Effect, foreachE)
import Effect.Exception (error, throwException)
import Effect.Random (randomInt)
import Effect.Ref (modify_, new, read, write)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn7, mkEffectFn1, mkEffectFn2, mkEffectFn7, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn7, runEffectFn8)
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Prim.Row as Row
import Prim.RowList as RL
import Record (get, insert, union)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.ChildNode (remove)
import Web.DOM.Comment as Comment
import Web.DOM.DocumentFragment (DocumentFragment)
import Web.DOM.DocumentFragment as DocumentFramgent
import Web.DOM.Element (Element, getAttribute)
import Web.DOM.Element as Element
import Web.DOM.Node (childNodes)
import Web.DOM.Node as Node
import Web.DOM.NodeList as NodeList
import Web.DOM.ParentNode (QuerySelector(..), querySelector)
import Web.Event.Event (EventType(..), target)
import Web.Event.Internal.Types as Event

makeListenerEntry :: Ix -> PxKey -> String
makeListenerEntry (Ix prefix) (PxKey suffix) = prefix <> "-" <> suffix

data CommentCache

foreign import makeTopLevelId :: Fn2 PxToken Ix String
foreign import makeKeyedId :: Fn3 PxToken Ix PxKey String
foreign import commentFromCache :: String -> CommentCache -> Comment.Comment
foreign import getComments
  :: EffectFn2 String Node.Node CommentCache

class PursxWalker :: forall k. k -> Row Type -> Constraint
class PursxWalker rl r where
  walkPx
    :: EffectFn7 (Proxy rl) String { | r } CommentCache DOMInterpret
         (STArray.STArray Global (Effect Unit))
         Element
         Unit

instance PursxWalker RL.Nil r where
  walkPx = mkEffectFn7 \_ _ _ _ _ _ _ -> pure unit

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a (Poll.Poll (Attribute e)) r' r
  , PursxWalker c r
  ) =>
  PursxWalker (RL.Cons a (Poll.Poll (Attribute e)) c) r where
  walkPx = mkEffectFn7 \_ t r cc di unsubs e -> do
    let key' = Proxy :: _ a
    let key = reflectSymbol key'
    n <- runEffectFn1 unsafeParentElement e
    s <- querySelector
      ( QuerySelector $ "[data-dktk=\"" <> t <> "\"][data-dktt=\""
          <> key
          <> "\"]"
      )
      (Element.toParentNode n)
    for_ s \s' -> do
      obj <- liftST $ STObject.new
      handleAtts di obj (toDekuElement s') unsubs
        [ map unsafeUnAttribute (get key' r) ]
    runEffectFn7 walkPx (Proxy :: _ c) t r cc di unsubs e

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a Nut r' r
  , PursxWalker c r
  ) =>
  PursxWalker (RL.Cons a Nut c) r where
  walkPx = mkEffectFn7 \_ t r cc di unsubs e ->
    do
      frag <- unsafeCreateDocumentFragment
      let key' = Proxy :: _ a
      let key = reflectSymbol key'
      let Nut nut = get key' r
      -- we don't care about the outcome
      -- because all this goes into a template, so we just grab it from there
      _ <- runEffectFn2 nut
        (PSR { beacon: Nothing, unsubs: [], fromPortal: false, parent: ((unsafeCoerce :: DocumentFragment -> DekuElement) frag) })
        di
      let cmt = commentFromCache key cc
      nl <- Node.childNodes (DocumentFramgent.toNode frag) >>= NodeList.toArray
      -- ugh, this mixes @di and DOM APIs, refactor "one day"
      cmtPar <- runEffectFn1 unsafeParentNode (Comment.toNode cmt)
      foreachE nl \n -> do
          runEffectFn3 insertBefore n (Comment.toNode cmt) cmtPar
      runEffectFn7 walkPx (Proxy :: _ c) t r cc di unsubs e

addCallbackToCacheIfNeeded
  :: Attribute'
  -> (STObject.STObject Global (Event.Event -> Effect Boolean))
  -> (STObject.STObject Global Boolean)
  -> Element
  -> Effect Unit
addCallbackToCacheIfNeeded value lcache hasLCache par = do
  liftST (STObject.peek value.key hasLCache) >>= case _ of
    Just _ -> pure unit
    -- uggggh mixes in dommy code, refactor to use DOMInterpret
    Nothing ->
      do
        let eventType = EventType value.key
        let eventTarget = Element.toEventTarget par
        nl <- runEffectFn1 eventListener $ mkEffectFn1 \e -> do
          for_ (target e >>= Element.fromEventTarget) \targ -> do
            ix' <- getAttribute "data-dkix" targ
            for_ ix' \ix -> do
              tt' <- getAttribute "data-dktt" targ
              for_ tt' \tt -> do
                myListener' <- liftST $ STObject.peek
                  (makeListenerEntry (Ix ix) (PxKey tt))
                  lcache
                for_ myListener' \myListener -> do
                    myListener e
        runEffectFn4 addEventListener eventType nl false eventTarget
        void $ liftST $ STObject.poke
          value.key
          true
          hasLCache

class TemplateWalker :: forall k. k -> Row Type -> Constraint
class TemplateWalker rl r0 | rl -> r0 where
  walkTemplate
    :: EffectFn7 (Proxy rl) String
         (STObject.STObject Global (STObject.STObject Global Element))
         DOMInterpret
         Element
         (STObject.STObject Global (Event.Event -> Effect Boolean))
         (STObject.STObject Global Boolean)
         { | r0 }

instance TemplateWalker RL.Nil () where
  walkTemplate = mkEffectFn7 \_ _ _ _ _ _ _ -> pure {}

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a (EffectOpWith String (Array (Identity (Attribute e)))) r' r
  , TemplateWalker c r'
  ) =>
  TemplateWalker (RL.Cons a (Array (Identity (Attribute e))) c) r where
  walkTemplate = mkEffectFn7
    \_
     t
     obj
     di@(DOMInterpret { setProp, unsetAttribute })
     par
     lcache
     hasLCache -> do
      let key' = Proxy :: _ a
      let key = reflectSymbol key'
      let
        toInsert = EffectOpWith $ mkEffectFn2 \ix values ->
          foreachE values \(Identity value') -> do
            let value = unsafeUnAttribute value'
            eltO <- liftST (STObject.peek ix obj) >>= case _ of
              Just elt -> pure elt
              Nothing -> throwException
                (error $ "Could not find " <> ix <> " in stack")
            elt <- liftST (STObject.peek key eltO) >>= case _ of
              Just elt -> pure elt
              Nothing -> do
                -- getElementById isn't necessary for Cb
                -- but we don't really care as it's highly unlikely
                -- this lookup will cause a perf drain
                -- and we don't want to overoptimize here
                newElt <- runEffectFn1 unsafeGetElementById
                  (runFn3 makeKeyedId (PxToken t) (Ix ix) (PxKey key))
                void $ liftST $ STObject.poke key newElt eltO
                pure newElt
            case value.value of
              Prop' v -> runEffectFn3 setProp (toDekuElement elt)
                (Key value.key)
                (Value v)
              Cb' (Cb cb) -> do
                addCallbackToCacheIfNeeded value lcache hasLCache par
                void $ liftST $ STObject.poke
                  (makeListenerEntry (Ix ix) (PxKey key))
                  cb
                  lcache
              -- this results in an unnecessary thunk
              -- because we know the listener will never be present
              -- we could write another specialized function if this is
              -- a bottleneck
              Unset' -> do
                runEffectFn4 unsetAttribute (toDekuElement elt) (Key value.key)
                  (pure Nothing)
                  (pure unit)
                void $ liftST $ STObject.delete
                  (makeListenerEntry (Ix ix) (PxKey key))
                  lcache
      r' <- runEffectFn7 walkTemplate (Proxy :: _ c) t obj di par lcache
        hasLCache
      pure $ insert key' toInsert r'

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a (EffectOpWith String (Identity String)) r' r
  , TemplateWalker c r'
  ) =>
  TemplateWalker (RL.Cons a (Identity String) c) r where
  walkTemplate = mkEffectFn7 \_ t obj di par lcache hasLCache -> do
    let key' = Proxy :: _ a
    let key = reflectSymbol key'
    let
      toInsert = EffectOpWith $ mkEffectFn2 \ix (Identity value) -> do
        eltO <- liftST (STObject.peek ix obj) >>= case _ of
          Just o -> pure o
          Nothing -> throwException
            (error $ "Could not find " <> ix <> " in stack")
        elt <- liftST (STObject.peek key eltO) >>= case _ of
          Just elt -> pure elt
          Nothing -> do
            newElt <- runEffectFn1 unsafeGetElementById
              (runFn3 makeKeyedId (PxToken t) (Ix ix) (PxKey key))
            void $ liftST (STObject.poke key newElt eltO)
            pure newElt
        -- ugh, mixing DOM code into deku code, fix this
        -- it should ideally come from DOMInterpret
        runEffectFn2 setTextContent value (Element.toNode elt)
    r' <- runEffectFn7 walkTemplate (Proxy :: _ c) t obj di par lcache
      hasLCache
    pure $ insert key' toInsert r'

class InitWalker :: forall k. k -> Row Type -> Constraint
class InitWalker rl r0 | rl -> r0 where
  walkInit
    :: EffectFn7 (Proxy rl) String
         (STObject.STObject Global (STObject.STObject Global Element))
         DOMInterpret
         Element
         (STObject.STObject Global (Event.Event -> Effect Boolean))
         (STObject.STObject Global Boolean)
         { | r0 }

instance InitWalker RL.Nil () where
  walkInit = mkEffectFn7 \_ _ _ _ _ _ _ -> pure {}

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a
      ( EffectOpWith
          { ix :: Ix
          , singleH :: StringSplit
          }
          (Array (Identity (Attribute e)))
      )
      r'
      r
  , InitWalker c r'
  ) =>
  InitWalker (RL.Cons a (Array (Identity (Attribute e))) c) r where
  walkInit = mkEffectFn7 \_ t obj di par lcache hasLCache -> do
    let key' = Proxy :: _ a
    let key = reflectSymbol key'
    let
      toInsert = EffectOpWith $ mkEffectFn2
        \{ ix, singleH } values -> do
          foreachE values \(Identity value') -> do
            let value = unsafeUnAttribute value'
            case value.value of
              Prop' v -> do
                -- not entirely correct for stuff like `value` in inputs
                -- fix later
                runEffectFn5 addIxToStringSplitForPropInitValue ix (PxKey key)
                  (Key value.key)
                  (Value v)
                  singleH
              Cb' (Cb cb) -> do
                runEffectFn3 addIxToStringSplitForCbInitValue ix (PxKey key)
                  singleH
                addCallbackToCacheIfNeeded value lcache hasLCache par
                void $ liftST $ STObject.poke (makeListenerEntry ix (PxKey key))
                  cb
                  lcache
              -- intentionally ignore in setters
              -- change if problematic
              Unset' -> do
                pure unit
    r' <- runEffectFn7 walkInit (Proxy :: _ c) t obj di par lcache hasLCache
    pure $ insert key' toInsert r'

instance
  ( IsSymbol a
  , Row.Lacks a r'
  , Row.Cons a
      ( EffectOpWith
          { ix :: Ix
          , singleH :: StringSplit
          }
          (Identity String)
      )
      r'
      r
  , InitWalker c r'
  ) =>
  InitWalker (RL.Cons a (Identity String) c) r where
  walkInit = mkEffectFn7 \_ t obj di par lcache hasLCache -> do
    let key' = Proxy :: _ a
    let key = reflectSymbol key'
    let
      toInsert = EffectOpWith $ mkEffectFn2 \{ ix, singleH } (Identity value) ->
        do
          runEffectFn4 addIxToStringSplitForStringInitValue ix (PxKey key) value
            singleH
    r' <- runEffectFn7 walkInit (Proxy :: _ c) t obj di par lcache hasLCache
    pure $ insert key' toInsert r'

----

class SymbolsToObjectAndArray :: forall k. RL.RowList k -> Constraint
class SymbolsToObjectAndArray rl where
  symbolsToObjectAndArray
    :: Proxy rl -> Object.Object Boolean

doSymbolUpdates
  :: String
  -> Boolean
  -> Object.Object Boolean
  -> Object.Object Boolean
doSymbolUpdates str b o = Object.insert str b o

instance SymbolsToObjectAndArray RL.Nil where
  symbolsToObjectAndArray _ = Object.empty

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Poll.Poll (Attribute e)) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Attribute e) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Array (Attribute e)) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Array (Identity (Attribute e))) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k String c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Identity String) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k Nut c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObjectAndArray (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObjectAndArray c
  ) =>
  SymbolsToObjectAndArray (RL.Cons k (Poll.Poll String) c) where
  symbolsToObjectAndArray _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObjectAndArray (Proxy :: _ c))

------
class PursxSubstitutions
  :: RL.RowList Type -> Row Type -> Constraint
class PursxSubstitutions nostr str | nostr -> str

instance PursxSubstitutions RL.Nil ()

instance
  ( Row.Cons k Nut d r
  , PursxSubstitutions c d
  ) =>
  PursxSubstitutions (RL.Cons k PxNut c) r

instance
  ( Row.Cons k (Poll (Attribute deku)) d r
  , PursxSubstitutions c d
  ) =>
  PursxSubstitutions (RL.Cons k (PxAtt deku) c)
    r

class TemplateSubstitutions
  :: RL.RowList Type -> Row Type -> Constraint
class TemplateSubstitutions nostr str | nostr -> str

instance TemplateSubstitutions RL.Nil ()

instance
  ( Row.Cons k (Identity String) d r
  , TemplateSubstitutions c d
  ) =>
  TemplateSubstitutions (RL.Cons k PxNut c) r

else instance
  ( Row.Cons k (Array (Identity (Attribute deku))) d r
  , TemplateSubstitutions c d
  ) =>
  TemplateSubstitutions (RL.Cons k (PxAtt deku) c)
    r

class ToElementCache (rl :: RL.RowList Type) (r :: Row Type) | rl -> r

instance ToElementCache RL.Nil ()
instance
  ( Row.Cons k (EffectOp a) r' r
  , ToElementCache c r'
  ) =>
  ToElementCache (RL.Cons k a c) r

pursx
  :: forall (@html :: Symbol) r0 rl0 r rl
   . IsSymbol html
  => PxP.PXStart "~" " " html r0
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => SymbolsToObjectAndArray rl
  => PursxSubstitutions rl0 r
  => PursxWalker rl r
  => { | r }
  -> Nut
pursx = pursx' @"~" @html

pursx'
  :: forall @verb (@html :: Symbol) r0 rl0 r rl
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r0
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxWalker rl r
  => SymbolsToObjectAndArray rl
  => PursxSubstitutions rl0 r
  => { | r }
  -> Nut
pursx' r = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di ->
    do
      let
        -- various proxies
        rlProxy = Proxy :: _ rl
        verbProxy = Proxy :: _ verb
        verbSymbol = reflectSymbol verbProxy
        htmlProxy = Proxy :: _ html
        syms = symbolsToObjectAndArray rlProxy
      pxToken <- show <$> randomInt 1 1010101
      -- remove all ~s~ from the html attributes
      let
        html = foldrWithIndex
          ( \pat isAtt h ->
              String.replace
                (String.Pattern (verbSymbol <> pat <> verbSymbol))
                ( String.Replacement $
                    if isAtt then "data-dktt=\"" <> pat <> "\" data-dktk=\""
                      <> pxToken
                      <> "\""
                    else "<!--" <> pxToken <> "@!@" <>  pat <> "-->"
                )
                h
          )
          (reflectSymbol htmlProxy)
          syms
      -- turn the pursx i into a template
      eltX <- runEffectFn1 toTemplate html
      -- clone the template
      elt <- runEffectFn1 cloneTemplate eltX
      runEffectFn3 eltAttribution ps di (toDekuElement elt)
      -- walk through the template, getting all of the elements and
      -- setting up listeners
      -- for example, processAttPursx handles all of the attributes in
      -- pursx
      cc <- runEffectFn2 getComments pxToken (Element.toNode elt)
      -- standard unsub management, just like in elementify
      unsubs <- liftST $ STArray.new
      when (not (Array.null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      -- walk through the pursx and wire everything up
      runEffectFn7 walkPx (Proxy :: _ rl) pxToken r cc di unsubs elt
      -- if the element will be finalized, do all cancellations as well
      runEffectFn2 oneOffFinalizationRegistry elt (thunker unsubs)
      -- standard lifecycle management
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

newtype PxToken = PxToken String
data ProtoStringSplit
data StringSplit
newtype PxKey = PxKey String
newtype Ix = Ix String

foreign import buildStringSplit
  :: Fn4 Verb (Object.Object Boolean) PxToken Html ProtoStringSplit

foreign import collapseStringSplit
  :: EffectFn1 StringSplit String

foreign import newStringSplit :: EffectFn2 String ProtoStringSplit StringSplit
foreign import addIxToStringSplitNoInitValue
  :: EffectFn3 Ix PxKey StringSplit Unit

foreign import addIxToStringSplitForStringInitValue
  :: EffectFn4 Ix PxKey String StringSplit Unit

foreign import addIxToStringSplitForPropInitValue
  :: EffectFn5 Ix PxKey Key Value StringSplit Unit

foreign import addIxToStringSplitForCbInitValue
  :: EffectFn3 Ix PxKey StringSplit Unit

foreign import lifecycleShrinkHack
  :: forall r. Some r -> Some (sendTo :: Int, remove :: Unit)

foreign import nonLifecycleShrinkHackImpl
  :: forall a b. a -> b

nonLifecycleShrinkHack
  :: forall r1 r2
   . Row.Union r1 (sendTo :: Int, remove :: Unit) r2
  => Some r2
  -> Some r1
nonLifecycleShrinkHack = unsafeCoerce nonLifecycleShrinkHackImpl

template
  :: forall (@tag :: Symbol) (@html :: Symbol) ctor r0 rl0 r
       rl rr rrrl templateWalker fullWalker initWalker
   . IsSymbol html
  -- r0 is the original row we get from parsing the pursx
  -- it contains all of the attributes and template rows
  -- pointing to PxNut and PxAtt respectively
  => PxP.PXStart "~" " " html r0
  -- r0 as a rowlist
  => RL.RowToList r0 rl0
  -- r contains the valid types for this template
  -- PxAtt -> Poll (Attribute e)
  -- PxNut -> Poll String
  => TemplateSubstitutions rl0 r
  -- turn r to a row list
  => RL.RowToList r rl
  => SymbolsToObjectAndArray rl
  => TemplateWalker rl templateWalker
  => Row.Union templateWalker
       ( remove :: EffectOpWith String Unit
       , sendTo :: EffectOpWith String Int
       )
       fullWalker
  => InitWalker rl initWalker
  => Row.Lacks "sendTo" r
  => Row.Lacks "remove" r
  => Row.Union r (sendTo :: Int, remove :: Unit) rr
  => AsTypeConstructor (EffectOpWith String)
       rr
       fullWalker
  => AsTypeConstructor
       ( EffectOpWith
           { ix :: Ix
           , singleH :: StringSplit
           }
       )
       r
       initWalker
  => RL.RowToList rr rrrl
  => TagToCtor tag ctor
  => Array (Poll (Attribute ctor))
  -> Poll (Tuple String (Some rr))
  -> Nut
template arrrrrrr p = ctor (Proxy :: _ tag) arrrrrrr [ nut ]
  where
  nut = Nut $ mkEffectFn2 \(PSR psr) di' -> do
    let
      -- various proxies
      rlProxy = Proxy :: _ rl
      htmlProxy = Proxy :: _ html
      verbProxy = Proxy :: _ "~"
      verbSymbol = reflectSymbol verbProxy
      htmlSymbol = reflectSymbol htmlProxy
      syms = symbolsToObjectAndArray rlProxy
    -- remove all ~foo~ attributes from the html
    pxToken <- show <$> randomInt 1 1010101
    let
      stringSplit = runFn4 buildStringSplit (Verb verbSymbol) syms
        (PxToken pxToken)
        (Html htmlSymbol)

    -- build an element cache
    -- this will hold references to all of the elements that are hot,
    -- meaning that we can manipulate according to the template
    elementCache
      :: STObject.STObject Global (STObject.STObject Global Element) <-
      liftST
        STObject.new
    tlElementCache
      :: STObject.STObject Global Element <-
      liftST
        STObject.new
    listenerCache
      :: STObject.STObject Global (Event.Event -> Effect Boolean) <-
      liftST
        STObject.new
    hasListenerCache
      :: STObject.STObject Global Boolean <-
      liftST
        STObject.new
    -- alas, our parent is not lucky, for a template is a dyn after all
    for_ psr.beacon (_.lucky >>> notLucky)
    -- the standard unsubs
    unsubs <- liftST $ STArray.new
    -- normal unsub management
    when (not (null psr.unsubs)) do
      void $ liftST $ STArray.pushAll psr.unsubs unsubs
    myNamedWalker <- runEffectFn7 walkTemplate (Proxy :: _ rl) pxToken
      elementCache
      di'
      (fromDekuElement psr.parent)
      listenerCache
      hasListenerCache
    myInitWalker <- runEffectFn7 walkInit (Proxy :: _ rl) pxToken
      elementCache
      di'
      (fromDekuElement psr.parent)
      listenerCache
      hasListenerCache
    let
      findix ix = do
        liftST (STObject.peek ix tlElementCache) >>= case _ of
          Just e -> pure e
          Nothing -> do
            s' <- runEffectFn1 unsafeGetElementById
              (runFn2 makeTopLevelId (PxToken pxToken) (Ix ix))
            void $ liftST $ STObject.poke ix s' tlElementCache
            pure s'
    let
      myLifecycleWalker =
        { sendTo: EffectOpWith $ mkEffectFn2 \ix pos -> do
            elt <- findix ix
            -- ugh, giant heap of DOM code, for now leave it but refactor at some point
            cn <- childNodes (Element.toNode (fromDekuElement $ psr.parent)) >>=
              NodeList.toArray
            case cn !! pos of
              Nothing -> runEffectFn2 appendChild (Element.toNode elt)
                (Element.toNode (fromDekuElement $ psr.parent))
              Just i -> runEffectFn3 insertBefore (Element.toNode elt) i
                (Element.toNode (fromDekuElement $ psr.parent))
        , remove: EffectOpWith $ mkEffectFn2 \ix _ -> do
            elt <- findix ix
            remove (Element.toChildNode elt)
        }
    let
      myInitLifecycleWalker =
        { sendTo: EffectOpWith $ mkEffectFn2 \{ residualInstruction, ix } pos ->
            do
              modify_
                (_ *> runEffectFn2 (unwrap myLifecycleWalker.sendTo) ix pos)
                residualInstruction
        , remove: EffectOpWith $ mkEffectFn2 \{ residualInstruction, ix } _ ->
            do
              modify_
                (_ *> runEffectFn2 (unwrap myLifecycleWalker.remove) ix unit)
                residualInstruction
        }
    let myWalker = myNamedWalker `union` myLifecycleWalker
    residualInstruction <- new (pure unit)
    -- we iterate over the values
    -- filling out a new bit of html with
    -- all of the attributes and collecting the listeners
    -- for each listener, we assign a special data property
    -- so that we can tag it
    -- we then assign all of the listeners to the top element once
    -- when a bona-fide one comes in, we remove it from the top cache
    -- and propagate that to the lower (this code needs to be
    --   in the section below, meaning if we don't have a listener,
    --   we look at the toplevel to see if one was assigned there)
    let
      oh'hi = mkEffectFn1 \arr -> do
        -- this is the html that we're going to insert into the DOM
        insertable <- new ""
        -- these are all of the leftover (lifecycle) instructions that we
        -- execute after the HTML has been inserted
        write (pure unit) residualInstruction
        foreachE arr \(Tuple ix value) -> do
          liftST (STObject.peek ix elementCache) >>= case _ of
            -- the elts have been registered already
            Just _ -> do
              runEffectFn3 Some.foreachEWith ix value myWalker
            -- yup, it's that time!
            -- clone the template, wire up othe elts, etc
            -- this is the biggie
            Nothing -> do
              -- this is the object that will be inserted into the element cache
              nobj <- liftST STObject.new
              -- these are the instructions that we'll execute post facto
              -- for example if the element should start in a position that's not the end
              -- todo: make a "insert-in-beginning-as-default" version `template`
              singleH <- runEffectFn2 newStringSplit ix stringSplit
              runEffectFn3 Some.foreachEWith { ix: Ix ix, singleH }
                ((nonLifecycleShrinkHack :: Some rr -> Some r) value)
                myInitWalker
              runEffectFn3 Some.foreachEWith { residualInstruction, ix }
                (lifecycleShrinkHack value)
                myInitLifecycleWalker
              toAdd <- runEffectFn1 collapseStringSplit singleH
              modify_ (_ <> toAdd) insertable
              void $ liftST $ STObject.poke ix nobj elementCache
        toInsert <- read insertable
        runEffectFn3 insertAdjacentHTML "beforeend" toInsert
          (fromDekuElement psr.parent)
        join $ read residualInstruction
    -- now that we have our element cache, we do something with it
    case p of
      OnlyPure x -> runEffectFn1 oh'hi x
      OnlyEvent _ -> runListener (mkEffectFn1 \a -> runEffectFn1 oh'hi [ a ])
        unsubs
        p
      OnlyPoll _ -> runListener (mkEffectFn1 \a -> runEffectFn1 oh'hi [ a ])
        unsubs
        p
      PureAndEvent x e -> do
        runEffectFn1 oh'hi x
        runListener (mkEffectFn1 \a -> runEffectFn1 oh'hi [ a ]) unsubs
          (OnlyEvent e)
      PureAndPoll x o -> do
        runEffectFn1 oh'hi x
        runListener (mkEffectFn1 \a -> runEffectFn1 oh'hi [ a ]) unsubs
          (OnlyPoll o)
    -- there's no lifecycle, so no need to bind it
    -- NoOutcome isn't quite right as of course there
    -- is an outcome, but we know it will never be used
    -- because it is fed into a top-level element
    pure $ NoOutcome
