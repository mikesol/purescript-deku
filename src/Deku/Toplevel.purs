module Deku.Toplevel where

import Prelude

import Data.Maybe (maybe)
import Deku.Control (deku, deku1, deku2, dekuA)
import Deku.Core (Domable, Element)
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
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
  let evt = deku elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElement1'
  :: Web.DOM.Element
  -> (forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElement1' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku1 elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElement2'
  :: Web.DOM.Element
  -> (forall lock. Element Effect lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement2' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku2 elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElementA'
  :: Web.DOM.Element
  -> (forall lock. Array (Domable Effect lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElementA' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = dekuA elt eee effectfulDOMInterpret
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
