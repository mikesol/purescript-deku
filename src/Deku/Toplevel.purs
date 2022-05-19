module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR, Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as RRef
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (deku, deku1, dekuA, elementify)
import Deku.Core (class Korok, DOMInterpret(..), Domable, Node(..))
import Deku.Interpret (FFIDOMSnapshot, Instruction, fullDOMInterpret, hydratingDOMInterpret, makeFFIDOMSnapshot, ssrDOMInterpret)
import Deku.SSR (ssr')
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (AnEvent, Event, subscribe)
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
  ::  (forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
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
  subscribe
    ( __internalDekuFlatten
        { parent: Just "deku-root"
        , scope: Local "rootScope"
        , raiseId: \_ -> pure unit
        }
        di
        (unsafeCoerce children)
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
   . Korok s m
  => Template
  -> ( forall lock
        . Domable (ST s) lock
            (RRef.STRef s (Array Instruction) -> ST s Unit)
     )
  -> m String
runSSR = runSSR' "body"

runSSR'
  :: forall s m
   . Korok s m
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
                { parent: Just "deku-root"
                , scope: Local "rootScope"
                , raiseId: \_ -> pure unit
                }
                di
                (unsafeCoerce children)
            )
            \i -> i instr
          RRef.read instr
      )

__internalDekuFlatten
  :: forall s m lock payload
   . Korok s m
  => PSR m
  -> DOMInterpret m payload
  -> Domable m lock payload
  -> AnEvent m payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \_ (DOMInterpret { sendToTop }) id -> sendToTop { id }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , wrapElt: Element' <<< elementify "div" empty
  , toElt: \(Node e) -> Element e
  }