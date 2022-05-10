module Deku.Toplevel where

import Prelude

import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Maybe (maybe)
import Data.Newtype (class Newtype)
import Deku.Control (__internalDekuFlatten, deku, deku1, deku2, dekuA, deleteMeASAP)
import Deku.Core (Domable, Element)
import Deku.Interpret (FFIDOMSnapshot, Instruction, fullDOMInterpret, hydratingDOMInterpret, makeFFIDOMSnapshot, ssrDOMInterpret)
import Deku.SSR (ssr, ssr')
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (Event, subscribe)
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

runInElement2'
  :: Web.DOM.Element
  -> (forall lock. Element Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement2' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- Ref.new 0 <#> (deku2 elt eee <<< fullDOMInterpret)
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

runInBody2'
  :: (forall lock. Element Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInBody2' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement2' elt eee) (toElement <$> b')

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

runInBody2
  :: (forall lock. Element Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
runInBody2 a = void (runInBody2' a)

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
  subscribe
    ( __internalDekuFlatten
        { parent: "deku-root", scope: "rootScope", raiseId: \_ -> pure unit }
        di
        (deleteMeASAP children)
    )
    \i -> i ffi

hydrate
  :: (forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
hydrate a = void (hydrate' a)

--
newtype Template = Template { head :: String, tail :: String }

derive instance Newtype Template _

runSSR
  :: forall s m
   . MonadST s m
  => Template
  -> ( forall lock
        . Domable (ST s) lock
            (RRef.STRef s (Array Instruction) -> ST s Unit)
     )
  -> m String
runSSR = runSSR' "body"

runSSR'
  :: forall s m
   . MonadST s m
  => String
  -> Template
  -> ( forall lock
        . Domable (ST s) lock
            (RRef.STRef s (Array Instruction) -> ST s Unit)
     )
  -> m String
runSSR' topTag (Template { head, tail }) children =
  (head <> _) <<< (_ <> tail) <<< ssr' topTag
    <$> liftST
      ( do
          seed <- RRef.new 0
          instr <- RRef.new []
          let di = ssrDOMInterpret seed
          void $ subscribe
            ( __internalDekuFlatten
                { parent: "deku-root"
                , scope: "rootScope"
                , raiseId: \_ -> pure unit
                }
                di
                (deleteMeASAP children)
            )
            \i -> i instr
          RRef.read instr
      )
