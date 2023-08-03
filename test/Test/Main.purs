module Test.Main where

import Prelude

import Control.Alternative as Alt
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Plus (empty)
import Data.Array ((..))
import Data.Filterable (compact, filter)
import Data.Foldable (intercalate)
import Data.Functor (voidRight)
import Data.Maybe (Maybe(..))
import Data.NonEmpty (tail, (:|))
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute ((:=))
import Deku.Attributes (id, style)
import Deku.Control (globalPortal1, portal1, text)
import Deku.Core (Nut, fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (dynOptions, guard, guardWith, useDyn, useDynAtBeginning_, useDynAtEndWith, useDynAtEnd_, useEffect, useHot, useMemoized, useRef, useRefNE, useState, useState', (<#~>))
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Listeners (click)
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate', runInBody', runSSR)
import Effect (Effect)
import FRP.Behavior (behavior, sampleBy)
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
sanityCheck = D.span [ id "hello" ] [ text "Hello" ]

elementsInCorrectOrder :: Nut
elementsInCorrectOrder = do
  let
    l n
      | n == 10 = []
      | otherwise =
          [ do
              let x = "span" <> show n <> "-0"
              D.span [ id x ] [ text (x <> "A") ]
          , do
              let x = "span" <> show n <> "-1"
              D.span [ id x ] [ text (x <> "B") ]
          , do
              let x = "div" <> show n <> "-2"
              D.span [ id x ] (l (n + 1))
          , do
              let x = "span" <> show n <> "-3"
              D.span [ id x ] [ text (x <> "D") ]
          ]
  D.div [ id "div0-0" ] (l 1)

dynAppearsCorrectlyAtBeginning :: Nut
dynAppearsCorrectlyAtBeginning = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , Deku.do
        { value: i } <- useDynAtBeginning_ (counter item)
        D.span [ id ("dyn" <> show i) ] [ text (show i) ]
    , D.button [ id "incr", click (setItem unit) ] [ text "incr" ]
    ]

dynAppearsCorrectlyAtEnd :: Nut
dynAppearsCorrectlyAtEnd = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , Deku.do
        { value: i } <- useDynAtEnd_ (counter item)
        D.span [ id ("dyn" <> show i) ] [ text (show i) ]
    , D.button [ id "incr", click (setItem unit) ] [ text "incr" ]
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
            else D.span [ id ("dyn" <> sn <> "-" <> show i) ]
              [ text (sn <> "-" <> show i) ]
        , D.button [ id $ "incr-" <> sn, click (setItem unit) ]
            [ text $ "incr-" <> sn ]
        ]
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , mydyn 0
    ]

-- why intercalate with mempty? why not!
isAMonoid :: Nut
isAMonoid = intercalate mempty $ map text [ "m", "o", "n", "o", "i", "d" ]

sendsToPosition :: Nut
sendsToPosition = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith (map pure [ 0, 1, 2, 3, 4 ]) empty
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        D.span [ id ("dyn" <> show i) ] [ text (show i) ]
    , D.button [ id "pos", click (setPosIdx 1) ]
        [ text "send to pos" ]
    ]

sendsToPositionFixed :: Nut
sendsToPositionFixed = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith (map pure [ 0, 1, 2, 3, 4 ]) empty
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        fixed
          [ D.span [ id ("dyn" <> show i <> "a") ]
              [ text (show i <> "a") ]
          , D.span [ id ("dyn" <> show i <> "a") ]
              [ text (show i <> "b") ]
          ]
    , D.button [ id "pos", click (setPosIdx 1) ]
        [ text "send to pos" ]
    ]

insertsAtCorrectPositions :: Nut
insertsAtCorrectPositions = D.div [ id "div0" ]
  [ text "foo"
  , D.span [ id "div1" ] [ text "bar" ]
  , Deku.do
      -- if we just used insert_ here, it would go in
      -- linear order
      -- here, we scramble the order and make sure that the dyns
      -- are inserted in the scrambled order so that they read
      -- 0-1-2-3-4 from top to bottom
      { value: i } <- useDyn ((\i -> Tuple i (pure i)) <$> [ 3, 0, 4, 2, 1 ])
        empty
      D.span [ id ("dyn" <> show i) ] [ text (show i) ]
  ]

switcherWorksForCompositionalElements :: Nut
switcherWorksForCompositionalElements = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> 1 + a) 0 event
  setItem /\ item <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span [ id "div1" ] [ text "bar" ]
    , 0 :| counter item <#~> \i -> fixed
        ( [ 0, 1, 2 ] <#> \j -> D.span [ id $ "id" <> show j ]
            [ text (show i <> "-" <> show j) ]
        )
    , D.button [ id "incr", click (setItem unit) ] [ text "incr" ]
    ]

tabbedNavigationWithPursx :: Nut
tabbedNavigationWithPursx = Deku.do
  setItem /\ item <- useState 0
  D.div [ id "div0" ]
    [ D.div_
        [ D.button [ id "home-btn", click (setItem 0) ]
            [ text "home" ]
        , D.button [ id "about-btn", click (setItem 1) ]
            [ text "about" ]
        , D.button [ id "contact-btn", click (setItem 2) ]
            [ text "contact" ]
        ]
    , item <#~> case _ of
        0 -> (Proxy :: _ "<h1 id=\"home\">home</h1>") ~~ {}
        1 -> (Proxy :: _ "<h1 id=\"about\">about ~me~</h1>") ~~
          { me: text "deku" }
        _ -> (Proxy :: _ "<h1 id=\"contact\">contact ~a~ at ~b~ ~c~</h1>") ~~
          { a: D.span_ [ text "mike" ]
          , b: text "site.com"
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
  D.div [ id "maindiv" ]
    [ D.div [ id "div0" ] [ text "d0" ]
    , 0 :| item <#~> (_ `mod` 2) >>> case _ of
        0 -> D.div [ id "div1a" ] [ text "d1a" ]
        _ -> D.div [ id "div1b" ] [ text "d1b" ]

    , D.div [ id "div2" ] [ text "d2" ]
    , D.button [ id "incr", click (setItem unit) ] [ text "click" ]
    ]

portalsCompose :: Nut
portalsCompose = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (\a _ -> a + 1) 0 event
  setItem /\ item' <- useState'
  item <- useMemoized (counter item')
  portal1 (D.div_ [ text "a", D.span_ [ text "b" ], text "c" ]) \e ->
    do
      let
        switchMe n = 0 :| item <#~> (_ `mod` 3) >>> case _ of
          i
            | i == n -> e
            | otherwise -> mempty

      D.div [ id "maindiv" ]
        [ D.div_ [ text "d0" ]
        , switchMe 0
        , D.div_ [ text "d1" ]
        , switchMe 1
        , D.div_ [ text "d2" ]
        , switchMe 2
        , D.button [ id "incr", click (setItem unit) ]
            [ text "incr" ]
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
  let noDice = D.div_ [ text "no dice!" ]
  D.div_
    [ D.div [ id "outer-scope" ]
        [ noDice :|
            limitTo 1
              ( (\tf p -> if not tf then p else noDice) <$> portalInContext <*>
                  portedNut
              )
              <#~> identity
        ]
    , ( globalPortal1 (D.div_ [ text "foo" ]) \e ->
          Deku.do
            D.div_
              [ D.button [ id "push-ported-nut", click (setPortedNut e) ]
                  [ text "push ported nut" ]
              , D.div [ id "inner-scope" ]
                  [ e :|
                      ( ( \tf p ->
                            if tf then p else noDice
                        ) <$> portalInContext <*> portedNut
                      )
                        <#~> identity
                  ]
              ]
      )
    , D.button
        [ id "portal-btn"
        , click do
            portalInContextRef <#> not >>= setPortalInContext
        ]

        [ text "switch" ]
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
  let noDice = D.div_ [ text "no dice!" ]
  D.div_
    [ D.div [ id "outer-scope" ]
        [ noDice :|
            limitTo 1
              ( (\tf p -> if not tf then p else noDice) <$> portalInContext <*>
                  portedNut
              )
              <#~> identity
        ]
    , portal1 (D.div_ [ text "foo" ]) \e ->
        Deku.do
          D.div_
            [ D.button [ id "push-ported-nut", click (setPortedNut e) ]
                [ text "push ported nut" ]
            , D.div [ id "inner-scope" ]
                [ e :|
                    ( ( \tf p ->
                          if tf then p else noDice
                      ) <$> portalInContext <*> portedNut
                    )
                      <#~> identity
                ]
            ]
    , D.button
        [ id "portal-btn"
        , click do portalInContextRef <#> not >>= setPortalInContext
        ]
        [ text "switch" ]
    ]

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div [ id "div0" ]
    [ (Proxy :: _ "<h1 id=\"px\">début ~me~ fin</h1>") ~~
        { me: fixed [ text "milieu", text " ", text "après-milieu" ] }
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
  D.div [ id "div0" ]
    [ D.div_
        [ D.button [ id "home-btn", click $ gc *> setItem 0 ]
            [ text "home" ]
        , D.button [ id "about-btn", click $ gc *> setItem 1 ]
            [ text "about" ]
        , D.button [ id "contact-btn", click $ gc *> setItem 2 ]
            [ text "contact" ]
        ]
    , D.span [ D.Id := "hack" ]
        [ text $ merge
            [ filter (_ == 1) item $> "hello", compact goodbyeC $> "goodbye" ]
        ]
    , 0 :| item <#~> case _ of
        0 -> D.span_ [ text "a" ]
        1 -> D.span_ [ text "b" ]
        _ -> D.span_ [ text "c" ]
    ]

unsetUnsets :: Nut
unsetUnsets = Deku.do
  let initialAtt = "color:red;"
  setAttIsPresent /\ attIsPresent <- useState'
  D.div [ id "div0" ]
    [ text "foo"
    , D.span
        [ id "span1"
        , style (initialAtt :| (filter identity attIsPresent $> initialAtt))
        , style (filter not attIsPresent $> unit)
        ]
        [ text "bar" ]
    , D.button [ id "unsetter", click (setAttIsPresent false) ]
        [ text "unset" ]
    ]

emptyTextIsSet :: Nut
emptyTextIsSet = text (empty :: Event String)

useEffectWorks :: Nut
useEffectWorks = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState startsAt
  let filt i = i `mod` 4 == 1
  useEffect $ filter filt (tail counter) <#> setCounter <<< add 1
  D.div_
    [ D.button
        [ click $ counter <#> add 1 >>> setCounter
        , id "counter"
        ]
        [ text "Increment" ]
    , D.div [ id "mydiv" ] [ text (show <$> counter) ]
    ]

refToHot :: Nut
refToHot = Deku.do
  setLabel /\ label <- useState "foo"
  cref <- useRefNE label
  let
    nest f n = Deku.do
      setReveal /\ reveal <- useState'
      D.div_
        [ D.button [ id $ ("button" <> show n), click $ setReveal true ]
            [ text "reveal" ]
        , guard reveal $ f (n + 1)
        ]
    elt n = Deku.do
      setReveal /\ reveal <- useState'
      D.div_
        [ D.button [ id $ ("button" <> show n), click $ setReveal true ]
            [ text "reveal" ]
        , D.span [ id "myspan" ]
            [ guardWith
                ( sampleBy voidRight (behavior $ pure $ Tuple mempty cref)
                    (Alt.guard <$> reveal)
                )
                text
            ]
        ]
  D.div_
    [ nest (nest (nest (nest (nest (nest elt))))) 0
    , D.button [ id "setlabel", click $ setLabel "bar" ] [ text "set label" ]
    ]

useHotWorks :: Nut
useHotWorks = Deku.do
  setLabel /\ label <- useHot "foo"
  let
    nest f n = Deku.do
      setReveal /\ reveal <- useState'
      D.div_
        [ D.button [ id $ ("button" <> show n), click $ setReveal true ]
            [ text "reveal" ]
        , guard reveal $ f (n + 1)
        ]
    elt n = Deku.do
      setReveal /\ reveal <- useState'
      D.div_
        [ D.button [ id $ ("button" <> show n), click $ setReveal true ]
            [ text "reveal" ]
        , D.span [ id "myspan" ]
            [ guard reveal $ text label
            ]
        ]
  D.div_
    [ nest (nest (nest (nest (nest (nest elt))))) 0
    , D.button [ id "setlabel", click $ setLabel "bar" ] [ text "set label" ]
    ]

useRefWorks :: Nut
useRefWorks = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState'
  cref <- useRef startsAt counter
  D.div_
    [ D.button
        [ click do
            cref <#> add 1 >>= setCounter
        , id "counter"
        ]

        [ text "Increment" ]
    , D.div_
        ( 0 .. 9 <#> \i -> Deku.do
            setButtonTxt /\ buttonTxt <- useState'
            D.button
              [ click $ cref >>= setButtonTxt
              , id $ "b" <> show i
              ]

              [ text (show <$> buttonTxt) ]
        )
    ]

useEffectWorksWithRef :: Nut
useEffectWorksWithRef = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState'
  let counter' = counter <#> \i -> if i `mod` 4 == 1 then i + 1 else i
  cref <- useRef startsAt counter'
  D.div_
    [ D.button
        [ click do
            cref <#> add 1 >>= setCounter
        , id "counter"
        ]
        [ text "Increment" ]
    , D.div [ id "mydiv" ] [ text (show <$> (startsAt :| counter')) ]
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
        [ click $ cref <#> add 1 >>= setCounter
        , id "counter"
        ]
        [ text "Increment" ]
    , D.div [ id "mydiv1" ] [ text $ show <$> (e1' :| e1) ]
    , D.div [ id "mydiv2" ] [ text $ show <$> (e2' :| e2) ]
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
