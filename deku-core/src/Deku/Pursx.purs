module Deku.Pursx
  ( pursx
  , pursx'
  , template
  , class PursxSubstitutions
  , class ToElementCache
  , class TemplateSubstitutions
  , class EmptyMe
  , emptyMe
  ) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Plus (empty)
import Data.Array (null)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (foldr, for_)
import Data.Identity (Identity(..))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.TraversableWithIndex (traverseWithIndex)
import Data.Tuple (Tuple(..))
import Deku.Attribute (Attribute, AttributeValue(..), Key(..), Value(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), DekuChild(..), DekuOutcome(..), DekuParent(..), Nut(..), PSR(..), actOnLifecycleForElement, eltAttribution, getLifecycle, notLucky, runListener, text, thunker)
import Deku.Interpret (attributeDynParentForElementEffect, fromDekuText, toDekuElement, toDekuText)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.Path (symbolsToArray)
import Deku.Path as Path
import Deku.PathWalker (InstructionDelegate(..), MElement, mEltElt, mEltify, processAttPursx, processNutPursx, returnReplacement, returnReplacementIndex, returnReplacementNoIndex)
import Deku.PathWalker as PW
import Deku.PursxParser as PxP
import Deku.PxTypes (PxAtt, PxNut)
import Deku.Some (class AsTypeConstructor, class Labels, EffectOp, Some, projProof)
import Deku.Some as Some
import Deku.UnsafeDOM (cloneTemplate, toTemplate, unsafeFirstChild, unsafeParentNode)
import Effect (foreachE)
import Effect.Exception (error, throwException)
import Effect.Ref (new)
import Effect.Uncurried (EffectFn1, EffectFn5, mkEffectFn1, mkEffectFn2, mkEffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn8)
import FRP.Poll (Poll)
import Foreign.Object as Object
import Foreign.Object.ST as STObject
import Foreign.Object.Unsafe (unsafeIndex)
import Prim.Row as R
import Prim.Row as Row
import Prim.RowList as RL
import Record as Record
import Record.Unsafe (unsafeGet)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.DocumentFragment as DocumentFragment
import Web.DOM.Element as Element
import Web.DOM.Node (nodeTypeIndex, replaceChild)
import Web.DOM.Node as Node
import Web.DOM.Text as Text
import Web.HTML.HTMLTemplateElement as HtmlTemplateElement

class EmptyMe (r :: Row Type) (rl :: RL.RowList Type) | rl -> r where
  emptyMe :: Proxy rl -> { | r }

instance EmptyMe () RL.Nil where
  emptyMe _ = {}

instance
  ( IsSymbol k
  , R.Lacks k r'
  -- we go from an array to a single attribute
  -- because of the way `walk` works
  , R.Cons k (Poll (Attribute e)) r' r
  , EmptyMe r' rl
  ) =>
  EmptyMe r (RL.Cons k (Array (Identity (Attribute e))) rl) where
  emptyMe _ = Record.insert (Proxy :: _ k) empty (emptyMe (Proxy :: _ rl))

instance
  ( IsSymbol k
  , R.Lacks k r'
  , R.Cons k (Poll String) r' r
  , EmptyMe r' rl
  ) =>
  EmptyMe r (RL.Cons k (Identity String) rl) where
  emptyMe _ = Record.insert (Proxy :: _ k) empty (emptyMe (Proxy :: _ rl))

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
  PursxSubstitutions (RL.Cons k PxAtt c)
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
  TemplateSubstitutions (RL.Cons k PxAtt c)
    r

class ToElementCache (rl :: RL.RowList Type) (r :: Row Type) | rl -> r

instance ToElementCache RL.Nil ()
instance
  ( Row.Cons k (EffectOp a) r' r
  , ToElementCache c r'
  ) =>
  ToElementCache (RL.Cons k a c) r

pursx
  :: forall (@html :: Symbol) p pl r0 rl0 r rl plr path scrunched
   . IsSymbol html
  => PxP.PXStart "~" " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched r
  => { | r }
  -> Nut
pursx = pursx' @"~" @html

pursx'
  :: forall @verb (@html :: Symbol) r0 rl0 p pl r rl plr path scrunched
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r0 p
  => RL.RowToList r0 rl0
  => RL.RowToList r rl
  => PursxSubstitutions rl0 r
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched r
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
        scrunch = Proxy :: _ scrunched
        syms = symbolsToArray rlProxy
        -- remove all ~s~ from the html attributes
        html = foldr
          ( \(Tuple isAtt pat) h ->
              String.replaceAll
                (String.Pattern (verbSymbol <> pat <> verbSymbol))
                ( String.Replacement $
                    if isAtt then ""
                    else "<!--" <> verbSymbol <> pat <> verbSymbol <> "-->"
                )
                h
          )
          (reflectSymbol htmlProxy)
          syms
      -- turn the pursx i into a template
      eltX <- runEffectFn1 toTemplate html
      -- clone the template
      elt <- runEffectFn1 cloneTemplate eltX
      let unsafeMElement = mEltify (Element.toNode elt)
      runEffectFn3 eltAttribution ps di (toDekuElement elt)
      -- walk through the template, getting all of the elements and
      -- setting up listeners
      -- for example, processAttPursx handles all of the attributes in
      -- pursx
      runEffectFn5
        ( PW.walk
            :: EffectFn5 InstructionDelegate (Proxy scrunched) { | r }
                 DOMInterpret
                 MElement
                 Unit
        )
        ( InstructionDelegate
            { processAttribute: mkEffectFn4 \a b c d -> runEffectFn4
                processAttPursx
                a
                b
                c
                d
            , processPollString: mkEffectFn4 \a b c d -> runEffectFn4
                (processNutPursx returnReplacementNoIndex)
                a
                (text b)
                c
                d
            , processNut: mkEffectFn4 \a b c d -> runEffectFn4
                (processNutPursx returnReplacementNoIndex)
                a
                b
                c
                d
            }
        )
        scrunch
        r
        di
        unsafeMElement
      -- standard unsub management, just like in elementify
      unsubs <- liftST $ STArray.new
      when (not (Array.null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
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

template
  :: forall (@html :: Symbol) p pl r0 rl0 elementCache r rl rr plr path
       scrunched withLifecycle maybes rEmpty
   . IsSymbol html
  -- r0 is the original row we get from parsing the pursx
  -- it contains all of the attributes and template rows
  -- pointing to PxNut and PxAtt respectively
  => PxP.PXStart "~" " " html r0 p
  -- r0 as a rowlist
  => RL.RowToList r0 rl0
  -- r contains the valid types for this template
  -- PxAtt -> Poll (Attribute e)
  -- PxNut -> Poll String
  => TemplateSubstitutions rl0 r
  -- turn r to a row list
  => RL.RowToList r rl
  -- turn p (the path) to a row list
  => RL.RowToList p pl
  -- get all the symbols for atts when we do string replacement
  => Path.SymbolsToArray rl
  -- create a row of empty polls from r
  -- needed for the walk recurser
  => EmptyMe rEmpty rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched rEmpty
  => Row.Lacks "sendTo" r
  => Row.Lacks "remove" r
  => Row.Union (sendTo :: Int, remove :: Unit) r rr
  => RL.RowToList rr withLifecycle
  => Labels withLifecycle
  => AsTypeConstructor EffectOp rr elementCache
  => AsTypeConstructor Maybe rr maybes
  => Poll (Tuple String (Some rr))
  -> Nut
template p = Nut $ mkEffectFn2
  \(PSR psr)
   (DOMInterpret di) -> projProof @withLifecycle \proof ->
    do
      let
        -- various proxies
        rlProxy = Proxy :: _ rl
        htmlProxy = Proxy :: _ html
        verbProxy = Proxy :: _ "~"
        verbSymbol = reflectSymbol verbProxy
        scrunch = Proxy :: _ scrunched
        syms = symbolsToArray rlProxy
        -- remove all ~foo~ attributes from the html
        html = foldr
          ( \(Tuple isAtt pat) h ->
              String.replaceAll
                (String.Pattern (verbSymbol <> pat <> verbSymbol))
                ( String.Replacement $
                    if isAtt then ""
                    else "<!--" <> verbSymbol <> pat <> verbSymbol <> "-->"
                )
                h
          )
          (reflectSymbol htmlProxy)
          syms
      -- build an element cache
      -- this will hold references to all of the elements that are hot,
      -- meaning that we can manipulate according to the template
      elementCache :: STObject.STObject Global { | elementCache } <- liftST
        STObject.new
      -- we don't want to recurse over text nodes constantly checking their content
      -- so we create a cache that helps us with that (we'll see)
      -- it used later
      isStringCache :: STObject.STObject Global MElement <- liftST
        STObject.new
      eltX <- runEffectFn1 toTemplate html
      -- we set up a dummy cache that we 
      -- just use so that we can have the same walking al
      let emptiness = emptyMe (Proxy :: _ rl)
      -- we know we'll need this walk many times, so
      -- we take it out of the loop
      let
        walker =
          PW.walk
            :: EffectFn5 InstructionDelegate (Proxy scrunched)
                 { | rEmpty }
                 DOMInterpret
                 MElement
                 Unit
      do
        -- this bloc splits all of the dynamic text nodes into
        -- separate text nodes, which makes recursing over them faster as
        -- we only need to do previousNode instead of splitText
        ctnt <- HtmlTemplateElement.content eltX
        elt <- runEffectFn1 unsafeFirstChild (DocumentFragment.toNode ctnt)
        runEffectFn5
          walker
          ( InstructionDelegate
              { processAttribute: mkEffectFn4 \_ _ _ _ -> pure unit
              , processPollString: mkEffectFn4 \a _ _ dd -> do
                  void $ liftST $ STObject.poke a dd isStringCache
                  void $ runEffectFn2
                    returnReplacementNoIndex
                    a
                    dd
              , processNut: mkEffectFn4 \_ _ _ _ -> throwException
                  ( error
                      "Programming error: template should not be called with a string"
                  )
              }
          )
          scrunch
          emptiness
          (DOMInterpret di)
          (unsafeCoerce (mEltify elt))
      let
        frozenIsStringcache =
          ( unsafeCoerce
              :: STObject.STObject Global MElement -> Object.Object MElement
          ) isStringCache
      indices <- traverseWithIndex
        (\k v -> runEffectFn2 returnReplacementIndex k v)
        frozenIsStringcache
      -- as usual, we start off lucky
      -- even though this can enver be unlucky as templates can only
      -- ever be populated with elements (not dyn), we still need it
      -- just cuz of the type contracts
      lucky <- new true
      -- alas, our parent is not lucky, for a template is a dyn after all
      for_ psr.beacon (_.lucky >>> notLucky)
      -- it's a dyn, so we need an opening beacon
      dbStart <- di.makeOpenBeacon
      -- the standard unsubs
      unsubs <- liftST $ STArray.new
      -- normal unsub management
      when (not (null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      -- also need a close beacon
      dbEnd <- di.makeCloseBeacon
      -- do the same close beacon management as our dyn friends
      case psr.beacon of
        Nothing -> do
          runEffectFn2 di.attributeBeaconParent dbStart (DekuParent psr.parent)
          runEffectFn2 di.attributeBeaconParent dbEnd (DekuParent psr.parent)
        Just y -> do
          runEffectFn5 di.attributeDynParentForBeacons dbStart dbEnd
            y.start
            y.end
            Nothing

      -- this is the function that does everything
      -- everrrryyyyyythingggggg
      -- the deal is that, when a dyn comes down the pipe
      -- either it is in the cache or not
      -- if its not, we WALK and fill the cache
      -- after it's in the cache, we can look at the `Some`
      -- and use it to do our attribute and text wizardry
      let
        oh'hi sstaaarrrrrt eeeeeennnnd = mkEffectFn1 \(Tuple ix value) -> do
          liftST (STObject.peek ix elementCache) >>= case _ of
            -- the elts have been registered already
            Just elts -> do
              runEffectFn2 Some.foreachE value elts
            -- yup, it's that time!
            -- clone the template, wire up othe elts, etc
            -- this is the biggie
            Nothing -> do
              -- we get all of the values that exist upon creation
              let proj'd = Some.projWithProof proof value
              let mpos = (unsafeGet "sendTo" proj'd :: Maybe Int)
              -- clone the template
              elt <- runEffectFn1 cloneTemplate eltX
              -- wire it up for the walking algo
              let unsafeMElement = mEltify (Element.toNode elt)
              -- insert our fledgling element into the dyn
              runEffectFn5 attributeDynParentForElementEffect lucky
                (DekuChild (toDekuElement elt))
                sstaaarrrrrt
                eeeeeennnnd
                mpos
              -- this is our element cache
              -- we don't even try to have a semblance of type
              -- safety here
              -- but we do have unit tests!
              -- we'll be casting this to { | elementCache } later
              oooooooooo :: STObject.STObject Global Void <- liftST $
                STObject.new
              -- we walk down to cache a bunch of functions in
              -- `oooooooooo` that will do our element manipulation
              -- these are either EffectFn1 attribute or
              -- EffectFn1 text
              runEffectFn5
                walker
                ( InstructionDelegate
                    { processAttribute: mkEffectFn4 \s _ _ eeeeeeeee -> do
                        let eeeee = mEltElt eeeeeeeee
                        obj <- liftST STObject.new
                        let getter key = liftST $ STObject.peek key obj
                        let
                          setter key = void <<< liftST <<< flip
                            (STObject.poke key)
                            obj
                        let delete key = liftST $ void $ STObject.delete key obj
                        let
                          effn
                            :: forall t
                             . EffectFn1 (Array (Identity (Attribute t))) Unit
                          effn = mkEffectFn1 \atts -> foreachE atts
                            \(Identity att) -> do
                              let { key, value } = unsafeUnAttribute att
                              case value of
                                Prop' v -> runEffectFn3 di.setProp
                                  (toDekuElement eeeee)
                                  (Key key)
                                  (Value v)
                                Cb' cb -> runEffectFn5 di.setCb
                                  (toDekuElement eeeee)
                                  (Key key)
                                  cb
                                  (getter key)
                                  (setter key)
                                Unset' -> runEffectFn4 di.unsetAttribute
                                  (toDekuElement eeeee)
                                  (Key key)
                                  (getter key)
                                  (delete key)
                        for_
                          ( unsafeGet s proj'd
                              :: forall e
                               . Maybe (Array (Identity (Attribute e)))
                          )
                          \a ->
                            runEffectFn1 effn a
                        void $ liftST $ STObject.poke s
                          ( ( unsafeCoerce
                                :: forall t
                                 . EffectFn1 (Array (Identity (Attribute t)))
                                     Unit
                                -> Void
                            ) effn
                          )
                          oooooooooo
                    , processPollString: mkEffectFn4 \s _ _ e' -> do
                        let iiiii = unsafeIndex indices s
                        realDeal0 <- runEffectFn2 returnReplacement iiiii
                          e'
                        realDeal <-
                          if nodeTypeIndex realDeal0 == 3 then pure
                            ((unsafeCoerce :: Node.Node -> Text.Text) realDeal0)
                          else do
                            nt <- runEffectFn1 di.makeText Nothing
                            par <- runEffectFn1 unsafeParentNode realDeal0
                            replaceChild
                              (Text.toNode $ fromDekuText nt)
                              realDeal0
                              par
                            pure (fromDekuText nt)
                        runEffectFn2 di.setText (toDekuText realDeal)
                          ( coerce
                              ( fromMaybe (Identity "")
                                  ( unsafeGet s proj'd
                                      :: Maybe (Identity String)
                                  )
                              )
                          )
                        let
                          effn = mkEffectFn1 \(Identity str) -> runEffectFn2
                            di.setText
                            (toDekuText realDeal)
                            str
                        void $ liftST $ STObject.poke s
                          ( ( unsafeCoerce
                                :: EffectFn1 (Identity String) Unit -> Void
                            ) effn
                          )
                          oooooooooo
                    , processNut: mkEffectFn4 \_ _ _ _ -> throwException
                        ( error
                            "Programming error: template should not be called with a nut"
                        )
                    }
                )
                scrunch
                emptiness
                (DOMInterpret di)
                unsafeMElement
              -- next up, our `oooooooooo` needs to listen for SEND
              -- and REMOVE events
              void $ liftST $ flip (STObject.poke "sendTo") oooooooooo
                $
                  ( unsafeCoerce
                      :: EffectFn1 Int Unit -> Void
                  )
                $ mkEffectFn1 \i -> do
                    runEffectFn5 di.sendToPosForElement lucky i
                      (toDekuElement elt)
                      dbStart
                      dbEnd
              void $ liftST $ flip (STObject.poke "remove") oooooooooo
                $
                  ( unsafeCoerce
                      :: EffectFn1 Unit Unit -> Void
                  )
                $ mkEffectFn1 \_ ->
                    do
                      runEffectFn2 di.removeForElement
                        false
                        (toDekuElement elt)
                      liftST $ void $ STObject.delete ix elementCache
              -- finally, we set the element cache so that next time all of
              -- this is "easier"
              let
                uuuuu =
                  ( unsafeCoerce
                      :: STObject.STObject Global Void
                      -> { | elementCache }
                  ) oooooooooo
              liftST $ void $ STObject.poke ix uuuuu elementCache
      -- now that we have our element cache, we do something with it
      runListener (oh'hi dbStart dbEnd) unsubs p
      -- finally, return the beacon
      pure $ DekuBeaconOutcome dbStart
