module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as RRef
import Control.Plus (empty)
import Data.Foldable (intercalate, oneOf, oneOfMap)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (id_)
import Deku.Control (blank, globalPortal1, switcher, text_)
import Deku.Core (Domable, Nut, dyn, fixed, insert, insert_, sendToPos)
import Deku.DOM as D
import Deku.Do (useMemoized, useState, useState')
import Deku.Do as Deku
import Deku.Interpret (FFIDOMSnapshot, Instruction)
import Deku.Listeners (click_)
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (Template(..), hydrate', runInBody', runSSR)
import Effect (Effect)
import FRP.Event (Event, fold)
import Type.Proxy (Proxy(..))

runNoSSR
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runNoSSR = runInBody'

runWithSSR
  :: (forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit))
  -> Effect (Effect Unit)
runWithSSR = hydrate'

ssr
  :: ( forall lock
        . Domable lock
            (RRef.STRef Global (Array Instruction) -> ST Global Unit)
     )
  -> ST Global String
ssr = runSSR (Template { head: "<head></head>", tail: "" })

sanityCheck :: Nut
sanityCheck = D.span (id_ "hello") [ text_ "Hello" ]

elementsInCorrectOrder :: Nut
elementsInCorrectOrder = do
  let
    l n
      | n == 10 = []
      | otherwise =
          [ do
              let x = "span" <> show n <> "-0"
              D.span (id_ x) [ text_ (x <> "A") ]
          , do
              let x = "span" <> show n <> "-1"
              D.span (id_ x) [ text_ (x <> "B") ]
          , do
              let x = "div" <> show n <> "-2"
              D.span (id_ x) (l (n + 1))
          , do
              let x = "span" <> show n <> "-3"
              D.span (id_ x) [ text_ (x <> "D") ]
          ]
  D.div (id_ "div0-0") (l 1)

dynAppearsCorrectly :: Nut
dynAppearsCorrectly = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event 
  setItem /\ item <- useState'
  D.div (id_ "div0")
    [ text_ "foo"
    , D.span (id_ "div1") [ text_ "bar" ]
    , dyn
        ( counter item <#> \i -> pure
            $ insert_ (D.span (id_ ("dyn" <> show i)) [ text_ (show i) ])
        )
    , D.button (oneOf [ id_ "incr", click_ (setItem unit) ]) [ text_ "incr" ]
    ]

deeplyNestedPreservesOrder :: Nut
deeplyNestedPreservesOrder = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event 
  setItem /\ item <- useState'
  let
    mydyn n = do
      let sn = show n
      fixed
        [ dyn
            ( counter item <#> \i -> pure
                $ insert_
                    if i == 1 then mydyn (n + 1)
                    else D.span (id_ ("dyn" <> sn <> "-" <> show i))
                      [ text_ (sn <> "-" <> show i) ]
            )
        , D.button (oneOf [ id_ $ "incr-" <> sn, click_ (setItem unit) ])
            [ text_ $ "incr-" <> sn ]
        ]
  D.div (id_ "div0")
    [ text_ "foo"
    , D.span (id_ "div1") [ text_ "bar" ]
    , mydyn 0
    ]

-- why intercalate with mempty? why not!
isAMonoid :: Nut
isAMonoid = intercalate mempty $ map text_ [ "m", "o", "n", "o", "i", "d" ]

sendsToPosition :: Nut
sendsToPosition = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div (id_ "div0")
    [ text_ "foo"
    , D.span (id_ "div1") [ text_ "bar" ]
    , dyn
        ( oneOfMap pure [ 0, 1, 2, 3, 4 ] <#> \i ->
            oneOf
              [ pure $ insert_
                  (D.span (id_ ("dyn" <> show i)) [ text_ (show i) ])
              , if i == 3 then posIdx <#> sendToPos else empty
              ]
        )
    , D.button (oneOf [ id_ "pos", click_ (setPosIdx 1) ])
        [ text_ "send to pos" ]
    ]

sendsToPositionFixed :: Nut
sendsToPositionFixed = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div (id_ "div0")
    [ text_ "foo"
    , D.span (id_ "div1") [ text_ "bar" ]
    , dyn
        ( oneOfMap pure [ 0, 1, 2, 3, 4 ] <#> \i ->
            oneOf
              [ pure $ insert_
                  $ fixed
                      [ D.span (id_ ("dyn" <> show i <> "a"))
                          [ text_ (show i <> "a") ]
                      , D.span (id_ ("dyn" <> show i <> "a"))
                          [ text_ (show i <> "b") ]
                      ]
              , if i == 3 then posIdx <#> sendToPos else empty
              ]
        )
    , D.button (oneOf [ id_ "pos", click_ (setPosIdx 1) ])
        [ text_ "send to pos" ]
    ]

insertsAtCorrectPositions :: Nut
insertsAtCorrectPositions = D.div (id_ "div0")
  [ text_ "foo"
  , D.span (id_ "div1") [ text_ "bar" ]
  , dyn
      -- if we just used insert_ here, it would go in
      -- linear order
      -- here, we scramble the order and make sure that the dyns
      -- are inserted in the scrambled order so that they read
      -- 0-1-2-3-4 from top to bottom
      ( oneOfMap pure [ 3, 0, 4, 2, 1 ] <#> \i ->
          oneOf
            [ pure $ insert i
                (D.span (id_ ("dyn" <> show i)) [ text_ (show i) ])
            ]

      )
  ]

switcherWorksForCompositionalElements :: Nut
switcherWorksForCompositionalElements = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> 1 + a) (-1) event
  setItem /\ item <- useState unit
  D.div (id_ "div0")
    [ text_ "foo"
    , D.span (id_ "div1") [ text_ "bar" ]
    , counter item # switcher \i -> fixed
        ( [ 0, 1, 2 ] <#> \j -> D.span (id_ $ "id" <> show j)
            [ text_ (show i <> "-" <> show j) ]
        )
    , D.button (oneOf [ id_ "incr", click_ (setItem unit) ]) [ text_ "incr" ]
    ]

tabbedNavigationWithPursx :: Nut
tabbedNavigationWithPursx = Deku.do
  setItem /\ item <- useState 0
  D.div (id_ "div0")
    [ D.div_
        [ D.button (oneOf [ id_ "home-btn", click_ (setItem 0) ])
            [ text_ "home" ]
        , D.button (oneOf [ id_ "about-btn", click_ (setItem 1) ])
            [ text_ "about" ]
        , D.button (oneOf [ id_ "contact-btn", click_ (setItem 2) ])
            [ text_ "contact" ]
        ]
    , item # switcher case _ of
        0 -> (Proxy :: _ "<h1 id=\"home\">home</h1>") ~~ {}
        1 -> (Proxy :: _ "<h1 id=\"about\">about ~me~</h1>") ~~
          { me: nut $ text_ "deku" }
        _ -> (Proxy :: _ "<h1 id=\"contact\">contact ~a~ at ~b~ ~c~</h1>") ~~
          { a: nut $ D.span_ [ text_ "mike" ]
          , b: nut $ text_ "site.com"
          , c: nut $ (Proxy :: _ "<h1 id=\"thanks\">thanks</h1>") ~~ {}
          }
    ]

portalsCompose :: Nut
portalsCompose = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) 0 event
  setItem /\ item <- useMemoized (\a -> counter a <|> pure 0)
  globalPortal1 (D.div_ [ text_ "a", D.span_ [ text_ "b" ], text_ "c" ]) \e ->
    do
      let
        switchMe n = item # switcher
          ( (_ `mod` 3) >>> case _ of
              i
                | i == n -> e
                | otherwise -> blank
          )
      D.div (id_ "maindiv")
        [ D.div_ [ text_ "d0" ]
        , switchMe 0
        , D.div_ [ text_ "d1" ]
        , switchMe 1
        , D.div_ [ text_ "d2" ]
        , switchMe 2
        , D.button (oneOf [ id_ "incr", click_ (setItem unit) ])
            [ text_ "incr" ]
        ]

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div (id_ "div0")
    [ (Proxy :: _ "<h1 id=\"px\">début ~me~ fin</h1>") ~~
        { me: nut $ fixed [ text_ "milieu", text_ " ", text_ "après-milieu" ] }
    ]