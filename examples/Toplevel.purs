module Deku.Toplevel where

import Prelude

import Data.Foldable (for_)
import Deku.Control (deku)
import Deku.Core (Element)
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (create, subscribe)
import FRP.Event.Phantom (PhantomEvent, Proof0, proof0, toEvent)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

runInElement
  :: forall push
   . Web.DOM.Element
  -> push
  -> ( (push -> Effect Unit)
       -> PhantomEvent Proof0 push
       -> Element PhantomEvent Proof0 (FFIDOMSnapshot -> Effect Unit)
     )
  -> Effect Unit
runInElement elt psh mksn = do
  ffi <- makeFFIDOMSnapshot
  { push, event } <- create
  let evt = deku elt (mksn push (proof0 event)) effectfulDOMInterpret
  void $ subscribe (toEvent evt) \i -> i ffi
  push psh

runInBody
  :: forall push
   . push
  -> ( (push -> Effect Unit)
       -> PhantomEvent Proof0 push
       -> Element PhantomEvent Proof0 (FFIDOMSnapshot -> Effect Unit)
     )
  -> Effect Unit
runInBody push go = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> runInElement elt push go

infix 1 runInBody as 🚀
