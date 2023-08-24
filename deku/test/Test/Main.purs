module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Plus (empty)
import Data.Array (replicate, (!!), (..))
import Data.Array as Array
import Data.Filterable (compact, filter)
import Data.Foldable (intercalate, for_, traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Control (globalPortal1, portal1, text, text_)
import Deku.Core (Hook, Nut, fixed)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Combinators (injectElementT)
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (dynOptions, guard, guardWith, useDyn, useDynWith, useDynAtBeginning, useDynAtEnd, useDynAtEndWith, useHot, useHotRant, useRant, useRef, useState, useState', (<#~>))
import Deku.Hooks as DH
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate', runInBody', runSSR)
import Effect (Effect)
import Effect.Random (random, randomInt)
import FRP.Event (fold, mapAccum, folded, keepLatest, makeEvent, subscribe)
import FRP.Poll (Poll, poll, effectToPoll, merge, mergeMap)
import Record (union)
import Type.Proxy (Proxy(..))
import Web.HTML (window)
import Web.HTML.HTMLInputElement as InputElement
import Web.HTML.Window (alert)

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
sanityCheck = D.span [ DA.id_ "hello" ] [ text_ "Hello" ]

twoElements :: Nut
twoElements = Deku.do
  D.div [ DA.id_ "maindiv" ]
    [ D.div_ [ text_ "hello" ], D.div_ [ text_ "world" ] ]

elementsInCorrectOrder :: Nut
elementsInCorrectOrder = do
  let
    l n
      | n == 10 = []
      | otherwise =
          [ do
              let x = "span" <> show n <> "-0"
              D.span [ DA.id_ x ] [ text_ (x <> "A") ]
          , do
              let x = "span" <> show n <> "-1"
              D.span [ DA.id_ x ] [ text_ (x <> "B") ]
          , do
              let x = "div" <> show n <> "-2"
              D.span [ DA.id_ x ] (l (n + 1))
          , do
              let x = "span" <> show n <> "-3"
              D.span [ DA.id_ x ] [ text_ (x <> "D") ]
          ]
  D.div [ DA.id_ "div0-0" ] (l 1)

dynAppearsCorrectlyAtBeginning :: Nut
dynAppearsCorrectlyAtBeginning = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtBeginning (counter item)
        D.span [ DA.id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ DA.id_ "incr", DL.click_ \_ -> setItem unit ] [ text_ "incr" ]
    ]

dynAppearsCorrectlyAtEnd :: Nut
dynAppearsCorrectlyAtEnd = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState'
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <- useDynAtEnd (counter item)
        D.span [ DA.id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ DA.id_ "incr", DL.click_ \_ -> setItem unit ] [ text_ "incr" ]
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
            else D.span [ DA.id_ ("dyn" <> sn <> "-" <> show i) ]
              [ text_ (sn <> "-" <> show i) ]
        , D.button [ DA.id_ $ "incr-" <> sn, DL.click_ \_ -> setItem unit ]
            [ text_ $ "incr-" <> sn ]
        ]
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , mydyn 0
    ]

-- why intercalate with mempty? why not!
isAMonoid :: Nut
isAMonoid = intercalate mempty $ map text_ [ "m", "o", "n", "o", "i", "d" ]

sendsToPosition :: Nut
sendsToPosition = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith (mergeMap pure [ 0, 1, 2, 3, 4 ])
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        D.span [ DA.id_ ("dyn" <> show i) ] [ text_ (show i) ]
    , D.button [ DA.id_ "pos", DL.click_ \_ -> setPosIdx 1 ]
        [ text_ "send to pos" ]
    ]

sendsToPositionFixed :: Nut
sendsToPositionFixed = Deku.do
  setPosIdx /\ posIdx <- useState'
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , Deku.do
        { value: i } <-
          useDynAtEndWith (mergeMap pure [ 0, 1, 2, 3, 4 ])
            $ dynOptions { sendTo = \i -> if i == 3 then posIdx else empty }
        fixed
          [ D.span [ DA.id_ ("dyn" <> show i <> "a") ]
              [ text_ (show i <> "a") ]
          , D.span [ DA.id_ ("dyn" <> show i <> "a") ]
              [ text_ (show i <> "b") ]
          ]
    , D.button [ DA.id_ "pos", DL.click_ \_ -> setPosIdx 1 ]
        [ text_ "send to pos" ]
    ]

insertsAtCorrectPositions :: Nut
insertsAtCorrectPositions = D.div [ DA.id_ "div0" ]
  [ text_ "foo"
  , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
  , Deku.do
      -- if we just used insert_ here, it would go in
      -- linear order
      -- here, we scramble the order and make sure that the dyns
      -- are inserted in the scrambled order so that they read
      -- 0-1-2-3-4 from top to bottom
      { value: i } <- useDyn
        ((Tuple <*> identity) <$> mergeMap pure [ 3, 0, 4, 2, 1 ])
      D.span [ DA.id_ ("dyn" <> show i) ] [ text_ (show i) ]
  ]

switcherWorksForCompositionalElements :: Nut
switcherWorksForCompositionalElements = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> 1 + a) (-1) event
  setItem /\ item <- useState unit
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span [ DA.id_ "div1" ] [ text_ "bar" ]
    , counter item <#~> \i -> fixed
        ( [ 0, 1, 2 ] <#> \j -> D.span [ DA.id_ $ "id" <> show j ]
            [ text_ (show i <> "-" <> show j) ]
        )
    , D.button [ DA.id_ "incr", DL.click_ \_ -> setItem unit ] [ text_ "incr" ]
    ]

tabbedNavigationWithPursx :: Nut
tabbedNavigationWithPursx = Deku.do
  setItem /\ item <- useState 0
  D.div [ DA.id_ "div0" ]
    [ D.div_
        [ D.button [ DA.id_ "home-btn", DL.click_ \_ -> setItem 0 ]
            [ text_ "home" ]
        , D.button [ DA.id_ "about-btn", DL.click_ \_ -> setItem 1 ]
            [ text_ "about" ]
        , D.button [ DA.id_ "contact-btn", DL.click_ \_ -> setItem 2 ]
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
      D.div [ DA.id_ "maindiv" ]
        [ D.div_ [ text_ "d0" ]
        , switchMe 0
        , D.div_ [ text_ "d1" ]
        , switchMe 1
        , D.div_ [ text_ "d2" ]
        , switchMe 2
        , D.button [ DA.id_ "incr", DL.click_ \_ -> setItem unit ]
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
  D.div [ DA.id_ "test-frame" ]
    [ D.div [ DA.id_ "outer-scope" ]
        [ limitTo 2 (Tuple <$> portalInContext <*> portedNut)
            <#~> \(Tuple tf p) ->
              if not tf then p else D.div_ [ text_ "no dice!" ]
        ]
    , ( globalPortal1 (D.div_ [ text_ "foo" ]) \e ->
          D.div_
            [ D.button
                [ DA.id_ "push-ported-nut", DL.click_ \_ -> setPortedNut e ]
                [ text_ "push ported nut" ]
            , D.div [ DA.id_ "inner-scope" ]
                [ (Tuple <$> portalInContext <*> portedNut)
                    <#~> \(Tuple tf p) ->
                      if tf then p
                      else D.div [ DA.id_ "inner-switch" ] [ text_ "no dice!" ]
                ]
            ]
      )
    , D.button
        [ DA.id_ "portal-btn"
        , DL.click $ portalInContext <#> not >>> setPortalInContext >>> pure
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
    [ D.div [ DA.id_ "outer-scope" ]
        [ limitTo 2 (Tuple <$> portalInContext <*> portedNut)
            <#~> \(Tuple tf p) ->
              if not tf then p else D.div_ [ text_ "no dice!" ]
        ]
    , portal1 (D.div_ [ text_ "foo" ]) \e ->
        D.div_
          [ D.button
              [ DA.id_ "push-ported-nut", DL.click_ \_ -> setPortedNut e ]
              [ text_ "push ported nut" ]
          , D.div [ DA.id_ "inner-scope" ]
              [ (Tuple <$> portalInContext <*> portedNut)
                  <#~> \(Tuple tf p) ->
                    if tf then p else D.div_ [ text_ "no dice!" ]
              ]
          ]
    , D.button
        [ DA.id_ "portal-btn"
        , DL.runOn DL.click $ portalInContext <#> not >>> setPortalInContext
        ]
        [ text_ "switch" ]
    ]

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div [ DA.id_ "div0" ]
    [ (Proxy :: _ "<h1 id=\"px\">début ~me~ fin</h1>") ~~
        { me: fixed [ text_ "milieu", text_ " ", text_ "après-milieu" ] }
    ]

switchersCompose :: Nut
switchersCompose = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState unit
  D.div [ DA.id_ "maindiv" ]
    [ D.div [ DA.id_ "div0" ] [ text_ "d0" ]
    , counter item <#~> (_ `mod` 2) >>> case _ of
        0 -> D.div [ DA.id_ "div1a" ] [ text_ "d1a" ]
        _ -> D.div [ DA.id_ "div1b" ] [ text_ "d1b" ]
    , D.div [ DA.id_ "div2" ] [ text_ "d2" ]
    , D.button [ DA.id_ "incr", DL.click_ \_ -> setItem unit ] [ text_ "click" ]
    ]

todoMVC :: Nut
todoMVC = Deku.do
  setItem /\ item <- useState'
  setInput /\ input <- useState'
  iref <- useRef Nothing (Just <$> input)
  let
    guardAgainstEmpty e = do
      v <- InputElement.value e
      if v == "" then
        window >>= alert "Item cannot be empty"
      else setItem v
    top =
      D.div_
        [ D.input
            [ DA.value_ "Tasko primo"
            , injectElementT setInput
            ]
            []
        , D.button
            [ DA.id_ "add"
            , DL.click_ \_ -> do
                iref >>= traverse_ guardAgainstEmpty
            ]
            [ text_ "Add" ]
        ]
  D.div_
    [ top
    , Deku.do
        { value: Tuple i t } <- useDynAtBeginning (mapWithIndex Tuple item)
        D.div [ DA.id_ $ "item" <> show i ] [ text_ t ]
    ]

unsetUnsets :: Nut
unsetUnsets = Deku.do
  unsetAttr /\ unset <- useState'
  D.div [ DA.id_ "div0" ]
    [ text_ "foo"
    , D.span
        [ DA.id_ "span1"
        , DA.style_ "color:red;"
        , DA.unset DA.style unset
        ]
        [ text_ "bar" ]
    , D.button [ DA.id_ "unsetter", DL.click_ \_ -> unsetAttr unit ]
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
        [ DL.runOn DL.click $ counter <#> add 1 >>> setCounter
        , DA.id_ "counter"
        ]

        [ text_ "Increment" ]
    , D.div_
        ( 0 .. 9 <#> \i -> Deku.do
            setButtonTxt /\ buttonTxt <- useState'
            D.button
              [ DL.click_ \_ -> cref >>= setButtonTxt
              , DA.id_ $ "b" <> show i
              ]

              [ text (show <$> buttonTxt) ]
        )
    ]

customHooksDoTheirThing :: Nut
customHooksDoTheirThing = Deku.do
  setCounter /\ counter <- useState'
  e1 /\ e2 <- myHook counter
  D.div_
    [ D.button
        [ DL.click $ (counter <|> pure 0) <#> add 1 >>> setCounter >>> pure
        , DA.id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ DA.id_ "mydiv1" ] [ text (show <$> e1) ]
    , D.div [ DA.id_ "mydiv2" ] [ text (show <$> e2) ]
    ]
  where
  myHook :: Poll Int -> Hook (Tuple (Poll Int) (Poll Int))
  myHook e makeHook = Deku.do
    e1 <- useRant (add 42 <$> e)
    e2 <- useRant (add 48 <$> e)
    makeHook (Tuple e1 e2)

simpleSwitcher :: Nut
simpleSwitcher = Deku.do
  setSwitch /\ switch <- useState true
  D.div [ DA.id_ "external" ]
    [ switch <#~>
        if _ then D.span [ DA.id_ "innertrue" ] [ text_ "trueswitch" ]
        else D.span [ DA.id_ "innerfalse" ] [ text_ "falseswitch" ]
    , D.button
        [ DA.id_ "doswitch", DL.click $ switch <#> not >>> setSwitch >>> pure ]
        [ text_ "set switch" ]
    ]

pureWorks :: Nut
pureWorks = Deku.do
  D.span [ DA.id_ "hello" ] [ text $ pure "hello" ]

useStateWorks :: Nut
useStateWorks = Deku.do
  p /\ e <- useState "hello"
  D.div_
    [ D.span [ DA.id_ "maindiv" ] [ text e ]
    , D.button [ DA.id_ "button", DL.click_ \_ -> p "world" ] [ text_ "Switch" ]
    ]

useRantWorks :: Nut
useRantWorks = Deku.do
  p /\ e <- useState'
  x <- useRant (fold (\b _ -> b + 1) (-1) e)
  D.div_
    [ D.span [ DA.id_ "maindiv" ] [ text (show <$> x) ]
    , D.span [ DA.id_ "maindiv2" ] [ text (show <$> x) ]
    , D.button [ DA.id_ "button", DL.click_ \_ -> p unit ] [ text_ "Switch" ]
    ]

useEffectCanBeSimulatedWithRef :: Nut
useEffectCanBeSimulatedWithRef = Deku.do
  let startsAt = 0
  setCounter /\ counter <- useState startsAt
  let counter' = counter <#> \i -> if i `mod` 4 == 1 then i + 1 else i
  cref <- useRef startsAt counter'
  D.div_
    [ D.button
        [ DL.click_ \_ -> do
            cref <#> add 1 >>= setCounter
        , DA.id_ "counter"
        ]
        [ text_ "Increment" ]
    , D.div [ DA.id_ "mydiv" ]
        [ text (map show counter') ]
    ]

refToHot :: Nut
refToHot = Deku.do
  setLabel /\ label <- useState'
  cref <- useRef "foo" label
  let
    nest f n = Deku.do
      setReveal /\ reveal <- useState false
      D.div_
        [ D.button
            [ DA.id_ $ ("button" <> show n), DL.click_ \_ -> setReveal true ]
            [ text_ "reveal" ]
        , guard reveal $ f (n + 1)
        ]
    elt n = Deku.do
      setReveal /\ reveal <- useState false
      D.div_
        [ D.button
            [ DA.id_ $ ("button" <> show n), DL.click_ \_ -> setReveal true ]
            [ text_ "reveal" ]
        , D.span [ DA.id_ "myspan" ]
            [ guardWith
                ( (\rr vv -> if rr then Just vv else Nothing) <$> reveal <*>
                    (effectToPoll cref)
                )
                text_
            ]
        ]
  D.div_
    [ nest (nest (nest (nest (nest (nest elt))))) 0
    , D.button [ DA.id_ "setlabel", DL.click_ \_ -> setLabel "bar" ]
        [ text_ "set label" ]
    ]

useHotWorks :: Nut
useHotWorks = Deku.do
  setNumber /\ number <- useHot 0.42
  setPresence /\ presence <- useState false
  D.div_
    [ D.div [ DA.id_ "hotdiv" ]
        [ text $ number <#> show
        ]
    , D.div_
        [ D.button
            [ DA.id_ "ba"
            , DL.click_ \_ -> random >>= setNumber
            ]
            [ text_ "A" ]
        , D.button
            [ DA.id_ "bb"
            , DL.click $ presence <#> not >>> setPresence >>> pure
            ]
            [ text_ "B" ]
        ]
    , D.div [ DA.id_ "newdiv" ]
        [ guard presence
            $ text
            $ number <#> show
        ]
    ]

useStateWorks2 :: Nut
useStateWorks2 = Deku.do
  setNumber /\ number <- useState 0.42
  setPresence /\ presence <- useState false
  D.div_
    [ D.div [ DA.id_ "hotdiv" ]
        [ text $ number <#> show
        ]
    , D.div_
        [ D.button
            [ DA.id_ "ba"
            , DL.click_ \_ -> random >>= setNumber
            ]
            [ text_ "A" ]
        , D.button
            [ DA.id_ "bb"
            , DL.click $ presence <#> not >>> setPresence >>> pure
            ]
            [ text_ "B" ]
        ]
    , D.div [ DA.id_ "newdiv" ]
        [ guard presence
            $ text
            $ number <#> show
        ]
    ]

hotIsHot :: Nut
hotIsHot = Deku.do
  setLabel /\ label <- useHot "bar"
  let
    nest f n = Deku.do
      setReveal /\ reveal <- useState false
      D.div_
        [ D.button
            [ DA.id_ $ ("button" <> show n), DL.click_ \_ -> setReveal true ]
            [ text_ "reveal" ]
        , guard reveal $ f (n + 1)
        ]
    elt n = Deku.do
      setReveal /\ reveal <- useState false
      D.div_
        [ D.button
            [ DA.id_ $ ("button" <> show n), DL.click_ \_ -> setReveal true ]
            [ text_ "reveal" ]
        , D.span [ DA.id_ "myspan" ]
            [ guardWith
                ( (\rr vv -> if rr then Just vv else Nothing) <$> reveal <*>
                    label
                )
                text_
            ]
        ]
  D.div_
    [ nest (nest (nest (nest (nest (nest elt))))) 0
    , D.button [ DA.id_ "setlabel", DL.click_ \_ -> setLabel "bar" ]
        [ text_ "set label" ]
    ]

switcherSwitches :: Nut
switcherSwitches = Deku.do
  setItem /\ item <- useState 0
  setGoodbyeC /\ goodbyeC <- useState'
  iref <- useRef (-1) item
  let
    gc = do
      i <- iref
      when (i == 2) do
        setGoodbyeC (Just unit)
  D.div [ DA.id_ "div0" ]
    [ D.div_
        [ D.button [ DA.id_ "home-btn", DL.click_ \_ -> gc *> setItem 0 ]
            [ text_ "home" ]
        , D.button [ DA.id_ "about-btn", DL.click_ \_ -> gc *> setItem 1 ]
            [ text_ "about" ]
        , D.button [ DA.id_ "contact-btn", DL.click_ \_ -> gc *> setItem 2 ]
            [ text_ "contact" ]
        ]
    , D.span [ DA.id_ "hack" ]
        [ text $ merge
            [ filter (_ == 1) item $> "hello", compact goodbyeC $> "goodbye" ]
        ]
    ]

lotsOfSwitching :: Nut
lotsOfSwitching = Deku.do
  setItem /\ item <- useState true
  D.div_
    [ D.div_
        [ D.button
            [ DA.id_ "home-btn", DL.click $ item <#> not >>> setItem >>> pure ]
            [ text_ "home" ]
        ]
    , D.span [ DA.id_ "hack" ]
        [ item <#~> if _ then text_ "hello" else text_ "goodbye"
        ]
    ]

useHotRantWorks :: Nut
useHotRantWorks = Deku.do
  thunkMe /\ thunked <- useState unit
  setPresence /\ presence <- useState false
  let counter = fold (\a _ -> a + 1) 0 thunked
  ranted <- useHotRant counter
  let
    framed id = D.div [ DA.id_ id ]
      [ text $ show <$> ranted
      ]
  D.div_
    [ D.button
        [ DA.id_ "update"
        , DL.click_ \_ -> thunkMe unit
        ]
        [ text_ "Update number" ]
    , D.button
        [ DA.id_ "reveal"
        , DL.runOn DL.click $ presence <#> not >>> setPresence
        ]
        [ text_ "Show another version" ]
    , framed "da"
    , guard presence $ framed "db"
    ]

-- begin stress test

randomFromArray :: Array String -> Poll String
randomFromArray arr = poll \e -> makeEvent \k ->
  subscribe e \f -> do
    index <- randomInt 0 (alen - 1)
    k $ f $ fromMaybe "foo" (arr !! index)
  where
  alen = Array.length arr

randomAdjectives :: Poll String
randomAdjectives = randomFromArray [ "pretty", "large", "big", "small", "tall", "short", "long", "handsome", "plain", "quaint", "clean", "elegant", "easy", "angry", "crazy", "helpful", "mushy", "odd", "unsightly", "adorable", "important", "inexpensive", "cheap", "expensive", "fancy" ]

randomColors :: Poll String
randomColors = randomFromArray [ "red", "yellow", "blue", "green", "pink", "brown", "purple", "brown", "white", "black", "orange" ]

randomNouns :: Poll String
randomNouns = randomFromArray [ "table", "chair", "house", "bbq", "desk", "car", "pony", "cookie", "sandwich", "burger", "pizza", "mouse", "keyboard" ]

rowReplicator
  :: Int -> Poll Unit
rowReplicator n = merge (replicate n $ pure unit)

makeRow ∷ forall a. { n :: Int, excl :: Int -> Poll a, selectMe :: Int -> Effect Unit, removeMe :: Effect Unit } → Nut
makeRow { n, excl, selectMe, removeMe } = rowTemplate ~~
  { label:
      text $ Array.fold
        <$> sequence
          [ randomAdjectives
          , pure " "
          , randomNouns
          , pure " "
          , randomColors
          , pure " "
          , pure "" <|> folded (excl n $> "!!!")
          ]
  , select: DL.click_ \_ -> selectMe n
  , remove: DL.click_ \_ -> removeMe
  }

bootstrapWith
  :: forall r
   . { appendRows :: Poll Unit
     , rowbox :: Int -> Poll Unit
     , selectMe :: Int -> Effect Unit
     , removeMe :: Effect Unit -> Effect Unit
     , selectbox :: Int -> Poll Unit
     , unselectbox :: Int -> Poll Unit
     , swap :: Poll Boolean
     , n :: Int
     | r
     }
  -> Nut
bootstrapWith { selectMe, removeMe, swap, appendRows, n, rowbox } = Deku.do
  { value: index, remove } <- useDynWith (mapWithIndex (\i _ -> Tuple i i) (rowReplicator n <|> keepLatest (appendRows $> rowReplicator 1000))) $ dynOptions
    { sendTo = case _ of
        1 -> swap <#> if _ then 1 else 998
        998 -> swap <#> if _ then 998 else 1
        _ -> empty

    }
  makeRow { n: index, excl: rowbox, selectMe, removeMe: removeMe remove }

tableBody
  :: { rowBuilder :: Poll RowBuilder
     , appendRows :: Poll Unit
     , swap :: Poll Boolean
     , pushToRow :: { address :: Int, payload :: Unit } -> Effect Unit
     , rowbox :: Int -> Poll Unit
     , selectbox :: Int -> Poll Unit
     , unselectbox :: Int -> Poll Unit
     , selectMe :: Int -> Effect Unit
     , removeMe :: Effect Unit -> Effect Unit
     }
  -> Nut
tableBody i = Deku.do
  D.tbody [ DA.id_ "tbody" ]
    [ i.rowBuilder <#~> case _ of
        C1000 -> bootstrapWith
          $ i `union` { n: 1000 }
        C10000 -> bootstrapWith
          $ i `union` { n: 10000 }
        Clear -> mempty
    ]

data RowBuilder = C1000 | C10000 | Clear

stressTest :: Nut
stressTest =  Deku.do
  setRowBuilder /\ rowBuilder <- DH.useState'
  thunkAppendRows /\ appendRows <- DH.useState'
  incrementRows' /\ nRows <- DH.useState Nothing
  setSwap /\ swap <- DH.useState'
  pushToRow /\ rowbox <- DH.useMailboxed
  pushToSelect /\ selectbox <- DH.useMailboxed
  pushToUnselect /\ unselectbox <- DH.useMailboxed
  setCurrentSelection /\ currentSelection <- DH.useHot Nothing
  selectionRef <- DH.useRef Nothing currentSelection
  let incrementRows = incrementRows' <<< Just
  let clearRows = incrementRows' Nothing
  let
    selectMe index = do
      pushToSelect { address: index, payload: unit }
      s <- selectionRef
      setCurrentSelection $ Just index
      for_ s \i -> do
        pushToUnselect { address: i, payload: unit }
    removeMe rmEffect = do
      rmEffect
      setCurrentSelection Nothing
  body ~~
    { tbody: tableBody { selectMe, removeMe, selectbox, unselectbox, swap, rowBuilder, appendRows, pushToRow, rowbox }
    , c1000: DL.click_ \_ -> incrementRows 1000 *> setRowBuilder C1000
    , c10000: DL.click_ \_ -> incrementRows 10000 *> setRowBuilder C10000
    , append: DL.click_ \_ -> incrementRows 1000 *> thunkAppendRows unit
    , clear: DL.click_ \_ -> clearRows *> setRowBuilder Clear
    , swap: DL.runOn DL.click $ merge [ pure false, swap ] <#> not >>> setSwap
    , update: DL.runOn DL.click $ fold (\a b -> maybe 0 (add a) b) 0 nRows <#> \n -> do
        for_ (0 .. (n / 10 - 1)) \i -> do
          pushToRow { address: i * 10, payload: unit }
    }

rowTemplate = Proxy :: Proxy """<tr><td class="col-md-1"></td><td class="col-md-4"><a ~select~ class="lbl">~label~</a></td><td class="col-md-1"><a ~remove~ class="remove"><span class="remove glyphicon glyphicon-remove" aria-hidden="true"></span></a></td><td class="col-md-6"></td></tr>"""

body =
  Proxy
    :: Proxy
         """<div id="main">
    <div class="container">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-6">
                    <h1>VanillaJS-"keyed"</h1>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-sm-6 smallpad">
                            <button ~c1000~ type="button" class="btn btn-primary btn-block" id="run">Create 1,000 rows</button>
                        </div>
                        <div class="col-sm-6 smallpad">
                            <button ~c10000~ type="button" class="btn btn-primary btn-block" id="runlots">Create 10,000 rows</button>
                        </div>
                        <div class="col-sm-6 smallpad">
                            <button ~append~ type="button" class="btn btn-primary btn-block" id="add">Append 1,000 rows</button>
                        </div>
                        <div class="col-sm-6 smallpad">
                            <button ~update~ type="button" class="btn btn-primary btn-block" id="update">Update every 10th row</button>
                        </div>
                        <div class="col-sm-6 smallpad">
                            <button ~clear~ type="button" class="btn btn-primary btn-block" id="clear">Clear</button>
                        </div>
                        <div class="col-sm-6 smallpad">
                            <button ~swap~ type="button" class="btn btn-primary btn-block" id="swaprows">Swap Rows</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-hover table-striped test-data">
            ~tbody~
        </table>
        <span class="preloadicon glyphicon glyphicon-remove" aria-hidden="true"></span>
    </div>
</div>"""
-- end stress test