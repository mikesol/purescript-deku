module Deku.Example.Portal where

import Prelude

import Control.Alt (alt)
import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Data.Profunctor (lcmap)
import Deku.Control (portal, switcher, text_)
import Deku.Core (bus, dyn, insert_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold)
import Type.Prelude (Proxy(..))

main :: Effect Unit
main = runInBody
  ( D.div_
      [ text_ "Portal acceptance test"
      , D.hr_ []
      , D.div_
          [ text_ "Switching portals should flip between them"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (pure unit)) \event -> pure
                  $ insert_
                  $ portal
                      ( map
                          ( \i -> D.video
                              [ DA.controls_ "true", DA.width_ "250" ]
                              [ D.source
                                [ DA.src_ i, DA.xtype_ "video/mp4" ]
                                []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : "https://www.w3schools.com/jsref/movie.mp4"
                              : V.empty
                          )
                      )
                      \v -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          p1 = index (Proxy :: _ 1) v
                          ev i = fold (\a _ -> not a) i event
                          flips = D.div_ <<< pure
                            <<< switcher (if _ then p0 else p1)
                            <<< ev
                        D.div_
                          [ D.button
                              [ DL.click_ \_ -> push unit ]
                              [ text_ "Switch videos" ]
                          , D.div_
                              [ flips true, flips false ]
                          ]
              ]
          ]
      , D.hr_ []
      , D.div_
          [ text_ "Single portals should not accumulate"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (pure unit)) \event -> pure
                  $ insert_
                  $ portal
                      ( map
                          ( \i -> D.video
                              [ DA.controls_ "true", DA.width_ "250" ]
                              [ D.source
                                [ DA.src_ i, DA.xtype_ "video/mp4" ]
                                []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : "https://www.w3schools.com/jsref/movie.mp4"
                              : V.empty
                          )
                      )
                      \v -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          p1 = index (Proxy :: _ 1) v
                          ev i = fold (\a _ -> not a) i event
                          flips = D.div_ <<< pure
                            <<< switcher (if _ then p0 else p1)
                            <<< ev
                        D.div_
                          [ D.button
                              [ DL.click_ \_ -> push unit ]
                              [ text_ "Toggle videos" ]
                          , flips true
                          ]
              ]
          ]
      , D.hr_ []
      , D.div_
          [ text_ "Portal should come in and out"
          , D.div_
              [ dyn $ bus \push -> lcmap (alt (pure unit)) \event -> pure
                  $ insert_
                  $ portal
                      ( map
                          ( \i -> D.video
                              [ DA.controls_ "true", DA.width_ "250" ]
                              [ D.source
                                  [ DA.src_ i, DA.xtype_ "video/mp4" ]
                                  []
                              ]
                          )
                          ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                              : V.empty
                          )
                      )
                      \v -> do
                        let
                          p0 = index (Proxy :: _ 0) v
                          ev i = fold (\a _ -> not a) i event
                          flips = D.div_ <<< pure
                            <<< switcher (if _ then p0 else D.div_ [])
                            <<< ev
                        D.div_
                          [ D.button
                              [ DL.click_ \_ -> push unit ]
                              [ text_ "Toggle videos" ]
                          , flips true
                          ]
              ]
          ]
      , D.hr_ []
      ]
  )
