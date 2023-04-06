-- | These functions are used to run a Deku application. Running deku applications comes in three flavors:
-- |
-- | - Single-page applications
-- | - Static site rendering
-- | - Hydrated static sites
-- |
-- | The documentation in this module covers those three cases
module Deku.Toplevel where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), PSR, Scope(..))
import Control.Alt ((<|>))
import Control.Monad.Free (resume)
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Either (Either(..))
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Deku.Control (deku)
import Deku.Core (DOMInterpret(..), Nut(..), Nut', NutF(..), Node(..))
import Deku.Interpret (EFunctionOfFFIDOMSnapshot(..), FFIDOMSnapshot, FreeEFunctionOfFFIDOMSnapshotU, FunctionOfFFIDOMSnapshotU, fullDOMInterpret, getAllComments, hydratingDOMInterpret, makeFFIDOMSnapshot, setHydrating, ssrDOMInterpret, unSetHydrating)
import Deku.SSR (ssr')
import Effect (Effect)
import FRP.Event (Event, keepLatest, makeEvent, subscribe, subscribePure)
import Safe.Coerce (coerce)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Element as DOM
import Web.DOM.Element as Web.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

flattenToSingleEvent
  :: FFIDOMSnapshot
  -> Event FreeEFunctionOfFFIDOMSnapshotU
  -> Event FunctionOfFFIDOMSnapshotU
flattenToSingleEvent ffi = go' 0
  where
  go' n = keepLatest <<< map (go n)

  go :: Int -> FreeEFunctionOfFFIDOMSnapshotU -> Event FunctionOfFFIDOMSnapshotU
  go n = resume >>> case _ of
    Left (EFunctionOfFFIDOMSnapshot l) -> keepLatest (map (f n) l)
    Right _ -> mempty

  f
    :: Int
    -> (FFIDOMSnapshot -> Effect FreeEFunctionOfFFIDOMSnapshotU)
    -> Event FunctionOfFFIDOMSnapshotU
  f n i = go' (n + 1) $ makeEvent \k -> do
    pure unit
    i ffi >>= k
    pure (pure unit)

-- | Runs a deku application in a DOM element, returning a canceler that can
-- | be used to cancel the application.
runInElement'
  :: Web.DOM.Element
  -> Nut
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- liftST (RRef.new 0) <#> (deku elt eee <<< fullDOMInterpret)
  subscribe (flattenToSingleEvent ffi evt) \i -> i ffi

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
  di <- liftST (RRef.new 0) <#> hydratingDOMInterpret
  (coerce setHydrating :: _ -> _ Unit) ffi
  let me = "deku-root"
  root <- dekuRoot
  u <- subscribe
    ( flattenToSingleEvent ffi
        ( pure ((unwrap di).makeRoot { id: me, root }) <|> __internalDekuFlatten
            { parent: Just "deku-root"
            , scope: Local "rootScope"
            , raiseId: \_ -> pure unit
            , ez: true
            , pos: Nothing
            , dynFamily: Nothing
            }
            di
            (unsafeCoerce children)
        )
    )
    \i -> i ffi
  (coerce unSetHydrating :: _ -> _ Unit) ffi
  pure u

-- | Hydrates an application created using `runSSR`.
hydrate :: Nut -> Effect Unit
hydrate a = void (hydrate' a)

-- | Creates a static site from a deku application. The top-level element for this site is `body`.
runSSR
  :: forall r
   . Nut
  -> ST r String

runSSR = runSSR' "body"

-- | Creates a static site from a deku application. The top-level element for this site is the tag
-- | passed to this function as a first argument.
runSSR'
  :: String
  -> (forall r. Nut -> ST r String)
runSSR' topTag = go
  where
  go
    :: forall r. Nut -> ST r String
  go (Nut children) = do
    let
      unglobal = unsafeCoerce :: ST Global String -> ST r String

    unglobal
      ( ssr' topTag
          <$>
            ( do
                seed <- RRef.new 0
                instr <- RRef.new []
                let di = ssrDOMInterpret seed
                void $ subscribePure
                  ( ( __internalDekuFlatten
                        { parent: Just "deku-root"
                        , scope: Local "rootScope"
                        , raiseId: \_ -> pure unit
                        , ez: true
                        , pos: Nothing
                        , dynFamily: Nothing
                        }
                        di
                        children
                    )
                  )
                  \i -> i instr
                RRef.read instr
            )
      )

__internalDekuFlatten
  :: forall payload
   . PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> NutF payload
  -> Event payload
__internalDekuFlatten a b c = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
  a
  b
  ((coerce :: NutF payload -> Nut' payload) c)