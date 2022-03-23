module Deku.Example.Subgraph where

import Prelude

import Data.Array ((..))
import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Monoid.Additive (Additive(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Control.Functions (modifyRes, (%!>), (%>), (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), xsubgraph, Href(..), OnClick(..), a, a'attr, root, subgraph, text, (:=))
import Deku.Graph.DOM as D
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

data HelloWorld = Hello | World

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 HelloWorld Unit
scene elt =
  ( \_ push0 ->
      let
        falsy n = Map.fromFoldable (map (\i -> i /\ Just false) (0 .. n))
      in
        ( root elt
            { hello: D.div []
                { hello: a
                    [ Href := "#", OnClick := cb (const $ push0 Hello) ]
                    { ht: text "click" }
                , helloA: subgraph (falsy 40)
                    ( AsSubgraph \i ->

                        ( \_ push ->
                            { myA: a
                                [ Href := "#"
                                , OnClick := cb
                                    ( const $ do
                                        push false
                                        when (i == 4) (push0 Hello)
                                    )
                                ]
                                { myTxt: text " me " }
                            } /\ push

                        ) %>
                          ( \e push ->
                              case e of
                                Left tf ->
                                  when tf
                                    (change { "myA.myTxt": "banana" }) $> push
                                Right tf ->
                                  change
                                    { "myA": a'attr
                                        [ OnClick := cb (const $ push (not tf))
                                        ]
                                    , "myA.myTxt": if tf then " me " else " em "
                                    } $> push
                          )
                    )
                }
            , world: D.div []
                { wA: a [ Href := "#", OnClick := cb (const $ push0 World) ]
                    { ht: text "click" }
                , wB: subgraph (falsy 10)
                    ( AsSubgraph \i ->
                        ( \_ push ->
                            ( { myA: a
                                  [ Href := "#"
                                  , OnClick := cb
                                      ( const $ do
                                          push false
                                          when (i == 11) (push0 Hello)
                                      )
                                  ]
                                  { myTxt: text $ " me" <> show i <> " " }
                              } /\ (push /\ Additive i) /\ (Additive i)
                            )
                        ) %!>
                          \e (push /\ (Additive i')) ->
                            case e of
                              Left _ ->
                                map ((/\) push) $ modifyRes
                                  (const $ Additive ((i' + 1) `mod` 40))
                              Right tf ->
                                map ((/\) push)
                                  ( change
                                      { "myA": a'attr
                                          [ OnClick := cb
                                              (const $ push (not tf))
                                          ]
                                      , "myA.myTxt":
                                          if tf then " me"
                                          else " em" <> show i <> " "
                                      } *> modifyRes (const $ Additive i')
                                  )

                    )
                }

            }
            /\ 0
        )
  ) @> \e lmt ->
    lmt + 1 <$ case e of
      Left _ -> pure unit
      Right Hello -> change
        { "root.hello.helloA": xsubgraph (Map.singleton 9 (Just true))
        }
      Right World -> change
        { "root.world.wB": xsubgraph
            ( Map.fromFoldable
                ( map
                    ( \i -> i /\
                        (if i < lmt `mod` 10 then Just false else Nothing)
                    )
                    (0 .. 10)
                )
            )
        }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
