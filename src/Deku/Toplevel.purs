module Deku.Toplevel where

import Prelude

import Data.Maybe (maybe)
import Deku.Control (deku, deku0, deku1, deku2, dekuA)
import Deku.Core (Element, Child)
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
  -> (forall lock. Event (Event (Child lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElement0'
  :: Web.DOM.Element
  -> (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect (Effect Unit)
runInElement0' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku0 elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElement1'
  :: Web.DOM.Element
  -> (forall lock. Event (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElement1' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku1 elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElement2'
  :: Web.DOM.Element
  -> (forall lock. Element lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement2' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku2 elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInElementA'
  :: Web.DOM.Element
  -> (forall lock. Array (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInElementA' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = dekuA elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInBody'
  :: (forall lock. Event (Event (Child lock (FFIDOMSnapshot -> Effect Unit)) ))
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

runInBody0'
  :: (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect (Effect Unit)
runInBody0' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement0' elt eee) (toElement <$> b')

runInBody1'
  :: (forall lock. Event (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBody1' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement1' elt eee) (toElement <$> b')

runInBody2'
  :: (forall lock. Element lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInBody2' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement2' elt eee) (toElement <$> b')

runInBodyA'
  :: (forall lock. Array (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect (Effect Unit)
runInBodyA' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElementA' elt eee) (toElement <$> b')

runInBody
  :: (forall lock. Event (Event (Child lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect Unit
runInBody a = void (runInBody' a)

runInBody0
  :: (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect Unit
runInBody0 a = void (runInBody0' a)

runInBody1
  :: (forall lock. Event (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBody1 a = void (runInBody1' a)

runInBody2
  :: (forall lock. Element lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
runInBody2 a = void (runInBody2' a)

runInBodyA
  :: (forall lock. Array (Element lock (FFIDOMSnapshot -> Effect Unit)))
  -> Effect Unit
runInBodyA a = void (runInBodyA' a)
