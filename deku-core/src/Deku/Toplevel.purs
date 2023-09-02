-- | These functions are used to run a Deku application. Running deku applications comes in three flavors:
-- |
-- | - Single-page applications
-- | - Static site rendering
-- | - Hydrated static sites
-- |
-- | The documentation in this module covers those three cases
module Deku.Toplevel where

import Prelude

-- import Bolson.Control as BControl
-- import Bolson.Core (Scope(..))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Foldable (for_, traverse_)
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Effect (Effect)
import Effect.Exception (error, throwException)
import FRP.Poll (sample_)
import FRP.Event (create, createPure, subscribe)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as DOM
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

-- -- | Runs a deku application in a DOM element, returning a canceler that can
-- -- | be used to cancel the application.
-- runInElement'
--   :: Web.DOM.Element
--   -> Nut
--   -> Effect (Effect FFIDOMSnapshot)
-- runInElement' elt eee = do
--   ffi <- makeFFIDOMSnapshot
--   seed <- liftST $ RRef.new 0
--   cache <- liftST $ RRef.new Map.empty
--   let
--     executor f = f ffi
--     bhv = deku elt eee (fullDOMInterpret seed cache executor)
--   bang <- liftST $ create
--   u <- liftST $ subscribe (sample_ bhv bang.event) executor
--   bang.push unit
--   pure do
--     o <- liftST $ RRef.read cache
--     for_ o (traverse_ executor)
--     liftST u
--     pure ffi

-- -- | Runs a deku application in the body of a document, returning a canceler that can
-- -- | be used to cancel the application.
-- runInBody'
--   :: Nut
--   -> Effect (Effect FFIDOMSnapshot)
-- runInBody' eee = do
--   b' <- window >>= document >>= body
--   maybe (throwException (error "Could not find element"))
--     (flip runInElement' eee)
--     (toElement <$> b')

-- -- | Runs a deku application in the body of a document
-- runInBody
--   :: Nut
--   -> Effect Unit
-- runInBody a = void (runInBody' a)

-- --

-- foreign import dekuRoot :: Effect DOM.Element

-- -- | Hydrates an application created using `runSSR`, returning a canceler that can
-- -- | be used to end the application.
-- hydrate' :: Nut -> Effect (Effect FFIDOMSnapshot)
-- hydrate' children = do
--   ffi <- makeFFIDOMSnapshot
--   getAllComments ffi
--   seed <- liftST $ RRef.new 0
--   cache <- liftST $ RRef.new Map.empty
--   let
--     executor f = f ffi
--     di = hydratingDOMInterpret seed cache executor
--   (coerce setHydrating :: _ -> _ Unit) ffi
--   let me = "deku-root"
--   root <- dekuRoot
--   headRedecorator <- liftST $ (unwrap di).ids
--   let
--     bhv = __internalDekuFlatten
--       (unsafeCoerce children)
--       { parent: Just "deku-root"
--       , scope: Local "rootScope"
--       , deferralPath: pure headRedecorator
--       , raiseId: \_ -> pure unit
--       , ez: true
--       , pos: Nothing
--       , dynFamily: Nothing
--       }
--       di
--   (unwrap di).makeRoot { id: me, root } ffi
--   bang <- liftST $ create
--   u <- liftST $ subscribe (sample_ bhv bang.event) executor
--   bang.push unit
--   (coerce unSetHydrating :: _ -> _ Unit) ffi
--   pure do
--     o <- liftST $ RRef.read cache
--     for_ o (traverse_ executor)
--     (unwrap di).forcePayload (pure headRedecorator) ffi
--     (unwrap di).deleteFromCache { id: me } ffi
--     liftST $ u
--     pure ffi

-- -- | Hydrates an application created using `runSSR`.
-- hydrate :: Nut -> Effect Unit
-- hydrate a = void (hydrate' a)

-- -- | Creates a static site from a deku application. The top-level element for this site is `body`.
-- runSSR
--   :: Nut
--   -> ST Global String

-- runSSR = runSSR' "body"

-- -- | Creates a static site from a deku application. The top-level element for this site is the tag
-- -- | passed to this function as a first argument.
-- runSSR'
--   :: String
--   -> Nut
--   -> ST Global String
-- runSSR' topTag = go
--   where
--   go
--     :: Nut -> ST Global String
--   go (Nut children) = ssr' topTag <$> do
--     seed <- RRef.new 0
--     instr <- RRef.new []
--     cache <- liftST $ RRef.new Map.empty
--     let di = ssrDOMInterpret seed cache mempty
--     -- we thunk to create the head redecorator
--     headRedecorator <- liftST $ (unwrap di).ids
--     let
--       bhv = __internalDekuFlatten
--         children
--         { parent: Just "deku-root"
--         , scope: Local "rootScope"
--         , raiseId: \_ -> pure unit
--         , deferralPath: pure headRedecorator
--         , ez: true
--         , pos: Nothing
--         , dynFamily: Nothing
--         }
--         di
--     bang <- createPure
--     _ <- subscribePure (sample_ bhv bang.event) (\f -> f instr)
--     bang.push unit
--     RRef.read instr

-- __internalDekuFlatten
--   :: forall payload
--    . NutF payload
--   -> Node' payload
-- __internalDekuFlatten a b c = BControl.flatten flattenArgs
--   ((\(NutF x) -> x) a)
--   b
--   c
