module Deku.Example.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Control.Alternative (empty, guard)
import Data.Array ((..))
import Data.Either (Either(..), hush)
import Data.Exists (mkExists)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (deku, flatten)
import Deku.Control as C
import Deku.Core (Element, SubgraphF(..))
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Subgraph (SubgraphAction(..))
import Deku.Subgraph as S
import Effect (Effect)
import FRP.Event (Event, create, filterMap, keepLatest, mapAccum, subscribe)
import FRP.Event.Class (bang)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

data HelloWorld = Hello | World

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)

dropFirst :: Event ~> Event
dropFirst event = counter event # filterMap
  (\(Tuple a i) -> if i == 0 then Nothing else Just a)

n0 :: Int
n0 = 40
n1 :: Int
n1 = 10
scene
  :: (HelloWorld -> Effect Unit)
  -> Event HelloWorld
  -> Element Event (FFIDOMSnapshot -> (Effect Unit))
scene push event =
  flatten
    [ D.div_
        [ D.a
            ( oneOfMap bang
                [ D.Href := "#"
                , D.OnClick := cb (const $ push Hello)
                ]
            )
            [ C.text_ "click" ]
        , S.subgraph
            ( falsy n0 <|>
                map (\_ -> 9 /\ InsertOrUpdate true)
                  ( counter hellos # filterMap
                      (\(Tuple _ y) -> if y == 0 then Nothing else Just unit)
                  )
            )
            \index -> mkExists $ SubgraphF \hsup tneve -> D.a
              ( bang (D.Href := "#") <|> bang
                  ( D.OnClick := cb
                      ( const $ do
                          hsup unit
                          when (index == 4) (push Hello)
                      )
                  )
              )
              [ C.text
                  ( ( counter (tneve # filterMap hush) # map
                        (\(_ /\ y) -> if mod y 2 == 0 then " em " else " me ")
                    ) <|> (bang " me ") <|>
                      ( (dropFirst tneve)
                          # filterMap
                            ( case _ of
                                Left _ -> Just unit
                                Right _ -> Nothing
                            )
                          # map (const " banana ")
                      )
                  )
              ]
        ]
    , D.div_
        [ D.a
            ( oneOfMap bang
                [ D.Href := "#", D.OnClick := cb (const $ push World) ]
            )
            [ C.text_ "click" ]
        , D.span_
            [ S.subgraph
                ( falsy n1 <|>
                    ( counter worlds
                        # map snd
                        # map
                          ( \lmt ->
                              let
                                moded = lmt `mod` 10
                              in
                                oneOfMap bang
                                  ( map
                                      ( \i -> i /\
                                          ( if i < (moded + 1) then
                                              InsertOrUpdate
                                                false
                                            else Remove
                                          )
                                      )
                                      (0 .. 10)
                                  ) <|>
                                  (if (moded == 5) then bang (5 /\ SendToTop) else empty)
                          )
                        # keepLatest
                    )
                )
                \index -> mkExists $ SubgraphF \hsup tneve -> D.a
                  ( bang (D.Href := "#") <|> bang
                      ( D.OnClick := cb
                          ( const $ do
                              hsup unit
                              when (index == 4) (push Hello)
                          )
                      )
                  )
                  [ C.text
                      ( ( counter (tneve # filterMap hush) # map
                            ( \(_ /\ y) ->
                                (if mod y 2 == 0 then " em" else " me")
                                  <> show index
                                  <> " "
                            )
                        ) <|> (bang (" me" <> show index <> " "))
                      )
                  ]
            ]
        ]
    ]
  where
  falsy n = oneOfMap bang (map (\i -> i /\ InsertOrUpdate false) (0 .. n))
  hellos = filterMap
    ( case _ of
        Hello -> Just unit
        World -> Nothing
    )
    event
  worlds = filterMap
    ( case _ of
        World -> Just unit
        Hello -> Nothing
    )
    event

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push Hello
