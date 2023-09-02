-- | These functions are used to run a Deku application.
module Deku.Toplevel where

import Prelude

import Data.Maybe (Maybe(..), maybe)
import Deku.Core (Nut(..), PSR(..))
import Deku.Interpret (fullDOMInterpret, toDekuElement)
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

-- | Runs a deku application in a DOM element, returning a canceler that can
-- | be used to cancel the application.
runInElement
  :: Web.DOM.Element
  -> Nut
  -> Effect Unit
runInElement elt (Nut nut) = void $ runEffectFn2 nut
  ( PSR
      { parent: toDekuElement elt
      , fromPortal: false
      , unsubs: []
      , beacon: Nothing
      }
  )
  fullDOMInterpret

-- -- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody
  :: Nut
  -> Effect Unit
runInBody elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip runInElement elt)
    (toElement <$> b')
