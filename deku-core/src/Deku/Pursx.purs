module Deku.Pursx
  ( pursx
  , pursx'
  , template
  , class PursxSubstitutions
  , class ToElementCache
  , class TemplateSubstitutions
  , class SymbolsToObject
  , class PursxWalker
  , Remove
  , remove
  , StringSplit
  , symbolsToObject
  , walkPx
  , CommentCache
  , Ix(..)
  ) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Data.Array (null)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (for_)
import Data.FoldableWithIndex (foldrWithIndex)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Identity (Identity)
import Data.Maybe (Maybe(..))
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret, DekuElement, DekuOutcome(..), Nut(..), PSR(..), actOnLifecycleForElement, eltAttribution, getLifecycle, handleAtts, notLucky, runListener, thunker)
import Deku.DOM (class TagToCtor, ctor)
import Deku.Interpret (toDekuElement)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.PursxParser as PxP
import Deku.PxTypes (PxAtt, PxNut)
import Deku.Some (EffectOp, Some)
import Deku.UnsafeDOM (cloneTemplate, insertBefore, toTemplate, unsafeCreateDocumentFragment, unsafeParentElement, unsafeParentNode)
import Effect (Effect, foreachE)
import Effect.Random (randomInt)
import Effect.Uncurried (EffectFn2, EffectFn7, mkEffectFn1, mkEffectFn2, mkEffectFn7, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn7, runEffectFn8)
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Prim.Row as Row
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Comment as Comment
import Web.DOM.DocumentFragment (DocumentFragment)
import Web.DOM.DocumentFragment as DocumentFramgent
import Web.DOM.Element (Element)
import Web.DOM.Element as Element
import Web.DOM.Node as Node
import Web.DOM.NodeList as NodeList
import Web.DOM.ParentNode (QuerySelector(..), querySelector)
import Web.HTML (HTMLTemplateElement)

data CommentCache

foreign import makeUnindexedId :: Fn2 PxToken PxKey String
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
        ( PSR
            { beacon: Nothing
            , unsubs: []
            , fromPortal: false
            , parent: ((unsafeCoerce :: DocumentFragment -> DekuElement) frag)
            }
        )
        di
      let cmt = commentFromCache key cc
      nl <- Node.childNodes (DocumentFramgent.toNode frag) >>= NodeList.toArray
      -- ugh, this mixes @di and DOM APIs, refactor "one day"
      cmtPar <- runEffectFn1 unsafeParentNode (Comment.toNode cmt)
      foreachE nl \n -> do
        runEffectFn3 insertBefore n (Comment.toNode cmt) cmtPar
      runEffectFn7 walkPx (Proxy :: _ c) t r cc di unsubs e

----

class SymbolsToObject :: forall k. RL.RowList k -> Constraint
class SymbolsToObject rl where
  symbolsToObject
    :: Proxy rl -> Object.Object Boolean

doSymbolUpdates
  :: String
  -> Boolean
  -> Object.Object Boolean
  -> Object.Object Boolean
doSymbolUpdates str b o = Object.insert str b o

instance SymbolsToObject RL.Nil where
  symbolsToObject _ = Object.empty

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Poll.Poll (Attribute e)) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Attribute e) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Array (Attribute e)) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Array (Identity (Attribute e))) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    true
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k String c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Identity String) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k Nut c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObject (Proxy :: _ c))

instance
  ( IsSymbol k
  , SymbolsToObject c
  ) =>
  SymbolsToObject (RL.Cons k (Poll.Poll String) c) where
  symbolsToObject _ = doSymbolUpdates (reflectSymbol (Proxy :: _ k))
    false
    (symbolsToObject (Proxy :: _ c))

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
  => SymbolsToObject rl
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
  => SymbolsToObject rl
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
        syms = symbolsToObject rlProxy
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
                    else "<!--" <> pxToken <> "@!@" <> pat <> "-->"
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

data Remove

foreign import remove :: Remove

foreign import go
  :: forall r
   . EffectFn7 PxToken DekuElement HTMLTemplateElement (Object.Object Boolean)
       (STObject.STObject Global (STObject.STObject Global Element))
       (STObject.STObject Global Element)
       (Array { address :: String, payload :: Some r })
       Unit

template
  :: forall (@tag :: Symbol) (@html :: Symbol) ctor r0 rl0 r
       rl rr rrrl
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
  => SymbolsToObject rl
  => Row.Lacks "sendTo" r
  => Row.Lacks "remove" r
  => Row.Union r (sendTo :: Int, remove :: Remove) rr
  => RL.RowToList rr rrrl
  => TagToCtor tag ctor
  => Array (Poll (Attribute ctor))
  -> Poll { address :: String, payload :: Some rr }
  -> Nut
template arrrrrrr p = ctor (Proxy :: _ tag) arrrrrrr [ nut ]
  where
  nut = Nut $ mkEffectFn2 \(PSR psr) _ -> do
    let
      -- various proxies
      rlProxy = Proxy :: _ rl
      htmlProxy = Proxy :: _ html
      verbProxy = Proxy :: _ "~"
      verbSymbol = reflectSymbol verbProxy
      htmlSymbol = reflectSymbol htmlProxy
      syms = symbolsToObject rlProxy
    -- remove all ~foo~ attributes from the html
    pxToken <- show <$> randomInt 1 1010101
    let
      html = foldrWithIndex
        ( \key isAtt h ->
            String.replace
              (String.Pattern (verbSymbol <> key <> verbSymbol))
              ( let
                  idname = runFn2 makeUnindexedId (PxToken pxToken) (PxKey key)
                in
                  String.Replacement $
                    if isAtt then "id=\"" <> idname <> "\""
                    else "<span id=\"" <> idname <> "\"></span>"
              )
              h
        )
        htmlSymbol
        syms
    eltX <- runEffectFn1 toTemplate html
    -- build an element cache
    -- this will hold references to all of the elements that are hot,
    -- meaning that we can manipulate according to the template
    elementCache
      :: STObject.STObject Global (STObject.STObject Global Element) <-
      liftST
        STObject.new
    topCache :: STObject.STObject Global Element <- liftST STObject.new
    -- alas, our parent is not lucky, for a template is a dyn after all
    for_ psr.beacon (_.lucky >>> notLucky)
    -- the standard unsubs
    unsubs <- liftST $ STArray.new
    -- normal unsub management
    when (not (null psr.unsubs)) do
      void $ liftST $ STArray.pushAll psr.unsubs unsubs
    -- now that we have our element cache, we do something with it
    case p of
      OnlyPure x -> runEffectFn7 go (PxToken pxToken) psr.parent eltX syms
        elementCache
        topCache
        x
      OnlyEvent _ -> runListener
        ( mkEffectFn1 \a -> runEffectFn7 go (PxToken pxToken) psr.parent eltX
            syms
            elementCache
            topCache
            [ a ]
        )
        unsubs
        p
      OnlyPoll _ -> runListener
        ( mkEffectFn1 \a -> runEffectFn7 go (PxToken pxToken) psr.parent eltX
            syms
            elementCache
            topCache
            [ a ]
        )
        unsubs
        p
      PureAndEvent x e -> do
        runEffectFn7 go (PxToken pxToken) psr.parent eltX syms elementCache
          topCache
          x
        runListener
          ( mkEffectFn1 \a -> runEffectFn7 go (PxToken pxToken) psr.parent eltX
              syms
              elementCache
              topCache
              [ a ]
          )
          unsubs
          (OnlyEvent e)
      PureAndPoll x o -> do
        runEffectFn7 go (PxToken pxToken) psr.parent eltX syms elementCache
          topCache
          x
        runListener
          ( mkEffectFn1 \a -> runEffectFn7 go (PxToken pxToken) psr.parent eltX
              syms
              elementCache
              topCache
              [ a ]
          )
          unsubs
          (OnlyPoll o)
    -- there's no lifecycle, so no need to bind it
    -- NoOutcome isn't quite right as of course there
    -- is an outcome, but we know it will never be used
    -- because it is fed into a top-level element
    pure $ NoOutcome
