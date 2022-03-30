module Deku.Example.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Control.Alternative (guard)
import Data.Array ((..))
import Data.Either (Either(..), hush)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (deku)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Subgraph (SubgraphAction(..))
import Deku.Subgraph as S
import Effect (Effect)
import FRP.Event (Event, create, filterMap, keepLatest, mapAccum, subscribe)
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
  -> Array (Element FFIDOMSnapshot (Effect Unit))
scene push event =
  [ D.div_
      [ D.a
          ( oneOfMap pure
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
          \index hsup tneve -> D.a
            ( pure (D.Href := "#") <|> pure
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
                  ) <|> (pure " me ") <|>
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
          ( oneOfMap pure
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
                              oneOfMap pure
                                ( map
                                    ( \i -> i /\
                                        ( if i < (moded + 1) then InsertOrUpdate
                                            false
                                          else Remove
                                        )
                                    )
                                    (0 .. 10)
                                ) <|>
                                (guard (moded == 5) $> (5 /\ SendToTop))
                        )
                      # keepLatest
                  )
              )
              \index hsup tneve -> D.a
                ( pure (D.Href := "#") <|> pure
                    ( D.OnClick := cb
                        ( const $ do
                            hsup unit
                            when (index == 4) (push Hello)
                        )
                    )
                )
                [ C.text
                    ( ( counter (tneve # filterMap hush) # map
                          ( \(_ /\ y) -> (if mod y 2 == 0 then " em" else " me")
                              <> show index
                              <> " "
                          )
                      ) <|> (pure (" me" <> show index <> " "))
                    )
                ]
          ]
      ]
  ]
  where
  falsy n = oneOfMap pure (map (\i -> i /\ InsertOrUpdate false) (0 .. n))
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
