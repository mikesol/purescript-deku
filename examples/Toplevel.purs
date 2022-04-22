module Deku.Toplevel where

import Prelude

import Data.Maybe (maybe)
import Deku.Control (deku)
import Deku.Core (Element)
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
  -> (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  let evt = deku elt eee effectfulDOMInterpret
  subscribe evt \i -> i ffi

runInBody'
  :: (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

runInBody
  :: (forall lock. Event (Event (Element lock (FFIDOMSnapshot -> Effect Unit))))
  -> Effect Unit
runInBody a = void (runInBody' a)

infix 1 runInBody as 🚀
infix 1 runInBody' as 🚆