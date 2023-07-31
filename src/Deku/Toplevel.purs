-- | These functions are used to run a Deku application. Running deku applications comes in three flavors:
-- |
-- | - Single-page applications
-- | - Static site rendering
-- | - Hydrated static sites
-- |
-- | The documentation in this module covers those three cases
module Deku.Toplevel where

import Prelude

import Bolson.Control as BControl
import Bolson.Core (Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Foldable (for_)
import Data.List as List
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.Tuple (Tuple(..))
import Deku.Control (deku)
import Deku.Core (Node', Nut(..), NutF(..), flattenArgs)
import Deku.Interpret (fullDOMInterpret, getAllComments, hydratingDOMInterpret, makeFFIDOMSnapshot, setHydrating, ssrDOMInterpret, unSetHydrating)
import Deku.SSR (ssr')
import Effect (Effect)
import FRP.Event (subscribe)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as DOM
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

-- | Runs a deku application in a DOM element, returning a canceler that can
-- | be used to cancel the application.
runInElement'
  :: Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  seed <- liftST $ RRef.new 0
  cache <- liftST $ RRef.new Map.empty
  let
    executor f = f List.Nil ffi
  Tuple sub (Tuple unsub evt) <- liftST $ deku elt eee
    (fullDOMInterpret seed cache executor)
  u <- liftST $ subscribe evt executor
  for_ sub executor
  pure do
    for_ unsub executor
    liftST u

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody'
  :: Nut
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

-- | Runs a deku application in the body of a document
runInBody
  :: Nut
  -> Effect Unit
runInBody a = void (runInBody' a)

--

foreign import dekuRoot :: Effect DOM.Element

-- | Hydrates an application created using `runSSR`, returning a canceler that can
-- | be used to end the application.
hydrate' :: Nut -> Effect (Effect Unit)
hydrate' children = do
  ffi <- makeFFIDOMSnapshot
  getAllComments ffi
  seed <- liftST $ RRef.new 0
  cache <- liftST $ RRef.new Map.empty
  let
    executor f = f List.Nil ffi
    di = hydratingDOMInterpret seed cache executor
  (coerce setHydrating :: _ -> _ Unit) ffi
  let me = "deku-root"
  root <- dekuRoot
  Tuple sub (Tuple unsub evt) <- liftST $ __internalDekuFlatten
    (unsafeCoerce children)
    { parent: Just "deku-root"
    , scope: Local "rootScope"
    , raiseId: \_ -> pure unit
    , ez: true
    , pos: Nothing
    , dynFamily: Nothing
    }
    di
  (unwrap di).makeRoot { id: me, root } List.Nil ffi
  for_ sub executor
  u <- liftST $ subscribe evt executor
  (coerce unSetHydrating :: _ -> _ Unit) ffi
  pure do
    for_ unsub executor
    liftST $ u

-- | Hydrates an application created using `runSSR`.
hydrate :: Nut -> Effect Unit
hydrate a = void (hydrate' a)

-- | Creates a static site from a deku application. The top-level element for this site is `body`.
runSSR
  :: Nut
  -> ST Global String

runSSR = runSSR' "body"

-- | Creates a static site from a deku application. The top-level element for this site is the tag
-- | passed to this function as a first argument.
runSSR'
  :: String
  -> Nut
  -> ST Global String
runSSR' topTag = go
  where
  go
    :: Nut -> ST Global String
  go (Nut children) = ssr' topTag <$> do
    seed <- RRef.new 0
    instr <- RRef.new []
    cache <- liftST $ RRef.new Map.empty
    let di = ssrDOMInterpret seed cache mempty
    Tuple subscr _ <- __internalDekuFlatten
      children
      { parent: Just "deku-root"
      , scope: Local "rootScope"
      , raiseId: \_ -> pure unit
      , ez: true
      , pos: Nothing
      , dynFamily: Nothing
      }
      di
    for_ subscr (\f -> f List.Nil instr)
    RRef.read instr

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten a b c = BControl.flatten flattenArgs b c
  ((\(NutF x) -> x) a)
