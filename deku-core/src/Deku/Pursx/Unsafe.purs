module Deku.Pursx.Unsafe where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR)
import Control.Alt ((<|>))
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Nut(..), Nut', NutF(..), Node(..))
import FRP.Event (Event, Subscriber(..), merge, makeLemmingEventO)
import Foreign.Object as Object
import Prim.Row as Row
import Prim.RowList as RL
import Record (get)
import Safe.Coerce (coerce)
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
  step1 _ = Node \_ _ -> empty

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
              ( Element' $ Node \info di ->
                  __internalDekuFlatten
                    { parent: Just (reflectType pxk <> "@!%" <> pxScope)
                    , scope: info.scope
                    , raiseId: \_ -> pure unit
                    , pos: info.pos
                    , ez: false
                    , dynFamily: Nothing
                    }
                    di
                    ((\(Nut df) -> df) (get pxk r))
                    <|> (let Node y = (domableToNode element) in y) info di
              )
          )
      }
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Event (Attribute deku)) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Event (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Nut
          ( NutF
              ( Element'
                  ( Node
                      \parent
                       di@(DOMInterpret { setProp, setCb, unsetAttribute }) ->
                        map
                          ( lcmap unsafeUnAttribute
                              ( \{ key, value } -> case value of
                                  Prop' p -> setProp
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    , value: p
                                    }
                                  Cb' c -> setCb
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    , value: c
                                    }
                                  Unset' -> unsetAttribute
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    }
                              )
                          )
                          (get pxk r)
                          <|> (let Node y = (domableToNode element) in y) parent
                            di
                  )
              )
          )
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ _ =
    { cache: Object.empty
    , element: Nut (NutF $ Element' $ Node \_ _ -> empty)
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
  ee = NutF (Element' (Node go))

  go
    :: forall payload
     . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: element' } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      let Node element = domableToNode element'
      unsub <- runSTFn2 mySub
        ( merge
            [ pure $
                mpx
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
            , element z di
            , maybe empty
                ( \p ->
                    pure $ attributeParent
                      { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent
            ]
        )
        k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

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