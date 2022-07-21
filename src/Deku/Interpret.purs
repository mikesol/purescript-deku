module Deku.Interpret
  ( FFIDOMSnapshot(..)
  , EffectfulFFIDOMSnapshot
  , EffectfulDomable
  , fullDOMInterpret
  , SSRElement(..)
  , SSRText(..)
  , StateUnit(..)
  , makeFFIDOMSnapshot
  , ssrDOMInterpret
  , namespaceWithPursxScope
  , toForeign
  ) where

import Prelude

import Bolson.Core (Scope(..))
import Bolson.Core as Bolson.Core
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as RRef
import Control.Monad.State (execState, get, put)
import Data.Array (delete, drop, insertAt, span, uncons)
import Data.Array.ST as STA
import Data.Filterable (filter, filterMap)
import Data.Foldable (for_, traverse_)
import Data.Maybe (Maybe(..), fromMaybe, fromMaybe', isJust, maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.String (trim)
import Data.String as String
import Data.Traversable (traverse)
import Data.Tuple.Nested ((/\))
import Deku.Core (Domable)
import Deku.Core as Core
import Deku.STObject (freezeObj)
import Effect (Effect, foreachE)
import Effect.Class.Console as Log
import Effect.Exception (error, throwException)
import Effect.Ref as Ref
import Foreign (Foreign)
import Foreign.Object (Object)
import Foreign.Object as Object
import Foreign.Object.ST as STO
import Simple.JSON as JSON
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM as Web.DOM
import Web.DOM.ChildNode (remove)
import Web.DOM.Document (createElement, createTextNode)
import Web.DOM.Element (fromNode, getAttribute, setAttribute, tagName, toChildNode, toEventTarget, toNode)
import Web.DOM.Node (appendChild, firstChild, insertBefore, nodeValue, setNodeValue)
import Web.DOM.Node as Web.DOM.Node
import Web.DOM.NodeList (toArray)
import Web.DOM.ParentNode (QuerySelector(..), querySelector, querySelectorAll)
import Web.DOM.Text as Web.DOM.Text
import Web.Event.Event (EventType(..))
import Web.Event.Event as Web.Event.Event
import Web.Event.EventTarget (EventListener, addEventListener, eventListener, removeEventListener)
import Web.Event.Internal.Types as Web
import Web.HTML (window)
import Web.HTML.HTMLDocument (body, toDocument)
import Web.HTML.HTMLElement (toParentNode)
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.HTMLInputElement as HTMLInputElement
import Web.HTML.Window (document)

namespaceWithPursxScope :: String -> String -> String
namespaceWithPursxScope a b = a <> "@" <> b

-- foreign
newtype FFIDOMSnapshot r e t = FFIDOMSnapshot
  { units :: STO.STObject r (StateUnit e t)
  , scopes :: STO.STObject r (STA.STArray r String)
  , hydrating :: RRef.STRef r Boolean
  }

toForeign
  :: EffectfulFFIDOMSnapshot
  -> Effect Foreign
toForeign = toForeignProto (pure <<< JSON.writeImpl <<< tagName) \x -> do
  v <- nodeValue (Web.DOM.Text.toNode x)
  pure $ JSON.writeImpl v

toForeignProto
  :: forall e t
   . (e -> Effect Foreign)
  -> (t -> Effect Foreign)
  -> FFIDOMSnapshot Global e t
  -> Effect Foreign
toForeignProto ee tt (FFIDOMSnapshot state) = do
  units <- liftST $ freezeObj state.units
  o <- units # traverse case _ of
    SElement { parent, scope, main, portalTookMeHere } -> do
      e <- ee main
      pure $ JSON.writeImpl
        { parent
        , scope: f scope
        , main: e
        , portalTookMeHere: map f portalTookMeHere
        , type: "SElement"
        }
    SText { parent, scope, main, portalTookMeHere } -> do
      t <- tt main
      pure $ JSON.writeImpl
        { parent
        , scope: f scope
        , main: t
        , portalTookMeHere: map f portalTookMeHere
        , type: "SText"
        }
    SDyn { parent, scope, children, portalTookMeHere } ->
      pure $ JSON.writeImpl
        { parent
        , scope: f scope
        , children
        , portalTookMeHere: map f portalTookMeHere
        , type: "SDyn"
        }
    SEnvy { parent, scope, child, portalTookMeHere } ->
      pure $ JSON.writeImpl
        { parent
        , scope: f scope
        , child
        , portalTookMeHere: map f portalTookMeHere
        , type: "SEnvy"
        }
    SFixed { parent, scope, children, portalTookMeHere } ->
      pure $ JSON.writeImpl
        { parent
        , scope: f scope
        , children
        , portalTookMeHere: map f portalTookMeHere
        , type: "SFixed"
        }
  pure (JSON.writeImpl o)
  where
  f (Bolson.Core.Local s) = Just s
  f Bolson.Core.Global = Nothing

data StateUnit e t
  = SElement
      { parent :: Maybe String
      -- scope represents a logical branch of the DOM tree
      -- branches may have sub-branches
      -- when an element is removed from the DOM, _all_ of
      -- the elements in its scope can be safely removed too
      -- this is because scopes are _only_ ever attributed when two
      -- conditions are satisfied:
      -- 1. we are at the root, in which case we are deleting the whole thing
      -- 2. we are working with a dynamic element, in which case a scope is
      --    created for the element.
      -- In the case of a dynamic element, the inner-most scope will percolate
      -- downward until there are no more nodes _or_ we hit a new dynamic element.
      , scope :: Scope
      , main :: e
      , listeners :: Object EventListener
      , portalTookMeHere :: Maybe Scope
      }
  | SText
      { parent :: Maybe String
      , scope :: Scope
      , main :: t
      , portalTookMeHere :: Maybe Scope
      }
  | SDyn
      { parent :: Maybe String
      , scope :: Scope
      , children :: Array String
      , portalTookMeHere :: Maybe Scope

      }
  | SEnvy
      { parent :: Maybe String
      , scope :: Scope
      , child :: Maybe String
      , portalTookMeHere :: Maybe Scope

      }
  | SFixed
      { parent :: Maybe String
      , scope :: Scope
      , children :: Array String
      , portalTookMeHere :: Maybe Scope

      }

type EffectfulDomable lock = Domable Web.DOM.Element Effect lock
  (FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text -> Effect Unit)

data SSRElement r
  = SSRElement
      { attributes :: STA.STArray r { key :: String, value :: String }
      , tag :: String
      }
  | SSRPursxElement
      { html :: String
      }

newtype SSRText = SSRText { text :: String }

derive instance Newtype SSRText _

makeFFIDOMSnapshot :: forall e t. Effect (FFIDOMSnapshot Global e t)
makeFFIDOMSnapshot = do
  units <- liftST $ STO.new
  scopes <- liftST $ STO.new
  hydrating <- liftST $ RRef.new false
  pure $ FFIDOMSnapshot { units, scopes, hydrating }

scopeToString :: Scope -> String
scopeToString (Local s) = s
scopeToString Global = "rootScope"

addElementScopeToScopes_
  :: forall r e t c
   . { id :: String, scope :: Scope | c }
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
addElementScopeToScopes_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let scope = scopeToString a.scope
  liftST $ STO.peek scope state.scopes >>= case _ of
    Just arr -> void (STA.push ptr arr)
    Nothing -> do
      arr <- STA.new
      void $ STA.push ptr arr
      void (STO.poke scope arr state.scopes)

removeActualChild_
  :: forall r
   . { id :: String | r }
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
removeActualChild_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  ut <- liftST $ STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SElement e -> remove $ toChildNode e.main
      SText e -> remove $ Web.DOM.Text.toChildNode e.main
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

setPropContinuation_
  :: Core.SetProp
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setPropContinuation_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let avv = a.value
  ut <- liftST $ STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SElement e -> do
        let tn = tagName e.main
        if (tn == "INPUT" || tn == "input") && a.key == "value" then do
          for_ (HTMLInputElement.fromElement e.main)
            (HTMLInputElement.setValue avv)
        else if (tn == "INPUT" || tn == "input") && a.key == "checked" then do
          for_ (HTMLInputElement.fromElement e.main)
            (HTMLInputElement.setChecked (avv == "true"))
        else do
          setAttribute a.key avv e.main
      SText _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

hydrateElement_
  :: Core.MakeElement
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
hydrateElement_ a state'@(FFIDOMSnapshot state) = do
  addElementScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    qs <- querySelector (QuerySelector ("[data-deku-ssr-" <> a.id <> "]"))
      (toParentNode b')
    case qs of
      Just qs' ->
        do
          -- Log.info ("Found elt " <> show a)
          void $ liftST $ STO.poke a.id
            ( SElement
                { listeners: Object.empty
                , parent: a.parent
                , scope: a.scope
                , main: qs'
                , portalTookMeHere: Nothing
                }
            )
            state.units
      Nothing -> do
        -- Log.error ("Could not find elt" <> show a)
        e <- createElement a.tag (toDocument d)
        void $ liftST $ STO.poke a.id
          ( SElement
              { listeners: Object.empty
              , parent: a.parent
              , scope: a.scope
              , main: e
              , portalTookMeHere: Nothing
              }
          )
          state.units

setProp_
  :: Core.SetProp
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setProp_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then setPropAndRetrieveElementDuringHydration_
    else setPropContinuation_
  ) a state'

ssrSetProp_
  :: Core.SetProp
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrSetProp_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let avv = a.value
  ut <- liftST $ STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SElement e -> case e.main of
        SSRElement x -> void $ liftST $ STA.push { key: a.key, value: avv }
          x.attributes
        SSRPursxElement _ -> pure unit
      SText _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

retrieveElementDuringHydration_
  :: forall r. { id :: String, parent :: Maybe String, scope :: Scope | r }
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
retrieveElementDuringHydration_ = retrieveElementDuringHydration_' \a ->
  "[data-deku-ssr-" <> a.id <> "]"

retrieveElementDuringHydration_'
  :: forall r
   . ({ id :: String, parent :: Maybe String, scope :: Scope | r } -> String)
  -> { id :: String, parent :: Maybe String, scope :: Scope | r }
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
retrieveElementDuringHydration_' mkSelector a state'@(FFIDOMSnapshot state) = do
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    qs <- querySelector (QuerySelector (mkSelector a))
      (toParentNode b')
    qs # maybe
      ( when false $ Log.error
          ( "Could not find pursx " <> show
              { id: a.id, parent: a.parent, scope: a.scope }
          )
      )
      \qs' -> do
        -- Log.info   ( "Found pursx " <> show { id: a.id, parent: a.parent, scope: a.scope })
        addElementScopeToScopes_ a state'
        void $ liftST $ STO.poke a.id
          ( SElement
              { listeners: Object.empty
              , parent: a.parent
              , scope: a.scope
              , main: qs'
              , portalTookMeHere: Nothing
              }
          )
          state.units

setPropAndRetrieveElementDuringHydration_
  :: Core.SetProp
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setPropAndRetrieveElementDuringHydration_ a state' = do
  retrieveElementDuringHydration_ a state'
  -- continue to set the property on the element
  setPropContinuation_ a state'

setCbAndRetrieveElementDuringHydration_
  :: Core.SetCb
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setCbAndRetrieveElementDuringHydration_ a state' = do
  retrieveElementDuringHydration_ a state'
  -- continue to set the cb on the element
  setCbContinuation_ a state'

createElement_
  :: Core.MakeElement
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
createElement_ a state'@(FFIDOMSnapshot state) = do
  addElementScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  e <- createElement a.tag (toDocument d)
  void $ liftST $ STO.poke a.id
    ( SElement
        { listeners: Object.empty
        , parent: a.parent
        , scope: a.scope
        , main: e
        , portalTookMeHere: Nothing
        }
    )
    state.units

makeElement_
  :: Core.MakeElement
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
makeElement_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  (if hydrating then hydrateElement_ else createElement_) a state'

ssrMakeElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrMakeElement_ a state'@(FFIDOMSnapshot state) = do
  addElementScopeToScopes_ a state'
  attributes <- liftST $ STA.new
  void $ liftST $ STO.poke
    a.id
    ( SElement
        { listeners: Object.empty
        , scope: a.scope
        , parent: a.parent
        , main: SSRElement { attributes, tag: a.tag }
        , portalTookMeHere: Nothing
        }
    )
    state.units

makeDynCommon
  :: forall e t
   . Core.MakeDyn
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
makeDynCommon a state'@(FFIDOMSnapshot state) = do
  addElementScopeToScopes_ a state'
  liftST $ void $ STO.poke
    a.id
    ( SDyn
        { scope: a.scope
        , parent: a.parent
        , children: []
        , portalTookMeHere: Nothing
        }
    )
    state.units

ssrMakeDyn_
  :: Core.MakeDyn
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrMakeDyn_ = makeDynCommon

makeDyn_
  :: Core.MakeDyn
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
makeDyn_ = makeDynCommon

addTextScopeToScopes_
  :: forall r x e t
   . { id :: String
     , scope :: Scope
     | x
     }
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
addTextScopeToScopes_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let scope = scopeToString a.scope
  liftST $ STO.peek scope state.scopes >>= case _ of
    Just arr -> void (STA.push ptr arr)
    Nothing -> do
      arr <- STA.new
      void $ STA.push ptr arr
      void (STO.poke scope arr state.scopes)

foreign import getTextNode_
  :: Web.DOM.Element -> String -> Effect (Web.DOM.Text)

hydrateText_
  :: Core.MakeText
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
hydrateText_ a state'@(FFIDOMSnapshot state) = do
  addTextScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    -- we cannot run getParent on the id because it is not added to the cache yet
    -- so we start from the parent
    for_ a.parent \parId' -> do
      parrrr <- getParent true parId' a.id state'
      qs <- querySelector
        (QuerySelector ("[data-deku-ssr-" <> parrrr.parentId <> "]"))
        (toParentNode b')
      case qs of
        Just qs' -> do
          -- Log.info $ "Found parent " <> parrrr.parentId
          tnode <- getTextNode_ qs' a.id
          -- Log.info ("Found text " <> show a)
          liftST $ STO.poke a.id
            ( SText
                { scope: a.scope
                , parent: a.parent
                , main: tnode
                , portalTookMeHere: Nothing
                }
            )
            state.units
        Nothing -> do
          -- Log.error ("Could not find text " <> show a)
          e <- createTextNode "" (toDocument d)
          liftST $ STO.poke a.id
            ( SText
                { scope: a.scope
                , parent: a.parent
                , main: e
                , portalTookMeHere: Nothing
                }
            )
            state.units

createText_
  :: Core.MakeText
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
createText_ a state'@(FFIDOMSnapshot state) = do
  addTextScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  e <- createTextNode "" (toDocument d)
  void $ liftST $ STO.poke a.id
    ( SText
        { scope: a.scope
        , parent: a.parent
        , main: e
        , portalTookMeHere: Nothing
        }
    )
    state.units

makeText_
  :: Core.MakeText
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
makeText_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  (if hydrating then hydrateText_ else createText_) a state'

ssrMakeText_
  :: Core.MakeText
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrMakeText_ a state'@(FFIDOMSnapshot state) = do
  addTextScopeToScopes_ a state'
  void $ liftST $ STO.poke
    a.id
    ( SText
        { scope: a.scope
        , parent: a.parent
        , main: SSRText { text: "" }
        , portalTookMeHere: Nothing
        }
    )
    state.units

addChildCommon
  :: forall e t
   . Core.AddChild
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
addChildCommon a (FFIDOMSnapshot state) = do
  elt <- liftST $ STO.peek a.parent state.units
  for_ elt \elt' ->
    case elt' of
      SDyn t -> liftST $ void $ STO.poke a.parent
        ( SDyn
            ( t
                { children =
                    t.children <> [ a.child ]
                }
            )
        )
        state.units
      SEnvy t -> liftST $ void $ STO.poke a.parent
        ( SEnvy
            ( t
                { child = Just a.child
                }
            )
        )
        state.units
      SFixed t -> liftST $ void $ STO.poke a.parent
        ( SFixed
            ( t
                { children =
                    t.children <> [ a.child ]
                }
            )
        )
        state.units
      -- in Bolson, add child is only used as a side effect of dyn
      -- and isn't intended to actually touch the DOM
      SElement _ -> pure unit -- programming error :-(
      SText _ -> pure unit -- programming error :-(

ssrAddChild_
  :: Core.AddChild
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrAddChild_ = addChildCommon

addChild_
  :: Core.AddChild
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
addChild_ = addChildCommon

removeChildCommon
  :: forall e t
   . ( Core.RemoveChild
       -> FFIDOMSnapshot Global e t
       -> Effect Unit
     )
  -> Core.RemoveChild
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
removeChildCommon impl a state'@(FFIDOMSnapshot state) = do
  elt <- liftST $ STO.peek a.id state.units
  for_ elt \elt' -> do
    let
      currentPortal = case elt' of
        SElement e -> e.portalTookMeHere
        SText e -> e.portalTookMeHere
        SDyn e -> e.portalTookMeHere
        SEnvy e -> e.portalTookMeHere
        SFixed e -> e.portalTookMeHere
    unless (isJust currentPortal && Just a.scope /= currentPortal) do
      let
        nnd' = case elt' of
          SElement e -> SElement (e { parent = Nothing })
          SText e -> SText (e { parent = Nothing })
          SDyn e -> SDyn (e { parent = Nothing })
          SEnvy e -> SEnvy (e { parent = Nothing })
          SFixed e -> SFixed (e { parent = Nothing })
      liftST $ void $ STO.poke a.id nnd' state.units
      let
        p = case elt' of
          SDyn { parent } -> parent
          SEnvy { parent } -> parent
          SFixed { parent } -> parent
          SElement { parent } -> parent
          SText { parent } -> parent
      case elt' of
        SDyn { children } -> for_ children \id -> removeChildCommon impl
          { id, scope: a.scope }
          state'
        SEnvy { child } -> for_ child \id -> removeChildCommon impl
          { id, scope: a.scope }
          state'
        SFixed { children } -> for_ children \id -> removeChildCommon impl
          { id, scope: a.scope }
          state'
        SElement _ -> impl a state'
        SText _ -> impl a state'
      for_ p \parent' -> do
        parElt <- liftST $ STO.peek parent' state.units
        for_ parElt \parElt' -> do
          case parElt' of
            SDyn t -> liftST $ void $ STO.poke parent'
              ( SDyn
                  ( t
                      { children = filter (not <<< (_ == a.id)) t.children
                      }
                  )
              )
              state.units
            SEnvy t -> liftST $ void $ STO.poke parent'
              ( SEnvy
                  ( t
                      { child = Nothing
                      }
                  )
              )
              state.units
            SFixed t -> liftST $ void $ STO.poke parent'
              ( SFixed
                  ( t
                      { children = filter (not <<< (_ == a.id)) t.children
                      }
                  )
              )
              state.units
            SElement _ -> pure unit
            SText _ -> pure unit

ssrRemoveChild_
  :: Core.RemoveChild
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrRemoveChild_ = removeChildCommon \_ _ -> pure unit

removeChild_
  :: Core.RemoveChild
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
removeChild_ a state = do
  --Log.info ("removeChild_: " <> show a)
  removeChildCommon removeActualChild_ a state

attributeParent_
  :: Core.AttributeParent
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
attributeParent_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then (\x y -> void $ sendToPosNominal x y)
    else sendToPos_
  )
    -- logShow a
    -- -1 to avoid overflow errors
    { id: a.id, pos: top - 1 }
    state'

hydratingAttributeParent_
  :: Core.AttributeParent
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
hydratingAttributeParent_ a state = do
  -- logShow a
  -- -1 to avoid overflow errors
  void $ sendToPosNominal { id: a.id, pos: top - 1 } state

ssrAttributeParent_
  :: Core.AttributeParent
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrAttributeParent_ a state = do
  -- -1 to avoid overflow errors
  ssrSendToPos_ { id: a.id, pos: top - 1 } state

foreign import setInnerHTML_ :: String -> Web.DOM.Element -> Effect Unit

setCb_
  :: Core.SetCb
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setCb_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then setCbAndRetrieveElementDuringHydration_
    else setCbContinuation_
  ) a state'

pursXConnectionStep_
  :: Web.DOM.Element
  -> Core.MakePursx
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
pursXConnectionStep_ tmp a state'@(FFIDOMSnapshot state) = do
  let scope = a.scope
  let
    attributeF e = do
      key' <- getAttribute "data-deku-attr-internal" e
      for_ key' \namespacedKey -> do
        void $ liftST $ STO.poke namespacedKey
          ( SElement
              { listeners: Object.empty
              , main: e
              , scope: scope
              , parent: a.parent
              , portalTookMeHere: Nothing
              }
          )
          state.units
        addElementScopeToScopes_ { id: namespacedKey, scope } state'
  let
    elementF e = do
      -- this node needs to be here because otherwise, when
      -- a pursx element is looking for its parent, it won't find it
      key' <- getAttribute "data-deku-elt-internal" e
      --Log.info (show key')
      for_ key' \namespacedKey -> do
        void $ liftST $ STO.poke namespacedKey
          ( SElement
              { listeners: Object.empty
              , main: e
              , scope: scope
              , parent: a.parent
              , portalTookMeHere: Nothing
              }
          )
          state.units
        addElementScopeToScopes_ { id: namespacedKey, scope } state'
  --Log.info (show a.id)
  for_ (toParentNode <$> (HTMLElement.fromElement tmp)) \tmp' -> do
    querySelectorAll (QuerySelector "[data-deku-attr-internal]") tmp'
      >>= toArray
      >>= traverse_ (flip foreachE attributeF) <<< traverse fromNode
    querySelectorAll (QuerySelector "[data-deku-elt-internal]") tmp' >>= toArray
      >>= traverse_ (flip foreachE elementF) <<< traverse fromNode

pursXCreationStepDOM
  :: Core.MakePursx
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
pursXCreationStepDOM = pursXCreationStep \t -> do
  w <- window
  d <- document w
  tmp <- createElement "div" (toDocument d)
  setInnerHTML_ t tmp
  fc <- firstChild (toNode tmp)
  fc' <- maybe (throwException (error "PursX: No first child")) pure fc
  fc'' <- maybe (throwException (error "PursX: Not node")) pure (fromNode fc')
  pure fc''

makePursx_
  :: Core.MakePursx
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
makePursx_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then pursXHydrationStep
    else pursXCreationStepDOM
  ) a state'
  eeeelt <- liftST $ STO.peek a.id state.units
  -- should always be there..
  for_ eeeelt \e' -> case e' of
    SElement ee -> pursXConnectionStep_ ee.main a state'
    SText _ -> pure unit -- programming error :-(
    SDyn _ -> pure unit -- programming error :-(
    SEnvy _ -> pure unit -- programming error :-(
    SFixed _ -> pure unit -- programming error :-(

ssrMakePursx_
  :: Core.MakePursx
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrMakePursx_ = pursXCreationStep \t ->
  pure $ SSRPursxElement { html: t }

pursXCreationStep
  :: forall e t
   . (String -> Effect e)
  -> Core.MakePursx
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
pursXCreationStep createElementStep a state'@(FFIDOMSnapshot state) = do
  let ptr = a.id
  let html = a.html
  let verb = a.verb
  let cache = a.cache
  let scope = a.scope
  let unfolded = (Object.toUnfoldable :: _ -> Array _) cache
  let
    html' = html # execState
      ( unfolded # traverse \(key /\ val) -> do
          h <- get
          if val then do
            -- it is an attribute
            put $ String.replace (String.Pattern (verb <> key <> verb))
              ( String.Replacement
                  ( "data-deku-attr-internal=" <> "\""
                      <> namespaceWithPursxScope key a.pxScope
                      <> "\""
                  )
              )
              h
          else do
            put $ String.replace
              ( String.Pattern
                  (verb <> key <> verb)
              )
              ( String.Replacement
                  ( "<span style=\"display:contents;\" data-deku-elt-internal="
                      <> "\""
                      <> namespaceWithPursxScope key a.pxScope
                      <>
                        "\"></span>"
                  )
              )
              h
      )
  e <- createElementStep (trim html')
  addElementScopeToScopes_ a state'
  liftST $ void $ STO.poke ptr
    ( SElement
        { listeners: Object.empty
        , parent: a.parent
        , scope: scope
        , main: e
        , portalTookMeHere: Nothing
        }
    )
    state.units

pursXHydrationStep
  :: Core.MakePursx
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
pursXHydrationStep a state = do
  retrieveElementDuringHydration_ a state
  let cache = a.cache
  -- we also retrieve all of the embedded elements
  let unfolded = (Object.toUnfoldable :: _ -> Array _) cache
  for_ (filterMap (\(k /\ v) -> if v then Nothing else Just k) unfolded) \k ->
    let
      namespaced = namespaceWithPursxScope k a.pxScope
    in
      retrieveElementDuringHydration_'
        ( \_ ->
            ( "[data-deku-elt-internal=" <> "\""
                <> namespaced
                <> "\"]"
            )
        )
        { id: namespaced, parent: a.parent, scope: a.scope }
        state

protoMakeRoot
  :: forall r m e t c
   . { id :: String, root :: e | c }
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
protoMakeRoot { id, root } state'@(FFIDOMSnapshot state) = do
  addElementScopeToScopes_ { id, scope: Bolson.Core.Global } state'
  liftST $ void
    ( STO.poke id
        ( SElement
            { main: root
            , parent: Nothing
            , scope: Bolson.Core.Global
            , listeners: Object.empty
            , portalTookMeHere: Nothing
            }
        )
        state.units
    )

makeRoot_
  :: Core.MakeRoot Web.DOM.Element
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
makeRoot_ = protoMakeRoot

ssrMakeRoot_
  :: Core.MakeRoot (SSRElement Global)
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrMakeRoot_ = protoMakeRoot

setText_
  :: Core.SetText
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setText_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  ut <- liftST $ STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SText e -> do
        setNodeValue a.text (Web.DOM.Text.toNode e.main)
      SElement _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

ssrSetText_
  :: Core.SetText
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrSetText_ a (FFIDOMSnapshot state) = do
  elt <- liftST $ STO.peek a.id state.units
  for_ elt \elt' ->
    case elt' of
      SText t -> void $ liftST $ STO.poke a.id
        ( SText
            ( t
                { main =
                    let tm = unwrap t.main in SSRText (tm { text = a.text })
                }
            )
        )
        state.units
      SElement _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

-- foreign import setProp_
--   :: forall r. Boolean -> Core.SetProp -> FFIDOMSnapshot r -> Effect Unit

setCbContinuation_
  :: Core.SetCb
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
setCbContinuation_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let avv = a.value
  ut <- liftST $ STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SElement e -> do
        if a.key == "@self@" then do
          void $ (unwrap avv)
            ((unsafeCoerce :: Web.DOM.Element -> Web.Event.Event.Event) e.main)
        else do
          let l = Object.lookup a.key e.listeners
          for_ l \oldEl -> do
            removeEventListener (EventType a.key) oldEl true (toEventTarget e.main)
          newEl <- eventListener (unwrap avv)
          addEventListener (EventType a.key) newEl true (toEventTarget e.main)
          void $ liftST $ STO.poke a.id
            ( SElement
                (e { listeners = Object.insert a.key newEl e.listeners })
            )
            state.units
      SText _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

giveNewParent_
  :: Core.GiveNewParent
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
giveNewParent_ a state' = do
  --Log.info $ "giveNewParent_: " <> show a.id
  protoGiveNewParent a state'
  -- todo: are give new parent and attribute parent the same??
  attributeParent_ { id: a.id, parent: a.parent } state'

protoGiveNewParent
  :: forall m r e t
   . Core.GiveNewParent
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
protoGiveNewParent a state'@(FFIDOMSnapshot state) = do
  removeChildCommon (\_ _ -> pure unit) { id: a.id, scope: a.scope } state'
  let ptr = a.id
  let parent = a.parent
  nd <- liftST $ STO.peek ptr state.units
  for_ nd \nd' -> do
    -- set parent
    let
      nnd' = case nd' of
        SElement aa -> SElement
          (aa { parent = Just parent, portalTookMeHere = Just a.scope })
        SText aa -> SText
          (aa { parent = Just parent, portalTookMeHere = Just a.scope })
        SDyn aa -> SDyn
          (aa { parent = Just parent, portalTookMeHere = Just a.scope })
        SEnvy aa -> SEnvy
          (aa { parent = Just parent, portalTookMeHere = Just a.scope })
        SFixed aa -> SFixed
          (aa { parent = Just parent, portalTookMeHere = Just a.scope })
    liftST $ void $ STO.poke ptr nnd' state.units

ssrGiveNewParent_
  :: Core.GiveNewParent
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrGiveNewParent_ = protoGiveNewParent

deleteFromCache_
  :: Core.DeleteFromCache
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
deleteFromCache_ a state' = do
  --Log.info ("deleteFromCache_: " <> show a.id)
  -- should be removed already!
  --  removeChild_ { id: a.id, scope: a.scope } state'
  protoDeleteFromCache a state'

protoDeleteFromCache
  :: forall e t
   . Core.DeleteFromCache
  -> FFIDOMSnapshot Global e t
  -> Effect Unit
protoDeleteFromCache a (FFIDOMSnapshot state) = do
  liftST $ void $ STO.delete a.id state.units

ssrDeleteFromCache_
  :: Core.DeleteFromCache
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrDeleteFromCache_ = protoDeleteFromCache

sendToPosNominal
  :: forall e t
   . Core.SendToPos
  -> FFIDOMSnapshot Global e t
  -> Effect (Array String)
sendToPosNominal a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let pos = a.pos
  ut <- liftST $ STO.peek ptr state.units
  ut # maybe (pure []) \ut' -> do
    let
      parent = case ut' of
        SElement e -> e.parent
        SText e -> e.parent
        SDyn e -> e.parent
        SEnvy e -> e.parent
        SFixed e -> e.parent
    parent # maybe (pure []) \parent' -> do
      parElt <- liftST $ STO.peek parent' state.units
      parElt # maybe (pure []) \parElt' -> do
        case parElt' of
          SDyn e ->
            let
              newKids = delete ptr e.children
              newerKids = fromMaybe' (\_ -> newKids <> [ ptr ])
                (insertAt pos ptr newKids)
            -- _____ = spy "dropping" pos
            in
              liftST $
                ( STO.poke parent'
                    ( SDyn
                        ( e
                            { children = newerKids
                            }
                        )
                    )
                    state.units $> (drop (pos + 1) newerKids)
                )
          SText _ -> pure [] -- programming error :-(
          SElement _ -> pure [] -- programming error :-(
          SEnvy _ -> pure [] -- programming error :-(
          SFixed _ -> pure [] -- programming error :-(

ssrSendToPos_
  :: Core.SendToPos
  -> FFIDOMSnapshot Global (SSRElement Global) SSRText
  -> Effect Unit
ssrSendToPos_ a state = void $ sendToPosNominal a state

type EffectfulFFIDOMSnapshot = FFIDOMSnapshot Global Web.DOM.Element
  Web.DOM.Text

stepUpAndOver
  :: String
  -> EffectfulFFIDOMSnapshot
  -> Effect (Maybe { newStep :: String, newArray :: Array String })
stepUpAndOver needle state'@(FFIDOMSnapshot state) = do
  elt <- liftST $ STO.peek needle state.units
  elt # maybe (pure Nothing) \elt' -> do
    let
      par' = case elt' of
        SDyn { parent } -> parent
        SEnvy { parent } -> parent
        SFixed { parent } -> parent
        SElement { parent } -> parent
        SText { parent } -> parent
    par' # maybe (pure Nothing) \par -> do
      parElt <- liftST $ STO.peek par state.units
      parElt # maybe (pure Nothing) \parElt' -> do
        let
          parentParent' = case parElt' of
            SDyn { parent } -> parent
            SEnvy { parent } -> parent
            SFixed { parent } -> parent
            SElement { parent } -> parent
            SText { parent } -> parent
        parentParent' # maybe (pure Nothing) \parentParent -> do
          parParElt <- liftST $ STO.peek parentParent state.units
          parParElt # maybe (pure Nothing) case _ of
            -- we get the id of the parent and to the right
            SDyn { children } -> pure $ Just
              { newStep: par, newArray: drop 1 (span (par /= _) children).rest }
            -- we get the id of the parent and to the right
            SFixed { children } -> pure $ Just
              { newStep: par, newArray: drop 1 (span (par /= _) children).rest }
            -- keep climbing
            SEnvy _ -> stepUpAndOver parentParent state'
            -- no dice, nothing to the right
            SElement _ -> pure Nothing
            -- no dice, nothing to the right
            SText _ -> pure Nothing

getParent
  :: Boolean
  -> String
  -> String
  -> EffectfulFFIDOMSnapshot
  -> Effect
       { parentId :: String
       , parentNode :: Web.DOM.Element
       }
getParent isParent (ptr :: String) starts state'@(FFIDOMSnapshot state) = do
  let
    hittingTheFan = throwException
      ( error
          ( "Cannot resolve parent of " <> ptr
              <> " for dyn traversal starting at "
              <> starts
          )
      )
  ut <- liftST $ STO.peek ptr state.units
  -- Log.info ("getParent running : " <> show ptr <> " starts at " <> starts)
  case ut of
    Just ut' -> do
      case ut' of
        SElement e ->
          if isParent then pure { parentNode: e.main, parentId: ptr }
          else maybe hittingTheFan (\x -> getParent true x starts state')
            e.parent
        SText e -> maybe hittingTheFan (\x -> getParent true x starts state')
          e.parent
        SDyn e -> maybe hittingTheFan (\x -> getParent true x starts state')
          e.parent
        SEnvy e -> maybe hittingTheFan (\x -> getParent true x starts state')
          e.parent
        SFixed e -> maybe hittingTheFan (\x -> getParent true x starts state')
          e.parent
    Nothing -> hittingTheFan

getParentAndToMyRight
  :: Array String
  -> Core.SendToPos
  -> EffectfulFFIDOMSnapshot
  -> Effect { parentNode :: Web.DOM.Node, toMyRight :: Maybe Web.DOM.Node.Node }
getParentAndToMyRight initialSearch a state'@(FFIDOMSnapshot state) = do
  { parentNode, parentId } <- getParent false a.id a.id state'
  -- let ___ = spy "pnpi" { parentNode, parentId }
  -- let ____ = spy "initialSearch" initialSearch
  toMyRight <- getAbuttingRight parentId a.id initialSearch
  -- let ___ = spy "toMyRight" toMyRight
  pure { parentNode: toNode parentNode, toMyRight }
  where
  drillDownSingleId
    :: String -> Effect (Maybe Web.DOM.Node.Node)
  drillDownSingleId id = do
    ut <- liftST $ STO.peek id state.units
    case ut of
      Just ut' -> do
        case ut' of
          SElement e -> pure $ Just $ toNode e.main
          SText e -> pure $ Just $ Web.DOM.Text.toNode e.main
          SDyn e -> scanToRight e.children
          SEnvy e -> scanToRight (maybe [] pure e.child)
          SFixed e -> scanToRight e.children
      Nothing -> pure Nothing

  -- scan to right traverses the right of a dyn starting from 1+ the position, as
  -- the nominal shift has already happened, meaning the children list has been shifted
  -- we keep moving to the right until we find an element to be the right-bound
  -- we start by descending the logical right downward and, on failure, move rightward
  scanToRight :: Array String -> Effect (Maybe Web.DOM.Node.Node)
  scanToRight ids
    | Just { head, tail } <- uncons ids = drillDownSingleId head >>=
        case _ of
          Just e -> pure (Just e)
          Nothing -> scanToRight tail
    | otherwise = pure Nothing

  getAbuttingRight
    :: String -> String -> Array String -> Effect (Maybe Web.DOM.Node.Node)
  getAbuttingRight parentId stepId rightward =
    if parentId == stepId then pure Nothing
    else do
      maybeRight <- scanToRight rightward
      case maybeRight of
        Just r -> pure (Just r)
        Nothing -> do
          nsna <- stepUpAndOver stepId state'
          case nsna of
            Just { newStep, newArray } -> getAbuttingRight parentId newStep
              newArray
            Nothing -> pure Nothing

getImmediateChildEltsInOrder
  :: String
  -> EffectfulFFIDOMSnapshot
  -> Effect (Array Web.DOM.Node)
getImmediateChildEltsInOrder id state'@(FFIDOMSnapshot state) = do
  ut <- liftST $ STO.peek id state.units
  ut # maybe (pure []) \ut' -> do
    case ut' of
      SElement e -> pure [ toNode e.main ]
      SText e -> pure [ Web.DOM.Text.toNode e.main ]
      SDyn { children } -> map join
        (children # traverse (flip getImmediateChildEltsInOrder state'))
      SEnvy { child } -> map (fromMaybe [])
        (child # traverse (flip getImmediateChildEltsInOrder state'))
      SFixed { children } -> map join
        (children # traverse (flip getImmediateChildEltsInOrder state'))

sendToPos_
  :: Core.SendToPos
  -> EffectfulFFIDOMSnapshot
  -> Effect Unit
sendToPos_ a state' = do
  -- Log.info "starting send to pos"
  initialSearch <- sendToPosNominal a state'
  { parentNode, toMyRight } <- getParentAndToMyRight initialSearch a state'
  eltsInOrder <- getImmediateChildEltsInOrder a.id state'
  -- let _____ = spy "parentNode tmr" {parentNode, toMyRight, id: a.id, eltsInOrder}
  foreachE eltsInOrder \e -> case toMyRight of
    Just tmr -> insertBefore e tmr parentNode
    Nothing -> appendChild e parentNode

fullDOMInterpret
  :: Ref.Ref Int
  -> Core.DOMInterpret Web.DOM.Element Effect
       (EffectfulFFIDOMSnapshot -> Effect Unit)
fullDOMInterpret seed = Core.DOMInterpret
  { ids: do
      s <- Ref.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ Ref.modify (add 1) seed
      pure o
  , makeElement: makeElement_
  , attributeParent: attributeParent_
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , setProp: setProp_
  , setCb: setCb_
  , setText: setText_
  , sendToPos: sendToPos_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , removeChild: removeChild_
  , makeDyn: makeDyn_
  , addChild: addChild_
  }

ssrDOMInterpret
  :: RRef.STRef Global Int
  -> Core.DOMInterpret (SSRElement Global) Effect
       (FFIDOMSnapshot Global (SSRElement Global) SSRText -> Effect Unit)
ssrDOMInterpret seed = Core.DOMInterpret
  { ids: liftST do
      s <- RRef.read seed
      let
        o = show
          (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
      void $ RRef.modify (add 1) seed
      pure o
  , makeElement: ssrMakeElement_
  , attributeParent: ssrAttributeParent_
  , makeRoot: ssrMakeRoot_
  , makeText: ssrMakeText_
  , makePursx: ssrMakePursx_
  , setProp: ssrSetProp_
  , setCb: \_ _ -> pure unit -- no callbacks in html :-)
  , setText: ssrSetText_
  , sendToPos: ssrSendToPos_
  , deleteFromCache: ssrDeleteFromCache_
  , giveNewParent: ssrGiveNewParent_
  , removeChild: ssrRemoveChild_
  , makeDyn: ssrMakeDyn_
  , addChild: ssrAddChild_
  }
