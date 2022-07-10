module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), PSR, Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as RRef
import Data.Array.ST as STA
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (deku)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..))
import Deku.Interpret (EffectfulFFIDOMSnapshot, FFIDOMSnapshot(..), SSRElement(..), SSRText, fullDOMInterpret, makeFFIDOMSnapshot, ssrDOMInterpret)
import Deku.SSR (ssr)
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (AnEvent, subscribe)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

runInElement'
  :: Web.DOM.Element
  -> ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- liftST $ makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku elt eee <<< fullDOMInterpret)
  subscribe evt \i -> i ffi

runInBody'
  :: ( forall lock
        . Domable Web.DOM.Element Effect lock (EffectfulFFIDOMSnapshot -> Effect Unit)
     )
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

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
  -> Effect (Effect Unit)
hydrate' children = do
  ffi@(FFIDOMSnapshot ffi') <- liftST $ makeFFIDOMSnapshot
  di <- Ref.new 0 <#> fullDOMInterpret
  void $ liftST $ RRef.write true ffi'.hydrating
  u <- subscribe
    ( __internalDekuFlatten
        { parent: Just "deku-root"
        , scope: Local "rootScope"
        , raiseId: \_ _ -> pure unit
        }
        di
        (unsafeCoerce children)
    )
    \i -> i ffi
  void $ liftST $ RRef.write false ffi'.hydrating
  pure u

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