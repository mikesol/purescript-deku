module Test.Main where

import Prelude

import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (id_)
import Deku.Control (text_)
import Deku.Core (dyn, insert_)
import Deku.DOM as D
import Deku.Do (useState')
import Deku.Do as Deku
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import FRP.Event (Event, fold)

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

dynAppearsCorrectly :: Effect (Effect Unit)
dynAppearsCorrectly = do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (const (add 1)) event (-1)
  runInBody' Deku.do
    setItem /\ item <- useState'
    D.div (id_ "div0")
      [ text_ "foo"
      , D.span (id_ "div1") [ text_ "bar" ]
      , dyn
          ( (counter item) <#> \i -> pure
              (insert_ (D.span (id_ ("dyn" <> show i)) [ text_ (show i) ]))
          )
      , D.button (oneOf [ id_ "incr", click_ (setItem unit) ]) [ text_ "incr" ]
      ]
