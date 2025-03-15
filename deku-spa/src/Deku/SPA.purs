-- | These functions are used to run a Deku application.
module Deku.SPA
  ( runInElement
  , runInBody
  ) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Uncurried (runSTFn1, runSTFn3)
import Data.Maybe (maybe)
import Deku.Core (Nut(..), newPSR)
import Deku.SPAInterpret (spaInterpret)
import Deku.Internal.Ancestry as Ancestry
import Deku.Internal.Entities (DekuParent(..), toDekuElement)
import Deku.Internal.Region as Region
import Effect (Effect)
import Effect.Exception (error, throwException)
import Effect.Uncurried (runEffectFn2)
import FRP.Poll (create)
import Web.DOM as Web.DOM
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
  region <- liftST $ runSTFn1 Region.fromParent (DekuParent $ toDekuElement elt)
  scope <- liftST $ runSTFn3 newPSR Ancestry.root lifecycle region
  void $ runEffectFn2 nut scope spaInterpret
  pure $ dispose unit

doInBody :: forall i o. (Web.DOM.Element -> i -> Effect o) -> i -> Effect o
doInBody f elt = do
  b' <- window >>= document >>= body
  maybe (throwException (error "Could not find element"))
    (flip f elt)
    (toElement <$> b')

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody
  :: Nut
  -> Effect (Effect Unit)
runInBody = doInBody runInElement
