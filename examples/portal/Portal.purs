module Deku.Example.Portal where

import Prelude

import Control.Alt (alt)
import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Deku.Attribute (cb, (:=))
import Deku.Control (portal, switcher, text_)
import Deku.Core (dyn, insert)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (bang, bus, fold)
import Type.Prelude (Proxy(..))

main :: Effect Unit
main = runInBody
  ( D.div_
      [ text_ "Portal acceptance test"
      , D.hr_ []
      , D.div_
          [ text_ "Switching portals should flip between them"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (bang unit)) \event -> bang
                  $ insert
                  $
                    portal
                      ( map
                          ( \i -> D.video
                              ( oneOfMap bang
                                  [ D.Controls := "true", D.Width := "250" ]
                              )
                              [ D.source
                                  ( oneOfMap bang
                                      [ D.Src := i, D.Xtype := "video/mp4" ]
                                  )
                                  []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : "https://www.w3schools.com/jsref/movie.mp4"
                              : V.empty
                          )
                      )
                      \v _ -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          p1 = index (Proxy :: _ 1) v
                          ev = fold (const not) event
                          flips = switcher (if _ then p0 else p1) <<< ev
                        D.div_
                          [ D.button
                              (bang $ D.OnClick := cb (const $ push unit))
                              [ text_ "Switch videos" ]
                          , D.div_
                              [ D.div_ [ flips true ], D.div_ [ flips false ] ]
                          ]
              ]
          ]
      , D.hr_ []
      , D.div_
          [ text_ "Single portals should not accumulate"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (bang unit)) \event -> bang
                  $ insert
                  $
                    portal
                      ( map
                          ( \i -> D.video
                              ( oneOfMap bang
                                  [ D.Controls := "true", D.Width := "250" ]
                              )
                              [ D.source
                                  ( oneOfMap bang
                                      [ D.Src := i, D.Xtype := "video/mp4" ]
                                  )
                                  []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : "https://www.w3schools.com/jsref/movie.mp4"
                              : V.empty
                          )
                      )
                      \v _ -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          p1 = index (Proxy :: _ 1) v
                          ev = fold (const not) event
                          flips = switcher (if _ then p0 else p1) <<< ev
                        D.div_
                          [ D.button
                              (bang $ D.OnClick := cb (const $ push unit))
                              [ text_ "Toggle videos" ]
                          , D.div_ [ flips true ]
                          ]
              ]
          ]
      , D.hr_ []
      , D.div_
          [ text_ "Portal should come in and out"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (bang unit)) \event -> bang
                  $ insert
                  $
                    portal
                      ( map
                          ( \i -> D.video
                              ( oneOfMap bang
                                  [ D.Controls := "true", D.Width := "250" ]
                              )
                              [ D.source
                                  ( oneOfMap bang
                                      [ D.Src := i, D.Xtype := "video/mp4" ]
                                  )
                                  []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : V.empty
                          )
                      )
                      \v _ -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          ev = fold (const not) event
                          flips = switcher (if _ then p0 else D.div_ []) <<< ev
                        D.div_
                          [ D.button
                              (bang $ D.OnClick := cb (const $ push unit))
                              [ text_ "Toggle videos" ]
                          , D.div_ [ flips true ]
                          ]
              ]
          ]
      , D.hr_ []
      ]
  )
