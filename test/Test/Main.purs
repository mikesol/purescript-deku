module Test.Main where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Plus (empty)
import Data.Array ((..))
import Data.Filterable (filter)
import Data.Foldable (intercalate, oneOfMap)
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attribute ((:=))
import Deku.Attributes (id_)
import Deku.Control (globalPortal1, portal1, text, text_)
import Deku.Core (Hook, Nut, fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useDyn, useDynAtBeginning, useDynAtEnd, useEffect, useMemoized, useRef, useState, useState', (<#~>))
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Listeners (click, click_)
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate', runInBody', runSSR)
import Effect (Effect)
import FRP.Event (fold, mapAccum)
import FRP.Poll (Poll)
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

twoElements :: Nut
twoElements = Deku.do
  D.div [ id_ "maindiv" ] [ D.div_ [ text_ "hello" ], D.div_ [ text_ "world" ] ]

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
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtBeginning (counter item)
        D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "incr" ]
    ]

dynAppearsCorrectlyAtEnd :: Nut
dynAppearsCorrectlyAtEnd = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtEnd (counter item)
        D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "incr" ]
    ]

deeplyNestedPreservesOrder :: Nut
deeplyNestedPreservesOrder = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  let
    mydyn n = do
      let sn = show n
      fixed
        [ Deku.do
            { value: i } <- useDynAtEnd (counter item)
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
        { value: i, sendTo } <- useDynAtEnd (oneOfMap pure [ 0, 1, 2, 3, 4 ])
        useEffect (if i == 3 then (sendTo <$> posIdx) else empty)
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
        { value: i, sendTo } <- useDynAtEnd (oneOfMap pure [ 0, 1, 2, 3, 4 ])
        useEffect (if i == 3 then sendTo <$> posIdx else empty)
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
      { value: i } <- useDyn
        ((Tuple <*> identity) <$> oneOfMap pure [ 3, 0, 4, 2, 1 ])
      D.span [ id_ ("dyn" <> show i) ] [ text_ (show i) ]
  ]

switcherWorksForCompositionalElements :: Nut
switcherWorksForCompositionalElements = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> 1 + a) (-1) event
  setItem /\ item <- useState unit
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span [ id_ "div1" ] [ text_ "bar" ]
    , counter item <#~> \i -> fixed
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
    , item <#~> case _ of
        0 -> (Proxy :: _ "<h1 id=\"home\">home</h1>") ~~ {}
        1 -> (Proxy :: _ "<h1 id=\"about\">about ~me~</h1>") ~~
          { me: text_ "deku" }
        _ -> (Proxy :: _ "<h1 id=\"contact\">contact ~a~ at ~b~ ~c~</h1>") ~~
          { a: D.span_ [ text_ "mike" ]
          , b: text_ "site.com"
          , c: (Proxy :: _ "<h1 id=\"thanks\">thanks</h1>") ~~ {}
          }
    ]

portalsCompose :: Nut
portalsCompose = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState unit
  globalPortal1 (D.div_ [ text_ "a", D.span_ [ text_ "b" ], text_ "c" ]) \e ->
    do
      let
        switchMe n = guard (counter item <#> (_ `mod` 3) >>> eq n) e
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
    counter :: forall a. Poll a -> Poll (Int /\ a)
    counter event = mapAccum (\a b -> (a + 1) /\ ((a + 1) /\ b)) (-1) event

    limitTo :: Int -> Poll ~> Poll
    limitTo i e = map snd $ filter (\(n /\ _) -> n < i) $ counter e
  setPortalInContext /\ portalInContext <- useState true
  setPortedNut /\ portedNut <- useState'
  D.div_
    [ D.div [ id_ "outer-scope" ]
        [ limitTo 2 (Tuple <$> portalInContext <*> portedNut)
            <#~> \(Tuple tf p) ->
              if not tf then p else D.div_ [ text_ "no dice!" ]
        ]
    , ( globalPortal1 (D.div_ [ text_ "foo" ]) \e ->
          Deku.do
            useEffect (pure (setPortedNut e))
            D.div [ id_ "inner-scope" ]
              [ (Tuple <$> portalInContext <*> portedNut)
                  <#~> \(Tuple tf p) ->
                    if tf then p else D.div_ [ text_ "no dice!" ]
              ]
      )
    , D.button
        [ id_ "portal-btn"
        , click $ portalInContext <#> not >>> setPortalInContext
        ]

        [ text_ "switch" ]
    ]

localPortalsLosePortalnessWhenSentOutOfScope :: Nut
localPortalsLosePortalnessWhenSentOutOfScope = Deku.do
  let
    counter :: forall a. Poll a -> Poll (Int /\ a)
    counter event = mapAccum (\a b -> (a + 1) /\ ((a + 1) /\ b)) (-1) event

    limitTo :: Int -> Poll ~> Poll
    limitTo i e = map snd $ filter (\(n /\ _) -> n < i) $ counter e
  setPortalInContext /\ portalInContext <- useState true
  setPortedNut /\ portedNut <- useState'
  D.div_
    [ D.div [ id_ "outer-scope" ]
        [ limitTo 2 (Tuple <$> portalInContext <*> portedNut)
            <#~> \(Tuple tf p) ->
              if not tf then p else D.div_ [ text_ "no dice!" ]
        ]
    , portal1 (D.div_ [ text_ "foo" ]) \e ->
        Deku.do
          useEffect (pure (setPortedNut e))
          D.div [ id_ "inner-scope" ]
            [ (Tuple <$> portalInContext <*> portedNut)
                <#~> \(Tuple tf p) ->
                  if tf then p else D.div_ [ text_ "no dice!" ]
            ]
    , D.button
        [ id_ "portal-btn"
        , click $ portalInContext <#> not >>> setPortalInContext
        ]
        [ text_ "switch" ]
    ]

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div [ id_ "div0" ]
    [ (Proxy :: _ "<h1 id=\"px\">début ~me~ fin</h1>") ~~
        { me: fixed [ text_ "milieu", text_ " ", text_ "après-milieu" ] }
    ]

switchersCompose :: Nut
switchersCompose = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState unit
  D.div [ id_ "maindiv" ]
    [ D.div [ id_ "div0" ] [ text_ "d0" ]
    , counter item <#~> (_ `mod` 2) >>> case _ of
        0 -> D.div [ id_ "div1a" ] [ text_ "d1a" ]
        _ -> D.div [ id_ "div1b" ] [ text_ "d1b" ]
    , D.div [ id_ "div2" ] [ text_ "d2" ]
    , D.button [ id_ "incr", click_ (setItem unit) ] [ text_ "click" ]
    ]

-- lifecycle :: Nut
-- lifecycle = Deku.do
--   setItem /\ item <- useState 0
--   D.div [ id_ "div0" ]
--     [ D.div_
--         [ D.button [ id_ "home-btn", click_ (setItem 0) ]
--             [ text_ "home" ]
--         , D.button [ id_ "about-btn", click_ (setItem 1) ]
--             [ text_ "about" ]
--         , D.button [ id_ "contact-btn", click_ (setItem 2) ]
--             [ text_ "contact" ]
--         ]
--     , D.span [ D.Id !:= "hack" ] []
--     , item <#~> case _ of
--         0 -> D.span_ [ text_ "a" ]
--         1 -> onWillMount (hackyInnerHTML "hack" "hello") $ D.span_ [ text_ "b" ]
--         _ -> onDismount (hackyInnerHTML "hack" "goodbye") $ D.span_
--           [ text_ "c" ]
--     ]

-- lifecycleWillAndDidMount :: Nut
-- lifecycleWillAndDidMount = D.div_
--   [ Deku.do
--       setInt /\ int <- useState'
--       onWillMount (setInt 42) (D.span [ id_ "span1" ] [ text (show <$> int) ])
--   , Deku.do
--       setInt /\ int <- useState'
--       onDidMount (setInt 42) (D.span [ id_ "span2" ] [ text (show <$> int) ])
--   ]

unsetUnsets :: Nut
unsetUnsets = Deku.do
  unsetAttr /\ unset <- useState true
  D.div [ id_ "div0" ]
    [ text_ "foo"
    , D.span
        [ id_ "span1"
        , unset <#> if _ then D.Style := "color:red;" else D.Style := unit
        ]
        [ text_ "bar" ]
    , D.button [ id_ "unsetter", click_ (unsetAttr false) ]
        [ text_ "unset" ]
    ]

emptyTextIsSet :: Nut
emptyTextIsSet = text (empty :: Poll String)

useRefWorks :: Nut
useRefWorks = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState startsAt
  cref <- useRef startsAt counter
  D.div_
    [ D.button
        [ click $ counter <#> add 1 >>> setCounter
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
  setCounter /\ counter <- useState startsAt
  let filt i = i `mod` 4 == 1
  useEffect $ filter filt counter <#> setCounter <<< add 1
  D.div_
    [ D.button
        [ click $ counter <#> add 1 >>> setCounter
        , id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ id_ "mydiv" ] [ text (show <$> counter) ]
    ]

customHooksDoTheirThing :: Nut
customHooksDoTheirThing = Deku.do
  setCounter /\ counter <- useState 0
  e1 /\ e2 <- myHook counter
  D.div_
    [ D.button
        [ click $ counter <#> add 1 >>> setCounter
        , id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ id_ "mydiv1" ] [ text (show <$> e1) ]
    , D.div [ id_ "mydiv2" ] [ text (show <$> e2) ]
    ]
  where
  myHook :: Poll Int -> Hook (Tuple (Poll Int) (Poll Int))
  myHook e makeHook = Deku.do
    e1 <- useMemoized (add 42 <$> e)
    e2 <- useMemoized (add 48 <$> e)
    makeHook (Tuple e1 e2)

memoizedSwitcher :: Nut
memoizedSwitcher = Deku.do
  _ /\ e <- useState "world"
  x <- useMemoized e
  D.div [ id_ "maindiv" ] [ text x ]

simpleSwitcher :: Nut
simpleSwitcher = Deku.do
  setSwitch /\ switch <- useState true
  D.div [ id_ "external" ]
    [ switch <#~>
        if _ then D.span [ id_ "innertrue" ] [ text_ "trueswitch" ]
        else D.span [ id_ "innerfalse" ] [ text_ "falseswitch" ]
    , D.button [ id_ "doswitch", click $ switch <#> not >>> setSwitch ]
        [ text_ "set switch" ]
    ]

pureWorks :: Nut
pureWorks = Deku.do
  D.span [ id_ "hello" ] [ text $ pure "hello" ]

useStateWorks :: Nut
useStateWorks = Deku.do
  p /\ e <- useState "hello"
  D.div_
    [ D.span [ id_ "maindiv" ] [ text e ]
    , D.button [ id_ "button", click_ $ p "world" ] [ text_ "Switch" ]
    ]

useMemoizedWorks :: Nut
useMemoizedWorks = Deku.do
  p /\ e <- useState "hello"
  x <- useMemoized e
  D.div_
    [ D.span [ id_ "maindiv" ] [ text x ]
    , D.button [ id_ "button", click_ $ p "world" ] [ text_ "Switch" ]
    ]

useEffectWorksWithRef :: Nut
useEffectWorksWithRef = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState startsAt
  let counter' = counter <#> \i -> if i `mod` 4 == 1 then i + 1 else i
  cref <- useRef startsAt counter'
  D.div_
    [ D.button
        [ click_ do
            cref <#> add 1 >>= setCounter
        , id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ id_ "mydiv" ]
        [ text (map show counter') ]
    ]