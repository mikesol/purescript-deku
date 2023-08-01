module Test.Main where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Plus (empty)
import Data.Array ((..))
import Data.Filterable (compact, filter)
import Data.Foldable (intercalate)
import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (id_, style, style')
import Deku.Control (globalPortal1, portal1, text, text', textShow', text_)
import Deku.Core (Nut, fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (dynOptions, useDyn, useDynAtBeginning_, useDynAtEndWith, useDynAtEnd_, useMemoized, useRef, useState, useState', (<##~>))
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Listeners (click_)
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate', runInBody', runSSR)
import Effect (Effect)
import FRP.Event (Event, fold, mapAccum, merge)
import Type.Proxy (Proxy(..))

foreign import hackyInnerHTML :: String -> String -> Effect Unit
foreign import doStateAssertionsForTests_
  :: FFIDOMSnapshot -> Int -> Effect Unit

runNoSSR :: Nut -> Int -> Effect (Effect Unit)
runNoSSR n i = do
  x <- runInBody' n
  pure do
    ffi <- x
    doStateAssertionsForTests_ ffi i

runWithSSR :: Nut -> Int -> Effect (Effect Unit)
runWithSSR n i = do
  x <- hydrate' n
  pure do
    ffi <- x
    doStateAssertionsForTests_ ffi i

ssr :: Nut -> ST Global String
ssr i = pure "<head></head>" <> runSSR i

sanityCheck :: Nut
sanityCheck = D.span [ id_ "hello" ] [ text_ "Hello" ]

elementsInCorrectOrder :: Nut
elementsInCorrectOrder = do
  let
    l n
      | n == 10 = []
      | otherwise =
          [ do
              let x = "span" <> show n <> "-0"
              D.span [ id_ x ] [ text_ (x <> "A") ]
          , do
              let x = "span" <> show n <> "-1"
              D.span [ id_ x ] [ text_ (x <> "B") ]
          , do
              let x = "div" <> show n <> "-2"
              D.span [ id_ x ] (l (n + 1))
          , do
              let x = "span" <> show n <> "-3"
              D.span [ id_ x ] [ text_ (x <> "D") ]
          ]
  D.div [ id_ "div0-0" ] (l 1)

dynAppearsCorrectlyAtBeginning :: Nut
dynAppearsCorrectlyAtBeginning = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtBeginning_ (counter item)
        D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "incr" ]
    ]

dynAppearsCorrectlyAtEnd :: Nut
dynAppearsCorrectlyAtEnd = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtEnd_ (counter item)
        D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "incr" ]
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
        [ Deku.do
            { value: i } <- useDynAtEnd_ (counter item)
            if i == 1 then mydyn (n + 1)
            else D.span [ id_ ("dyn" <> sn <> "-" <> show i) ]
              [ text_ (sn <> "-" <> show i) ]
        , D.button [ id_ $ "incr-" <> sn, click_ (setItem unit) ]
            [ text_ $ "incr-" <> sn ]
        ]
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , mydyn 0
    ]

-- why intercalate with mempty? why not!
isAMonoid :: Nut
isAMonoid = intercalate mempty $ map text_ [ "m", "o", "n", "o", "i", "d" ]

sendsToPosition :: Nut
sendsToPosition = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith [ 0, 1, 2, 3, 4 ] empty
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ id_ "pos", click_ (setPosIdx 1) ]
        [ text_ "send to pos" ]
    ]

sendsToPositionFixed :: Nut
sendsToPositionFixed = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith [ 0, 1, 2, 3, 4 ] empty
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        fixed
          [ D.span [ id_ ("dyn" <> show i <> "a") ]
              [ text_ (show i <> "a") ]
          , D.span [ id_ ("dyn" <> show i <> "a") ]
              [ text_ (show i <> "b") ]
          ]
    , D.button [ id_ "pos", click_ (setPosIdx 1) ]
        [ text_ "send to pos" ]
    ]

insertsAtCorrectPositions :: Nut
insertsAtCorrectPositions = D.div [ id_ "div0" ]
  [ text_ "foo"
  , D.span [ id_ "div1" ] [ text_ "bar" ]
  , Deku.do
      -- if we just used insert_ here, it would go in
      -- linear order
      -- here, we scramble the order and make sure that the dyns
      -- are inserted in the scrambled order so that they read
      -- 0-1-2-3-4 from top to bottom
      { value: i } <- useDyn ((Tuple <*> identity) <$> [ 3, 0, 4, 2, 1 ]) empty
      D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
  ]

switcherWorksForCompositionalElements :: Nut
switcherWorksForCompositionalElements = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> 1 + a) 0 event
  setItem /\ item <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , 0 :| counter item <##~> \i -> fixed
        ( [ 0, 1, 2 ] <#> \j -> D.span [ id_ $ "id" <> show j ]
            [ text_ (show i <> "-" <> show j) ]
        )
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "incr" ]
    ]

tabbedNavigationWithPursx :: Nut
tabbedNavigationWithPursx = Deku.do
  setItem /\ item <- useState 0
  D.div [ id_ "div0" ]
    [ D.div_
        [ D.button [ id_ "home-btn", click_ (setItem 0) ]
            [ text_ "home" ]
        , D.button [ id_ "about-btn", click_ (setItem 1) ]
            [ text_ "about" ]
        , D.button [ id_ "contact-btn", click_ (setItem 2) ]
            [ text_ "contact" ]
        ]
    , item <##~> case _ of
        0 -> (Proxy :: _ "<h1 id=\"home\">home</h1>") ~~ {}
        1 -> (Proxy :: _ "<h1 id=\"about\">about ~me~</h1>") ~~
          { me: text_ "deku" }
        _ -> (Proxy :: _ "<h1 id=\"contact\">contact ~a~ at ~b~ ~c~</h1>") ~~
          { a: D.span_ [ text_ "mike" ]
          , b: text_ "site.com"
          , c: (Proxy :: _ "<h1 id=\"thanks\">thanks</h1>") ~~ {}
          }
    ]

switchersCompose :: Nut
switchersCompose = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) 0 event
  setItem /\ item' <- useState'
  item <- useMemoized (counter item')
  D.div [ id_ "maindiv" ]
    [ D.div [ id_ "div0" ] [ text_ "d0" ]
    , 0 :| item <##~> (_ `mod` 2) >>> case _ of
        0 -> D.div [ id_ "div1a" ] [ text_ "d1a" ]
        _ -> D.div [ id_ "div1b" ] [ text_ "d1b" ]

    , D.div [ id_ "div2" ] [ text_ "d2" ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "click" ]
    ]

portalsCompose :: Nut
portalsCompose = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) 0 event
  setItem /\ item' <- useState'
  item <- useMemoized (counter item')
  portal1 (D.div_ [ text_ "a", D.span_ [ text_ "b" ], text_ "c" ]) \e ->
    do
      let
        switchMe n = 0 :| item <##~> (_ `mod` 3) >>> case _ of
          i
            | i == n -> e
            | otherwise -> mempty

      D.div [ id_ "maindiv" ]
        [ D.div_ [ text_ "d0" ]
        , switchMe 0
        , D.div_ [ text_ "d1" ]
        , switchMe 1
        , D.div_ [ text_ "d2" ]
        , switchMe 2
        , D.button [ id_ "incr", click_ (setItem unit) ]
            [ text_ "incr" ]
        ]

globalPortalsRetainPortalnessWhenSentOutOfScope :: Nut
globalPortalsRetainPortalnessWhenSentOutOfScope = Deku.do
  let
    counter :: forall a. Event a -> Event (Int /\ a)
    counter event = mapAccum (\a b -> (a + 1) /\ ((a + 1) /\ b)) (-1) event

    limitTo :: Int -> Event ~> Event
    limitTo i e = map snd $ filter (\(n /\ _) -> n < i) $ counter e
  setPortalInContext /\ portalInContext <- useState'
  portalInContextRef <- useRef true portalInContext
  setPortedNut /\ portedNut <- useState'
  let noDice = D.div_ [ text_ "no dice!" ]
  D.div_
    [ D.div [ id_ "outer-scope" ]
        [ noDice :|
            limitTo 1
              ( (\tf p -> if not tf then p else noDice) <$> portalInContext <*>
                  portedNut
              )
              <##~> identity
        ]
    , ( globalPortal1 (D.div_ [ text_ "foo" ]) \e ->
          Deku.do
            D.div_
              [ D.button [ id_ "push-ported-nut", click_ (setPortedNut e) ]
                  [ text_ "push ported nut" ]
              , D.div [ id_ "inner-scope" ]
                  [ e :|
                      ( ( \tf p ->
                            if tf then p else noDice
                        ) <$> portalInContext <*> portedNut
                      )
                        <##~> identity
                  ]
              ]
      )
    , D.button
        [ id_ "portal-btn"
        , click_ do
            portalInContextRef <#> not >>= setPortalInContext
        ]

        [ text_ "switch" ]
    ]

localPortalsLosePortalnessWhenSentOutOfScope :: Nut
localPortalsLosePortalnessWhenSentOutOfScope = Deku.do
  let
    counter :: forall a. Event a -> Event (Int /\ a)
    counter event = mapAccum (\a b -> (a + 1) /\ ((a + 1) /\ b)) (-1) event

    limitTo :: Int -> Event ~> Event
    limitTo i e = map snd $ filter (\(n /\ _) -> n < i) $ counter e
  setPortalInContext /\ portalInContext <- useState'
  setPortedNut /\ portedNut <- useState'
  portalInContextRef <- useRef true portalInContext
  let noDice = D.div_ [ text_ "no dice!" ]
  D.div_
    [ D.div [ id_ "outer-scope" ]
        [ noDice :|
            limitTo 1
              ( (\tf p -> if not tf then p else noDice) <$> portalInContext <*>
                  portedNut
              )
              <##~> identity
        ]
    , portal1 (D.div_ [ text_ "foo" ]) \e ->
        Deku.do
          D.div_
            [ D.button [ id_ "push-ported-nut", click_ (setPortedNut e) ]
                [ text_ "push ported nut" ]
            , D.div [ id_ "inner-scope" ]
                [ e :|
                    ( ( \tf p ->
                          if tf then p else noDice
                      ) <$> portalInContext <*> portedNut
                    )
                      <##~> identity
                ]
            ]
    , D.button
        [ id_ "portal-btn"
        , click_ do portalInContextRef <#> not >>= setPortalInContext
        ]
        [ text_ "switch" ]
    ]

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div [ id_ "div0" ]
    [ (Proxy :: _ "<h1 id=\"px\">début ~me~ fin</h1>") ~~
        { me: fixed [ text_ "milieu", text_ " ", text_ "après-milieu" ] }
    ]

switcherSwitches :: Nut
switcherSwitches = Deku.do
  setItem /\ item <- useState'
  setGoodbyeC /\ goodbyeC <- useState'
  iref <- useRef (-1) item
  let
    gc = do
      i <- iref
      when (i == 2) do
        setGoodbyeC (Just unit)
  D.div [ id_ "div0" ]
    [ D.div_
        [ D.button [ id_ "home-btn", click_ $ gc *> setItem 0 ]
            [ text_ "home" ]
        , D.button [ id_ "about-btn", click_ $ gc *> setItem 1 ]
            [ text_ "about" ]
        , D.button [ id_ "contact-btn", click_ $ gc *> setItem 2 ]
            [ text_ "contact" ]
        ]
    , D.span [ D.Id !:= "hack" ]
        [ text $ merge
            [ filter (_ == 1) item $> "hello", compact goodbyeC $> "goodbye" ]
        ]
    , 0 :| item <##~> case _ of
        0 -> D.span_ [ text_ "a" ]
        1 -> D.span_ [ text_ "b" ]
        _ -> D.span_ [ text_ "c" ]
    ]

unsetUnsets :: Nut
unsetUnsets = Deku.do
  let initialAtt = "color:red;"
  setAttIsPresent /\ attIsPresent <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span
        [ id_ "span1"
        , style' initialAtt (filter identity attIsPresent $> initialAtt)
        , style (filter not attIsPresent $> unit)
        ]
        [ text_ "bar" ]
    , D.button [ id_ "unsetter", click_ (setAttIsPresent false) ]
        [ text_ "unset" ]
    ]

emptyTextIsSet :: Nut
emptyTextIsSet = text empty

useRefWorks :: Nut
useRefWorks = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState'
  cref <- useRef startsAt counter
  D.div_
    [ D.button
        [ click_ do
            cref <#> add 1 >>= setCounter
        , id_ "counter"
        ]

        [ text_ "Increment" ]
    , D.div_
        ( 0 .. 9 <#> \i -> Deku.do
            setButtonTxt /\ buttonTxt <- useState'
            D.button
              [ click_ $ cref >>= setButtonTxt
              , id_ $ "b" <> show i
              ]

              [ text (show <$> buttonTxt) ]
        )
    ]

useEffectWorks :: Nut
useEffectWorks = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState'
  let counter' = counter <#> \i -> if i `mod` 4 == 1 then i + 1 else i
  cref <- useRef startsAt counter'
  D.div_
    [ D.button
        [ click_ do
            cref <#> add 1 >>= setCounter
        , id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ id_ "mydiv" ] [ text' (show <$> (startsAt :| counter')) ]
    ]

customHooksDoTheirThing :: Nut
customHooksDoTheirThing = Deku.do
  let initialCount = 0
  setCounter /\ counter <- useState'
  cref <- useRef initialCount counter
  e1' /\ e2' <- myHook (#) identity initialCount
  e1 /\ e2 <- myHook useMemoized map counter
  D.div_
    [ D.button
        [ click_ $ cref <#> add 1 >>= setCounter
        , id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ id_ "mydiv1" ] [ textShow' (e1' :| e1) ]
    , D.div [ id_ "mydiv2" ] [ textShow' (e2' :| e2) ]
    ]
  where
  myHook
    :: forall e o i c
     . (i -> (c -> o) -> o)
    -> ((Int -> Int) -> e -> i)
    -> e
    -> (Tuple c c -> o)
    -> o
  myHook f1 f2 e makeHook = Deku.do
    e1 <- f1 (f2 (add 42) e)
    e2 <- f1 (f2 (add 48) e)
    makeHook (Tuple e1 e2)
