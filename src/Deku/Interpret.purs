module Deku.Interpret
  ( FFIDOMSnapshot
  -- , fullDOMInterpret
  -- , makeFFIDOMSnapshot
  -- , ssrDOMInterpret
  -- , hydratingDOMInterpret
  -- , Instruction(..)
  -- , setHydrating
  -- , unSetHydrating
  ) where

import Prelude

import Bolson.Core (Scope(..))
import Bolson.Core as Bolson.Core
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST, liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Global as ST
import Control.Monad.ST.Internal as RRef
import Control.Monad.State (execState, get, put)
import Data.Array (find)
import Data.Array.ST as STA
import Data.Either (Either(..))
import Data.Filterable (filter)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..), isNothing, maybe)
import Data.Newtype (class Newtype, unwrap)
import Data.String (trim)
import Data.String as String
import Data.Traversable (traverse)
import Data.Tuple.Nested ((/\))
import Deku.Core as Core
import Effect (Effect, foreachE)
import Effect.Exception (error, throwException)
import Foreign.Object (Object)
import Foreign.Object as Object
import Foreign.Object.ST as STO
import Test.QuickCheck (arbitrary, mkSeed)
import Test.QuickCheck.Gen (Gen, evalGen)
import Web.DOM as Web.DOM
import Web.DOM.Document (createElement, createTextNode)
import Web.DOM.Element (fromNode, toNode)
import Web.DOM.Node (appendChild, childNodes, firstChild, nodeTypeIndex, nodeValue)
import Web.DOM.NodeList (toArray)
import Web.DOM.ParentNode (QuerySelector(..), querySelector)
import Web.DOM.Text as Web.DOM.Text
import Web.Event.Internal.Types as Web
import Web.HTML (window)
import Web.HTML.HTMLDocument (body, fromDocument, toDocument)
import Web.HTML.HTMLElement (toParentNode)
import Web.HTML.Window (document)

-- foreign
newtype FFIDOMSnapshot r e t = FFIDOMSnapshot
  { units :: STO.STObject r (StateUnit e t)
  , scopes :: STO.STObject r (STA.STArray r String)
  , hydrating :: RRef.STRef r Boolean
  }

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
      , listeners :: Object (Web.Event -> Effect Unit)
      }
  | SText
      { parent :: Maybe String
      , scope :: Scope
      , main :: t
      }
  | SDyn
      { parent :: Maybe String
      , scope :: Scope
      , children :: Array String
      }
  | SEnvy
      { parent :: Maybe String
      , scope :: Scope
      , child :: Maybe String
      }
  | SFixed
      { parent :: Maybe String
      , scope :: Scope
      , children :: Array String
      }

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

makeFFIDOMSnapshot :: forall r e t. ST r (FFIDOMSnapshot r e t)
makeFFIDOMSnapshot = do
  units <- STO.new
  scopes <- STO.new
  hydrating <- RRef.new false
  pure $ FFIDOMSnapshot { units, scopes, hydrating }

scopeToString :: Scope -> String
scopeToString (Local s) = s
scopeToString Global = "rootScope"

addElementScopeToScopes_
  :: forall r x e t c
   . { id :: String, scope :: Scope | c }
  -> FFIDOMSnapshot r e t
  -> ST r Unit
addElementScopeToScopes_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let scope = scopeToString a.scope
  STO.peek scope state.scopes >>= case _ of
    Just arr -> void (STA.push ptr arr)
    Nothing -> do
      arr <- STA.new
      void $ STA.push ptr arr
      void (STO.poke scope arr state.scopes)

hydrateElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
hydrateElement_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addElementScopeToScopes_ a state'
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
      Just qs' -> liftST $ STO.poke a.id
        ( SElement
            { listeners: Object.empty
            , parent: a.parent
            , scope: a.scope
            , main: qs'
            }
        )
        state.units
      Nothing -> do
        e <- createElement a.tag (toDocument d)
        liftST $ STO.poke a.id
          ( SElement
              { listeners: Object.empty
              , parent: a.parent
              , scope: a.scope
              , main: e
              }
          )
          state.units

setProp_
  :: Core.SetProp
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
setProp_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then setPropAndRetrieveElementDuringHydration_
    else setPropContinuation_
  ) a state'

ssrSetProp_
  :: forall r
   . Core.SetProp
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrSetProp_ a state'@(FFIDOMSnapshot state) = do
  let ptr = a.id
  let avv = a.value
  ut <- STO.peek ptr state.units
  for_ ut \ut' -> do
    case ut' of
      SElement e -> case e.main of
        SSRElement x -> void $ STA.push { key: a.key, value: avv } x.attributes
        SSRPursxElement _ -> pure unit
      SText _ -> pure unit -- programming error :-(
      SDyn _ -> pure unit -- programming error :-(
      SEnvy _ -> pure unit -- programming error :-(
      SFixed _ -> pure unit -- programming error :-(

foreign import setPropContinuation_
  :: Core.SetProp
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit

retrieveElementDuringHydration_
  :: forall r
   . { id :: String, parent :: Maybe String, scope :: Scope | r }
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
retrieveElementDuringHydration_ a state'@(FFIDOMSnapshot state) = do
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    qs <- querySelector (QuerySelector ("[data-deku-ssr-" <> a.id <> "]"))
      (toParentNode b')
    for_ qs \qs' -> do
      liftST $ addElementScopeToScopes_ a state'
      liftST $ STO.poke a.id
        ( SElement
            { listeners: Object.empty
            , parent: a.parent
            , scope: a.scope
            , main: qs'
            }
        )
        state.units

setPropAndRetrieveElementDuringHydration_
  :: Core.SetProp
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
setPropAndRetrieveElementDuringHydration_ a state'@(FFIDOMSnapshot state) = do
  retrieveElementDuringHydration_ a state'
  -- continue to set the property on the element
  setPropContinuation_ a state'

setCbAndRetrieveElementDuringHydration_
  :: Core.SetCb
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
setCbAndRetrieveElementDuringHydration_ a state'@(FFIDOMSnapshot state) = do
  retrieveElementDuringHydration_ a state'
  -- continue to set the cb on the element
  setCbContinuation_ a state'

createElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
createElement_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addElementScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    e <- createElement a.tag (toDocument d)
    liftST $ STO.poke a.id
      ( SElement
          { listeners: Object.empty
          , parent: a.parent
          , scope: a.scope
          , main: e
          }
      )
      state.units

makeElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
makeElement_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  (if hydrating then hydrateElement_ else createElement_) a state'

ssrMakeElement_
  :: forall r
   . Core.MakeElement
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrMakeElement_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addElementScopeToScopes_ a state'
  attributes <- STA.new
  void $ STO.poke
    a.id
    ( SElement
        { listeners: Object.empty
        , scope: a.scope
        , parent: a.parent
        , main: SSRElement { attributes, tag: a.tag }
        }
    )
    state.units

makeDynCommon
  :: forall r e t m
   . MonadST r m
  => Core.MakeDyn
  -> FFIDOMSnapshot r e t
  -> m Unit
makeDynCommon a state'@(FFIDOMSnapshot state) = do
  liftST $ addElementScopeToScopes_ a state'
  liftST $ void $ STO.poke
    a.id
    ( SDyn
        { scope: a.scope
        , parent: a.parent
        , children: []
        }
    )
    state.units


ssrMakeDyn_
  :: forall r
   . Core.MakeDyn
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrMakeDyn_ = makeDynCommon

makeDyn_
  :: forall r
   . Core.MakeDyn
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
makeDyn_ = makeDynCommon

addTextScopeToScopes_
  :: forall r x e t
   . _
  -> FFIDOMSnapshot r e t
  -> ST r Unit
addTextScopeToScopes_ a (FFIDOMSnapshot state) = do
  let ptr = a.id
  let scope = scopeToString a.scope
  STO.peek scope state.scopes >>= case _ of
    Just arr -> void (STA.push ptr arr)
    Nothing -> do
      arr <- STA.new
      void $ STA.push ptr arr
      void (STO.poke scope arr state.scopes)

foreign import getTextNode_ :: Web.DOM.Element -> Effect (Web.DOM.Text)

hydrateText_
  :: Core.MakeText
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
hydrateText_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addTextScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  b <- body d
  for_ b \b' ->
    for_ a.parent \p' -> do
      qs <- querySelector (QuerySelector ("[data-deku-ssr-" <> p' <> "]"))
        (toParentNode b')
      case qs of
        Just qs' -> do
          tnode <- getTextNode_ qs'
          liftST $ STO.poke a.id
            ( SText
                { scope: a.scope
                , parent: a.parent
                , main: tnode
                }
            )
            state.units
        Nothing -> do
          e <- createTextNode "" (toDocument d)
          liftST $ STO.poke a.id
            ( SText
                { scope: a.scope
                , parent: a.parent
                , main: e
                }
            )
            state.units

createText_
  :: Core.MakeText
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
createText_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addTextScopeToScopes_ a state'
  -- if a portal has not been used yet, there's a chance that
  -- an element is not in the DOM
  -- so our lookup may fail
  -- if it does, we need to create it from scratch
  w <- window
  d <- document w
  b <- body d
  for_ b \b' -> do
    e <- createTextNode "" (toDocument d)
    liftST $ STO.poke a.id
      ( SText
          { scope: a.scope
          , parent: a.parent
          , main: e
          }
      )
      state.units

makeText_
  :: Core.MakeText
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
makeText_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  (if hydrating then hydrateText_ else createText_) a state'

ssrMakeText_
  :: forall r
   . Core.MakeText
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrMakeText_ a state'@(FFIDOMSnapshot state) = do
  liftST $ addTextScopeToScopes_ a state'
  void $ STO.poke
    a.id
    ( SText
        { scope: a.scope
        , parent: a.parent
        , main: SSRText { text: "" }
        }
    )
    state.units

addChildCommon
  :: forall r e t m
   . MonadST r m
  => Core.AddChild
  -> FFIDOMSnapshot r e t
  -> m Unit
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
  :: forall r
   . Core.AddChild
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrAddChild_ = addChildCommon

addChild_
  :: forall r
   . Core.AddChild
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
addChild_ = addChildCommon

removeChildCommon
  :: forall r e t m
   . MonadST r m
  => ( Core.RemoveChild
       -> FFIDOMSnapshot r e t
       -> m Unit
     )
  -> Core.RemoveChild
  -> FFIDOMSnapshot r e t
  -> m Unit
removeChildCommon impl a state'@(FFIDOMSnapshot state) = do
  elt <- liftST $ STO.peek a.id state.units
  for_ elt \elt' -> do
    let
      nnd' = case elt' of
        SElement e -> SElement (e { parent = Nothing })
        SText e -> SText (e { parent = Nothing })
        SDyn e -> SDyn (e { parent = Nothing })
        SEnvy e -> SEnvy (e { parent = Nothing })
        SFixed e -> SFixed (e { parent = Nothing })
    liftST $ void $ STO.poke a.id nnd' state.units
    let
      parent = case elt' of
        SDyn { parent } -> parent
        SEnvy { parent } -> parent
        SFixed { parent } -> parent
        SElement { parent } -> parent
        SText { parent } -> parent
    case elt' of
      SDyn { children } -> for_ children \id -> removeChildCommon impl { id }
        state'
      SEnvy { child } -> for_ child \id -> removeChildCommon impl { id } state'
      SFixed { children } -> for_ children \id -> removeChildCommon impl { id }
        state'
      SElement _ -> impl a state'
      SText _ -> impl a state'
    for_ parent \parent' -> do
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
  :: forall r
   . Core.RemoveChild
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrRemoveChild_ = removeChildCommon \_ _ -> pure unit

removeChild_
  :: forall r
   . Core.RemoveChild
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
removeChild_ = removeChildCommon removeActualChild_

attributeParentCommon
  :: forall r e t m
   . MonadST r m
  => (e -> Either e t -> m Unit)
  -> Core.AttributeParent
  -> FFIDOMSnapshot r e t
  -> m Unit
attributeParentCommon attributor a (FFIDOMSnapshot state) = do
  nd <- liftST $ STO.peek a.id state.units
  for_ nd case _ of
    SElement t -> go (Left t.main) t.parent
    SText t -> go (Right t.main) t.parent
    SDyn _ -> pure unit -- programming error :-(
    SEnvy _ -> pure unit -- programming error :-(
    SFixed _ -> pure unit -- programming error :-(
  where
  go e = case _ of
    Nothing -> pure unit
    Just p -> do
      nd <- liftST $ STO.peek p state.units
      for_ nd case _ of
        SElement t -> attributor t.main e
        SText t -> pure unit -- programming error :-(
        SDyn { parent } -> go e parent
        SEnvy { parent } -> go e parent
        SFixed { parent } -> go e parent

attributeParent_
  :: forall r
   . Core.AttributeParent
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
attributeParent_ = attributeParentCommon
  \e lr -> appendChild
    ( case lr of
        Left elt -> toNode elt
        Right txt -> Web.DOM.Text.toNode txt
    )
    (toNode e)

ssrAttributeParent_
  :: forall r
   . Core.AttributeParent
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrAttributeParent_ = attributeParentCommon \_ _ -> pure unit

foreign import setInnerHTML_ :: String -> Web.DOM.Element -> Effect Unit

setCb_
  :: Core.SetCb
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
setCb_ a state'@(FFIDOMSnapshot state) = do
  hydrating <- liftST $ RRef.read state.hydrating
  ( if hydrating then setCbAndRetrieveElementDuringHydration_
    else setCbContinuation_
  ) a state'

foreign import pursXConnectionStep_
  :: Web.DOM.Element
  -> Core.MakePursx
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit

pursXCreationStepDOM
  :: Core.MakePursx
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
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
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
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

ssrMakePursX_
  :: forall r
   . Core.MakePursx
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrMakePursX_ = pursXCreationStep \t ->
  pure $ SSRPursxElement { html: t }

pursXCreationStep
  :: forall r e t m
   . MonadST r m
  => (String -> m e)
  -> Core.MakePursx
  -> FFIDOMSnapshot r e t
  -> m Unit
pursXCreationStep createElementStep a state'@(FFIDOMSnapshot state) = do
  let ptr = a.id
  let html = a.html
  let verb = a.verb
  let cache = a.cache
  let scope = a.scope
  let pxScope = a.pxScope
  let unfolded = (Object.toUnfoldable :: _ -> Array _) cache
  let
    html' = html # execState
      ( unfolded # traverse \(key /\ val) -> do
          h <- get
          if val then do
            -- it is an attribute
            put $ String.replace (String.Pattern (verb <> key <> verb))
              ( String.Replacement
                  ("data-deku-attr-internal=" <> """"""" <> key <> """"""")
              )
              h
          else do
            put $ String.replace
              ( String.Pattern
                  (verb <> key <> verb)
              )
              ( String.Replacement
                  ( """<span style="display:contents;" data-deku-elt-internal=""""
                      <> """""""
                      <> key
                      <>
                        """"></span>"""
                  )
              )
              h
      )
  e <- createElementStep (trim html')
  liftST $ addElementScopeToScopes_ a state'
  liftST $ void $ STO.poke ptr
    ( SElement
        { listeners: Object.empty
        , parent: a.parent
        , scope: scope
        , main: e
        }
    )
    state.units

pursXHydrationStep
  :: Core.MakePursx
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
pursXHydrationStep a state = retrieveElementDuringHydration_ a state

protoMakeRoot
  :: forall r m x e t c
   . MonadST r m
  => { id :: String, root :: e | c }
  -> FFIDOMSnapshot r e t
  -> m Unit
protoMakeRoot { id, root } state'@(FFIDOMSnapshot state) = do
  liftST $ addElementScopeToScopes_ { id, scope: Bolson.Core.Global } state'
  liftST $ void
    ( STO.poke id
        ( SElement
            { main: root
            , parent: Nothing
            , scope: Bolson.Core.Global
            , listeners: Object.empty
            }
        )
        state.units
    )

makeRoot_
  :: Core.MakeRoot Web.DOM.Element
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit
makeRoot_ = protoMakeRoot

ssrMakeRoot_
  :: forall r
   . Core.MakeRoot (SSRElement r)
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrMakeRoot_ = protoMakeRoot

foreign import setText_
  :: forall r
   . Core.SetText
  -> FFIDOMSnapshot r Web.DOM.Element Web.DOM.Text
  -> Effect Unit

ssrSetText_
  :: forall r
   . Core.SetText
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrSetText_ a (FFIDOMSnapshot state) = do
  elt <- STO.peek a.id state.units
  for_ elt \elt' ->
    case elt' of
      SText t -> void $ STO.poke a.id
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

foreign import setCbContinuation_
  :: forall r
   . Core.SetCb
  -> FFIDOMSnapshot r Web.DOM.Element Web.DOM.Text
  -> Effect Unit

foreign import giveNewParent_
  :: Core.GiveNewParent
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit

ssrGiveNewParent_
  :: forall r
   . Core.GiveNewParent
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrGiveNewParent_ a state'@(FFIDOMSnapshot state) = do
  let ptr = a.id
  let parent = a.parent
  nd <- STO.peek ptr state.units
  for_ nd \nd' -> do
    -- set parent
    let
      nnd' = case nd' of
        SElement a -> SElement (a { parent = Just parent })
        SText a -> SText (a { parent = Just parent })
        SDyn a -> SDyn (a { parent = Just parent })
        SEnvy a -> SEnvy (a { parent = Just parent })
        SFixed a -> SFixed (a { parent = Just parent })
    void $ STO.poke ptr nnd' state.units

foreign import removeActualChild_
  :: forall r
   . Core.RemoveChild
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit

foreign import deleteFromCache_
  :: Core.DeleteFromCache
  -> FFIDOMSnapshot Global Web.DOM.Element Web.DOM.Text
  -> Effect Unit

ssrDeleteFromCache_
  :: forall r
   . Core.DeleteFromCache
  -> FFIDOMSnapshot r (SSRElement r) SSRText
  -> ST r Unit
ssrDeleteFromCache_ a (FFIDOMSnapshot state) = do
  void $ STO.delete a.id state.units

-- fullDOMInterpret
--   :: forall r
--    . Ref.Ref Int
--   -> Core.DOMInterpret Effect (FFIDOMSnapshot r -> Effect Unit)
-- fullDOMInterpret seed = Core.DOMInterpret
--   { ids: do
--       s <- Ref.read seed
--       let
--         o = show
--           (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
--       void $ Ref.modify (add 1) seed
--       pure o
--   , makeElement: makeElement_ false
--   , attributeParent: attributeParent_
--   , makeRoot: makeRoot_
--   , makeText: makeText_ false (maybe unit)
--   , makePursx: makePursx_ false (maybe unit)
--   , setProp: setProp_ false
--   , setCb: setCb_ false
--   , setText: setText_
--   , sendToPos: sendToPos_
--   , deleteFromCache: deleteFromCache_
--   , giveNewParent: giveNewParent_
--   , removeChild: removeChild_
--   }

-- ssrDOMInterpret
--   :: forall r
--    . RRef.STRef r Int
--   -> Core.DOMInterpret (ST r)
--        (RRef.STRef r (Array Instruction) -> ST r Unit)
-- ssrDOMInterpret seed = Core.DOMInterpret
--   { ids: do
--       s <- RRef.read seed
--       let
--         o = show
--           (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
--       void $ RRef.modify (add 1) seed
--       pure o
--   , makeElement: ssrMakeElement
--   , attributeParent: \_ _ -> pure unit
--   , makeRoot: \_ _ -> pure unit
--   , makeText: ssrMakeText
--   , makePursx: ssrMakePursx
--   , setProp: ssrSetProp
--   , setCb: \_ _ -> pure unit
--   , setText: ssrSetText
--   , sendToPos: \_ _ -> pure unit
--   , deleteFromCache: \_ _ -> pure unit
--   , giveNewParent: \_ _ -> pure unit
--   , removeChild: \_ _ -> pure unit
--   }

-- hydratingDOMInterpret
--   :: forall r
--    . Ref.Ref Int
--   -> Core.DOMInterpret Effect (FFIDOMSnapshot r -> Effect Unit)
-- hydratingDOMInterpret seed = Core.DOMInterpret
--   { ids: do
--       s <- Ref.read seed
--       let
--         o = show
--           (evalGen (arbitrary :: Gen Int) { newSeed: mkSeed s, size: 5 })
--       void $ Ref.modify (add 1) seed
--       pure o
--   , makeElement: makeElement_ true
--   , attributeParent: attributeParent_
--   , makeRoot: makeRoot_
--   , makeText: makeText_ true (maybe unit)
--   , makePursx: makePursx_ true (maybe unit)
--   , setProp: setProp_ true
--   , setCb: setCb_ true
--   , setText: setText_
--   , sendToPos: sendToPos_
--   , deleteFromCache: deleteFromCache_
--   , giveNewParent: giveNewParent_
--   , removeChild: removeChild_
--   }