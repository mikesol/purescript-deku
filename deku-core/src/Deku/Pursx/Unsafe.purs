module Deku.Pursx.Unsafe where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..))
import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Data.Traversable (for_)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Control (unsafeSetAttribute)
import Deku.Core (DOMInterpret(..), Node(..), Node', Nut(..), NutF(..), flattenArgs)
import FRP.Event (merge)
import FRP.Poll (Poll, poll, sample)
import Foreign.Object as Object
import Prim.Row as Row
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))

class
  PursxToElement (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Nut }

domableToNode :: Nut -> forall payload. Node payload
domableToNode (Nut df) = step1 df
  where
  step1 :: forall payload. NutF payload -> Node payload
  step1 (NutF (Element' n)) = n
  step1 _ = Node $ Element \_ _ -> poll \_ -> empty

instance pursxToElementConsInsert ::
  ( Row.Cons key (Nut) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Nut) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Nut
          ( NutF
              ( Element' $ Node $ Element
                  \info di@(DOMInterpret { deferPayload, deleteFromCache }) ->
                    Bolson.behaving
                      \ee kx subscribe -> do
                        let Node (Element rest) = domableToNode element
                        let evt1 = sample (rest info di) ee
                        let
                          evt0 = sample
                            ( __internalDekuFlatten
                                ((\(Nut df) -> df) (get pxk r))
                                { parent: Just
                                    (reflectType pxk <> "@!%" <> pxScope)
                                , scope: info.scope
                                , raiseId: \_ -> pure unit
                                , pos: info.pos
                                , ez: false
                                , deferralPath: info.deferralPath
                                , dynFamily: Nothing
                                }
                                di
                            )
                            ee
                        kx $ deferPayload info.deferralPath $ deleteFromCache
                          { id: reflectType pxk <> "@!%" <> pxScope }

                        subscribe (merge [ evt0, evt1 ])
              )
          )
      }
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Poll (Attribute deku)) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Poll (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r = do
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
      Node (Element rest) = domableToNode element

      elt :: forall payload. Node' payload
      elt parent di@(DOMInterpret { deferPayload, deleteFromCache }) =
        Bolson.behaving \ee kx subscribe -> do
          let bhv = rest parent di
          let myId = reflectType pxk <> "@!%" <> pxScope
          subscribe $ sample (map unsafeUnAttribute (get pxk r))
            ( ( \fff xx -> fff $ unsafeSetAttribute di
                  myId
                  xx
              ) <$> ee
            )
          -- this may result in double deletion requests if
          -- we attach multiple attributes to a single element
          -- in the cache, but that's ok
          -- the important thing is that, when it's cleaned up,
          -- it's out of the cache
          kx $ deferPayload parent.deferralPath $ deleteFromCache
            { id: myId }
          subscribe (sample bhv ee)
    { cache: Object.insert (reflectType pxk) true cache
    , element: Nut (NutF (Element' (Node (Element elt))))
    }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ _ =
    { cache: Object.empty
    , element: Nut
        ( NutF $ Element' $ Node $ Element \_ _ -> poll \_ -> empty
        )
    }

unsafeMakePursx
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> { | r }
  -> Nut
unsafeMakePursx = unsafeMakePursx' "~"

unsafeMakePursx'
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> String
  -> { | r }
  -> Nut
unsafeMakePursx' verb html r = Nut ee
  where
  ee :: forall payload. NutF payload
  ee = NutF (Element' (Node (Element go)))

  go :: forall payload. Node' payload
  go
    z@{ parent, scope, raiseId, dynFamily, pos, deferralPath }
    di@
      ( DOMInterpret
          { makePursx: mpx
          , deferPayload
          , ids
          , deleteFromCache
          , attributeParent
          }
      ) =
    Bolson.behaving \eee kx subscribe -> do
      me <- show <$> ids
      pxScope <- show <$> ids
      raiseId me
      let
        { cache, element: element' } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      let Node (Element element) = domableToNode element'
      let bhv = element z di
      kx $ mpx
        { id: me
        , parent
        , cache
        , dynFamily
        , pos
        , pxScope: pxScope
        , scope
        , html
        , verb
        }
      for_ parent \p -> kx $ attributeParent
        { id: me, parent: p, pos, dynFamily, ez: false }
      kx (deferPayload deferralPath (deleteFromCache { id: me }))
      subscribe (sample bhv eee)

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten (NutF c) a b = Bolson.flatten flattenArgs c a b
