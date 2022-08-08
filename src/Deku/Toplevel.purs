module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), PSR, Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST)
import Control.Monad.ST.Global (Global, toEffect)
import Control.Monad.ST.Internal as RRef
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Control (deku, deku1, dekuA)
import Deku.Core (DOMInterpret(..), Domable, Node(..))
import Deku.Interpret (FFIDOMSnapshot, Instruction, fullDOMInterpret, hydratingDOMInterpret, makeFFIDOMSnapshot, mermaidDOMInterpret, setHydrating, unSetHydrating)
import Deku.SSR (ssr')
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (AnEvent, Event, subscribe)
import Mermaid (Mermaid, runImpure, runPure)
import Mermaid.Hyrule (toEfEvent, toStEvent)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

runInElement'
  :: Web.DOM.Element
  -> (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku elt eee <<< fullDOMInterpret)
  subscribe evt \i -> i ffi

runInElement1'
  :: Web.DOM.Element
  -> (forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElement1' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku1 elt eee <<< fullDOMInterpret)
  subscribe evt \i -> i ffi

runInElementA'
  :: Web.DOM.Element
  -> (forall lock. Array (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElementA' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (dekuA elt eee <<< fullDOMInterpret)
  subscribe evt \i -> i ffi

runInBody'
  :: (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

runInBody1'
  :: (forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBody1' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement1' elt eee) (toElement <$> b')

runInBodyA'
  :: (forall lock. Array (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBodyA' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElementA' elt eee) (toElement <$> b')

runInBody
  :: (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
runInBody a = void (runInBody' a)

runInBody1
  :: (forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBody1 a = void (runInBody1' a)

runInBodyA
  :: (forall lock. Array (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBodyA a = void (runInBodyA' a)

--

hydrate'
  :: (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
hydrate' children = do
  ffi <- makeFFIDOMSnapshot
  di <- Ref.new 0 <#> hydratingDOMInterpret
  setHydrating ffi
  u <- subscribe
    ( __internalDekuFlatten
        { parent: Just "deku-root"
        , scope: Local "rootScope"
        , raiseId: \_ -> pure unit
        }
        di
        (unsafeCoerce children)
    )
    \i -> i ffi
  unSetHydrating ffi
  pure u

hydrate
  :: (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
hydrate a = void (hydrate' a)

hydrateMermaid'
  :: ( forall lock
        . Domable (Mermaid Global) lock
            ( (RRef.STRef Global (Array Instruction)) /\ FFIDOMSnapshot
              -> Mermaid Global Unit
            )
     )
  -> Effect (Effect Unit)
hydrateMermaid' children = do
  ffi <- makeFFIDOMSnapshot
  ins <- toEffect $ RRef.new []
  di <- toEffect $ RRef.new 0 <#> mermaidDOMInterpret
  setHydrating ffi
  u <- subscribe
    ( toEfEvent $ __internalDekuFlatten
        { parent: Just "deku-root"
        , scope: Local "rootScope"
        , raiseId: \_ -> pure unit
        }
        di
        children
    )
    (\k -> runImpure $ k (ins /\ ffi))
  unSetHydrating ffi
  pure u

hydrateMermaid
  :: ( forall lock
        . Domable (Mermaid Global) lock
            ( (RRef.STRef Global (Array Instruction)) /\ FFIDOMSnapshot
              -> Mermaid Global Unit
            )
     )
  -> Effect Unit
hydrateMermaid a = void (hydrateMermaid' a)

--
newtype Template = Template { head :: String, tail :: String }

derive instance Newtype Template _

runSSRMermaid
  :: Template
  -> ( forall lock
        . Domable (Mermaid Global) lock
            ( (RRef.STRef Global (Array Instruction)) /\ FFIDOMSnapshot
              -> Mermaid Global Unit
            )
     )
  -> ST Global String
runSSRMermaid = runSSRMermaid' "body"

runSSRMermaid'
  :: String
  -> Template
  -> ( forall lock
        . Domable (Mermaid Global) lock
            ( (RRef.STRef Global (Array Instruction)) /\ FFIDOMSnapshot
              -> Mermaid Global Unit
            )
     )
  -> ST Global String
runSSRMermaid' topTag (Template { head, tail }) children =
  (head <> _) <<< (_ <> tail) <<< ssr' topTag <$> do
    let
      ffi :: FFIDOMSnapshot
      ffi = unsafeCoerce { units: {}, scopes: {} }
    inst <- RRef.new []
    dint <- RRef.new 0 <#> mermaidDOMInterpret
    void $ subscribe
      ( toStEvent $ __internalDekuFlatten
          { parent: Just "deku-root"
          , scope: Local "rootScope"
          , raiseId: \_ -> pure unit
          }
          dint
          children
      )
      (\k -> runPure $ k (inst /\ ffi))
    RRef.read inst

__internalDekuFlatten
  :: forall s m lock payload
   . MonadST s m
  => PSR m
  -> DOMInterpret m payload
  -> Domable m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
