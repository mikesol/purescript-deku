-- | These functions are used to run a Deku application.
module Deku.Toplevel where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (runSTFn2, runSTFn3)
import Data.Maybe (Maybe(..), maybe)
import Deku.Core (Nut(..), PSR(..))
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Entities (DekuParent(..), toDekuElement)
import Deku.Internal.Region as Region
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
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
  -> Effect (Effect Unit)
runInElement elt (Nut nut) = do
  { poll: lifecycle, push: dispose } <- liftST create
  let taggerStart = 0
  tagRef <- liftST $ ST.new $ taggerStart + 1
  let tagger = do
          tag <- liftST $ ST.read tagRef
          liftST $ void $ ST.write (tag + 1) tagRef
          pure tag
  region <- liftST $ runSTFn3 Region.fromParent taggerStart Nothing (DekuParent $ toDekuElement elt)
  void $ runEffectFn2 nut (PSR { region, unsubs: [], lifecycle })
    (fullDOMInterpret tagger)
  pure $ dispose unit

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody
  :: Nut
  -> Effect (Effect Unit)
runInBody elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip runInElement elt)
    (toElement <$> b')
