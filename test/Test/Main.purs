module Test.Main where

import Prelude

import Deku.Attributes (id_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody')
import Effect (Effect)

sanityCheck :: Effect (Effect Unit)
sanityCheck = runInBody' (D.span (id_ "hello") [ text_ "Hello" ])

elementsInCorrectOrder :: Effect (Effect Unit)
elementsInCorrectOrder =
  runInBody' do
    let
      l n
        | n == 10 = []
        | otherwise =
            [ let
                x = "span" <> show n <> "-0"
              in
                D.span (id_ x) [ text_ (x <> "A") ]
            , let
                x = "span" <> show n <> "-1"
              in
                D.span (id_ x) [ text_ (x <> "B") ]
            , let x = "div" <> show n <> "-2" in D.span (id_ x) (l (n + 1))
            , let
                x = "span" <> show n <> "-3"
              in
                D.span (id_ x) [ text_ (x <> "D") ]
            ]
    D.div (id_ "div0-0") (l 1)
