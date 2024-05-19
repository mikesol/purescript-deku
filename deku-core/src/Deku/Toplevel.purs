-- | These functions are used to run a Deku application.
module Deku.Toplevel where

import Prelude

import Data.Maybe (Maybe(..), maybe)
import Deku.Core (DOMInterpret, Nut(..), PSR(..), toDekuElement)
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.HydratingDOMInterpret (hydratingDOMInterpret)
import Deku.SSRDomInterpret (ssrDOMInterpret)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Ref as Ref
import Effect.Uncurried (runEffectFn2)
import Web.DOM.Element (Element, toNode)
import Web.DOM.Element as Web.DOM
import Web.DOM.Node (firstChild)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

runInElement'
  :: DOMInterpret
  -> Web.DOM.Element
  -> Nut
  -> Effect Unit
runInElement' di elt (Nut nut) = void $ runEffectFn2 nut
  ( PSR
      { parent: toDekuElement elt
      , fromPortal: false
      , unsubs: []
      , beacon: Nothing
      }
  )
  di

runInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect Unit
runInElement = runInElement' fullDOMInterpret

ssrInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect Unit
ssrInElement = runInElement' ssrDOMInterpret

hydrateInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect Unit
hydrateInElement a b = do
  r <- firstChild (toNode a) >>= Ref.new
  runInElement' (hydratingDOMInterpret r) a b

runInBody'
  :: (Element -> Nut -> Effect Unit)
  -> Nut
  -> Effect Unit
runInBody' f elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip f elt)
    (toElement <$> b')

runInBody :: Nut -> Effect Unit
runInBody = runInBody' runInElement

ssrInBody :: Nut -> Effect Unit
ssrInBody = runInBody' ssrInElement

hydrateInBody :: Nut -> Effect Unit
hydrateInBody = runInBody' hydrateInElement
