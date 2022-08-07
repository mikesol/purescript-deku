module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), PSR, Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (deku, deku1, dekuA)
import Deku.Core (DOMInterpret(..), Domable, M, Node(..))
import Deku.Interpret (FFIDOMSnapshot, Instruction, fullDOMInterpret, hydratingDOMInterpret, makeFFIDOMSnapshot, setHydrating, ssrDOMInterpret, unSetHydrating)
import Deku.SSR (ssr')
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (AnEvent, Event, fromEvent, subscribe)
import Mermaid (liftImpure, liftPure, runImpure, runPure)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

runInElement'
  :: Web.DOM.Element
  -> (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku elt eee <<< fullDOMInterpret)
  canceler <- runImpure $ subscribe evt \i -> liftImpure (i ffi)
  pure $ runImpure canceler

runInElement1'
  :: Web.DOM.Element
  -> (forall lock. Event (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElement1' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku1 elt (fromEvent eee) <<< fullDOMInterpret)
  canceler <- runImpure $ subscribe evt \i -> liftImpure (i ffi)
  pure $ runImpure canceler

runInElementA'
  :: Web.DOM.Element
  -> (forall lock. Array (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElementA' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (dekuA elt eee <<< fullDOMInterpret)
  canceler <- runImpure $ subscribe evt \i -> liftImpure (i ffi)
  pure $ runImpure canceler

runInBody'
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

runInBody1'
  :: (forall lock. Event (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBody1' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement1' elt eee) (toElement <$> b')

runInBodyA'
  :: (forall lock. Array (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBodyA' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElementA' elt eee) (toElement <$> b')

runInBody
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
runInBody a = void (runInBody' a)

runInBody1
  :: (forall lock. Event (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBody1 a = void (runInBody1' a)

runInBodyA
  :: (forall lock. Array (Domable lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBodyA a = void (runInBodyA' a)

--

hydrate'
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
hydrate' children = do
  ffi <- makeFFIDOMSnapshot
  di <- Ref.new 0 <#> hydratingDOMInterpret
  setHydrating ffi
  u <- runImpure $ subscribe
    ( __internalDekuFlatten
        { parent: Just "deku-root"
        , scope: Local "rootScope"
        , raiseId: \_ -> pure unit
        }
        di
        (unsafeCoerce children)
    )
    \i -> liftImpure (i ffi)
  unSetHydrating ffi
  pure $ runImpure u

hydrate
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
hydrate a = void (hydrate' a)

--
newtype Template = Template { head :: String, tail :: String }

derive instance Newtype Template _

runSSR
  :: Template
  -> ( forall lock
        . Domable lock
            (RRef.STRef Global (Array Instruction) -> ST Global Unit)
     )
  -> M String
runSSR = runSSR' "body"

runSSR'
  :: String
  -> Template
  -> ( forall lock
        . Domable lock
            (RRef.STRef Global (Array Instruction) -> ST Global Unit)
     )
  -> M String
runSSR' topTag (Template { head, tail }) children =
  (head <> _) <<< (_ <> tail) <<< ssr' topTag
    <$> liftST
      ( do
          seed <- RRef.new 0
          instr <- RRef.new []
          let di = ssrDOMInterpret seed
          _ <- runPure $ subscribe
            ( __internalDekuFlatten
                { parent: Just "deku-root"
                , scope: Local "rootScope"
                , raiseId: \_ -> pure unit
                }
                di
                (unsafeCoerce children)
            )
            \i -> liftPure $ i instr
          RRef.read instr
      )

__internalDekuFlatten
  :: forall lock payload
   . PSR M
  -> DOMInterpret payload
  -> Domable lock payload
  -> AnEvent M payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
