module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), PSR, Scope(..))
import Bolson.Core as Bolson.Core
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as RRef
import Data.Array.ST as STA
import Data.Foldable (for_, oneOf)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\))
import Deku.Control (deku)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..))
import Deku.Interpret (FFIDOMSnapshot(..), SSRElement(..), SSRText, EffectfulFFIDOMSnapshot, fullDOMInterpret, makeFFIDOMSnapshot, ssrDOMInterpret)
import Deku.SSR (ssr)
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (AnEvent, subscribe)
import FRP.Event.Class (bang)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.Window (document)

runInElement'
  :: Web.DOM.Element
  -> ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect (EffectfulFFIDOMSnapshot /\ (Effect Unit))
runInElement' elt eee = do
  ffi <- liftST $ makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku elt eee <<< fullDOMInterpret)
  Tuple ffi <$> subscribe evt \i -> i ffi

runInBody'
  :: ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect (EffectfulFFIDOMSnapshot /\ (Effect Unit))
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe (Tuple <$> (liftST $ makeFFIDOMSnapshot) <*> mempty) (\elt -> runInElement' elt eee) (toElement <$> b')

runInBody
  :: ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect Unit
runInBody a = void (runInBody' a)

--

hydrate'
  :: ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect (EffectfulFFIDOMSnapshot /\ (Effect Unit))
hydrate' children = do
  ffi@(FFIDOMSnapshot ffi') <- liftST $ makeFFIDOMSnapshot
  di@(DOMInterpret di') <- Ref.new 0 <#> fullDOMInterpret
  me <- di'.ids
  b' <- window >>= document >>= body
  b' # maybe(Tuple <$> (liftST $ makeFFIDOMSnapshot) <*> mempty) \root -> do
    void $ liftST $ RRef.write true ffi'.hydrating
    (u :: Effect Unit) <- subscribe
      ( oneOf
          [ bang (di'.makeRoot { id: me, root: (HTMLElement.toElement root) })
          , __internalDekuFlatten
              { parent: Just me
              , scope: Bolson.Core.Local "rootScope"
              , raiseId: \_ _ -> pure unit
              }
              di
              (unsafeCoerce children)
          ]
      ) \i -> i ffi
    void $ liftST $ RRef.write false ffi'.hydrating
    pure $ Tuple ffi u

hydrate
  :: ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect Unit
hydrate a = void (hydrate' a)

--
newtype Template = Template { head :: String, tail :: String }

derive instance Newtype Template _

runSSR
  :: forall s m
   . Korok s m
  => Template
  -> ( forall lock
        . Domable (SSRElement s) (ST s) lock
            ( FFIDOMSnapshot s (SSRElement s) SSRText
              -> ST s Unit
            )
     )
  -> m String
runSSR  (Template { head, tail }) children = do
  o <- liftST
      ( do
          ffi <- makeFFIDOMSnapshot
          attributes <- STA.new
          evt <- RRef.new 0 <#> (deku (SSRElement { attributes, tag: "body" }) children <<< ssrDOMInterpret)
          void $ subscribe evt \i -> i ffi
          ssr ffi
      )
  pure (head <> o <> tail)

__internalDekuFlatten
  :: forall s m e lock payload
   . Korok s m
  => PSR m
  -> DOMInterpret e m payload
  -> Domable e m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , dynamicElementRemoved:
      \(DOMInterpret { removeChild }) { id, scope } ->
        removeChild { id, scope }
  , dynamicElementInserted: \(DOMInterpret { addChild }) { id, parent } ->
      addChild { child: id, parent }
  , toElt: \(Node e) -> Element e
  }