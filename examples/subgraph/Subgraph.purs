module Deku.Example.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Data.Array ((..))
import Data.Either (Either(..), hush)
import Data.Foldable (for_, oneOfMap)
import Data.Map (fromFoldable, singleton)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested ((/\))
import Debug (spy)
import Deku.Attribute (cb, (:=))
import Deku.Control (deku)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Subgraph as S
import Effect (Effect)
import FRP.Event (Event, create, filterMap, fix, sampleOn, subscribe)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

data HelloWorld = Hello | World

counter :: forall a. Event a → Event (Tuple a Int)
counter event = fix
  ( \i ->
      let
        output = sampleOn (i <|> pure (-1)) (Tuple <$> event)
      in
        { input: map (add 1 <<< snd) output, output }
  )
dropFirst :: Event ~> Event
dropFirst event = counter event # filterMap (\(Tuple a i) -> if (spy "III" i) == 0 then Nothing else Just a)

n0 = 40
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
          ( (pure $ falsy n0) <|>
                map (\_ -> spy "sending 9" $ singleton 9 (Just true)) ( counter hellos # filterMap
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
                (  ( counter (tneve # filterMap hush) # map
                      (\(_ /\ y) -> if mod y 2 == 0 then " em " else " me ")
                  ) <|> (pure " me ") <|>
                    ((dropFirst  (tneve # map (spy "incoming")))
                        # filterMap
                          ( case _ of
                              Left _ -> Just unit
                              Right _ -> Nothing
                          )
                        # map (const $ spy "foo" " banana ")
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
      , S.subgraph
          ( (pure $ falsy n1) <|>
              ( counter worlds
                  # filterMap
                    (\(Tuple _ y) -> if y == 0 then Nothing else Just y)
                  # map
                    ( \lmt -> fromFoldable
                        ( map
                            ( \i -> i /\
                                ( if i < lmt `mod` 10 then Just false
                                  else Nothing
                                )
                            )
                            (0 .. 10)
                        )
                    )
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
                      (\(_ /\ y) -> if mod y 2 == 0 then " me " else " em ")
                  ) <|> (pure " me ")
                )
            ]
      ]
  ]
  where
  falsy n = Map.fromFoldable (map (\i -> i /\ Just false) (0 .. n))
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

-- data HelloWorld = Hello | World

-- scene
--   :: WEB.DOM.Element
--   -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 HelloWorld Unit
-- scene elt =
--   ( \_ push0 ->
--       let
--         falsy n = Map.fromFoldable (map (\i -> i /\ Just false) (0 .. n))
--       in
--         ( root elt
--             { hello: D.div []
--                 { hello: a
--                     [ Href := "#", OnClick := cb (const $ push0 Hello) ]
--                     { ht: text "click" }
--                 , helloA: subgraph (falsy 40)
--                     ( AsSubgraph \i ->

--                         ( \_ push ->
--                             { myA: a
--                                 [ Href := "#"
--                                 , OnClick := cb
--                                     ( const $ do
--                                         push false
--                                         when (i == 4) (push0 Hello)
--                                     )
--                                 ]
--                                 { myTxt: text " me " }
--                             } /\ push

--                         ) %>
--                           ( \e push ->
--                               case e of
--                                 Left tf ->
--                                   when tf
--                                     (change { "myA.myTxt": "banana" }) $> push
--                                 Right tf ->
--                                   change
--                                     { "myA": a'attr
--                                         [ OnClick := cb (const $ push (not tf))
--                                         ]
--                                     , "myA.myTxt": if tf then " me " else " em "
--                                     } $> push
--                           )
--                     )
--                 }
--             , world: D.div []
--                 { wA: a [ Href := "#", OnClick := cb (const $ push0 World) ]
--                     { ht: text "click" }
--                 , wB: subgraph (falsy 10)
--                     ( AsSubgraph \i ->
--                         ( \_ push ->
--                             ( { myA: a
--                                   [ Href := "#"
--                                   , OnClick := cb
--                                       ( const $ do
--                                           push false
--                                           when (i == 11) (push0 Hello)
--                                       )
--                                   ]
--                                   { myTxt: text $ " me" <> show i <> " " }
--                               } /\ (push /\ Additive i) /\ (Additive i)
--                             )
--                         ) %!>
--                           \e (push /\ (Additive i')) ->
--                             case e of
--                               Left _ ->
--                                 map ((/\) push) $ modifyRes
--                                   (const $ Additive ((i' + 1) `mod` 40))
--                               Right tf ->
--                                 map ((/\) push)
--                                   ( change
--                                       { "myA": a'attr
--                                           [ OnClick := cb
--                                               (const $ push (not tf))
--                                           ]
--                                       , "myA.myTxt":
--                                           if tf then " me"
--                                           else " em" <> show i <> " "
--                                       } *> modifyRes (const $ Additive i')
--                                   )

--                     )
--                 }

--             }
--             /\ 0
--         )
--   ) @> \e lmt ->
--     lmt + 1 <$ case e of
--       Left _ -> pure unit
--       Right Hello -> change
--         { "root.hello.helloA": xsubgraph (Map.singleton 9 (Just true))
--         }
--       Right World -> change
--         { "root.world.wB": xsubgraph
--             ( Map.fromFoldable
--                 ( map
--                     ( \i -> i /\
--                         (if i < lmt `mod` 10 then Just false else Nothing)
--                     )
--                     (0 .. 10)
--                 )
--             )
--         }

-- main :: Effect Unit
-- main = do
--   b' <- window >>= document >>= body
--   for_ (toElement <$> b') \b -> do
--     ffi <- makeFFIDOMSnapshot
--     subscribe
--       (run (pure unit) (pure unit) defaultOptions ffi (scene b))
--       (\_ -> pure unit)
