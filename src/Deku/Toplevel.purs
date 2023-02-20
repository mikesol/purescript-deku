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
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Deku.Control (deku)
import Deku.Core (DOMInterpret(..), Domable(..), Node(..), Domable')
import Deku.Interpret (FFIDOMSnapshot, Instruction, fullDOMInterpret, getAllComments, hydratingDOMInterpret, makeFFIDOMSnapshot, setHydrating, ssrDOMInterpret, unSetHydrating)
import Deku.SSR (ssr')
import Effect (Effect)
import FRP.Event (Event, subscribe, subscribePure)
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
  -> (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInElement' elt eee = do
  ffi <- makeFFIDOMSnapshot
  evt <- liftST (RRef.new 0) <#> (deku elt eee <<< fullDOMInterpret)
  subscribe evt \i -> i ffi

-- | Runs a deku application in the body of a document, returning a canceler that can
-- | be used to cancel the application.
runInBody'
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runInBody' eee = do
  b' <- window >>= document >>= body
  maybe mempty (\elt -> runInElement' elt eee) (toElement <$> b')

-- | Runs a deku application in the body of a document
runInBody
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
runInBody a = void (runInBody' a)

--

foreign import dekuRoot :: Effect DOM.Element

-- | Hydrates an application created using `runSSR`, returning a canceler that can
-- | be used to end the application.
hydrate'
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
hydrate' children = do
  ffi <- makeFFIDOMSnapshot
  getAllComments ffi
  di <- liftST (RRef.new 0) <#> hydratingDOMInterpret
  setHydrating ffi
  let me = "deku-root"
  root <- dekuRoot
  u <- subscribe
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
    \i -> i ffi
  unSetHydrating ffi
  pure u

-- | Hydrates an application created using `runSSR`.
hydrate
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect Unit
hydrate a = void (hydrate' a)

--

-- | Creates a static site from a deku application. The top-level element for this site is `body`.
runSSR
  :: forall lock r
   . Domable lock
       (RRef.STRef r (Array Instruction) -> ST r Unit)
  -> ST r String

runSSR = runSSR' "body"

-- | Creates a static site from a deku application. The top-level element for this site is the tag
-- | passed to this function as a first argument.
runSSR'
  :: String
  -> ( forall lock r
        . Domable lock
            (RRef.STRef r (Array Instruction) -> ST r Unit)
       -> ST r String
     )
runSSR' topTag = go
  where
  go
    :: forall lock r
     . Domable lock
         (RRef.STRef r (Array Instruction) -> ST r Unit)
    -> ST r String
  go children' = do
    let
      children =
        ( unsafeCoerce
            :: ( Domable lock
                   (RRef.STRef r (Array Instruction) -> ST r Unit)
               )
            -> ( Domable lock
                   (RRef.STRef Global (Array Instruction) -> ST Global Unit)
               )
        ) children'
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
  :: forall lock payload
   . PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> Domable lock payload
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
  ((coerce :: Domable lock payload -> Domable' lock payload) c)