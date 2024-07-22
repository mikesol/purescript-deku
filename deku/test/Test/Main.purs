module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Array ((..))
import Data.Array as Array
import Data.Filterable (compact, filter)
import Data.Foldable (intercalate, traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.Core (Hook, Nut(..), deferO, fixed, portal, useRefST)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Combinators (injectElementT)
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (dynOptions, guard, guardWith, useDyn, useDynAtBeginning, useDynAtEnd, useDynAtEndWith, useHot, useHotRant, useRant, useRef, useState, useState', (<#~>))
import Deku.Pursx (lenientPursx, pursx)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import Effect.Uncurried (mkEffectFn2, runEffectFn2)
import FRP.Event (count, fold)
import FRP.Poll (Poll, merge, mergeMap, mergeMapPure, stToPoll)
import Web.HTML (window)
import Web.HTML.HTMLInputElement as InputElement
import Web.HTML.Window (alert)

foreign import hackyInnerHTML :: String -> String -> Effect Unit

runTest :: Nut -> Effect Unit
runTest = void <<< runInBody

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
          , D.span [ DA.id_ ("dyn" <> show i <> "b") ]
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
      -- the mapping represents the final state given the insert order
      -- which should be 0-1-3-2-4
      -- if you follow the list below from left to right and treat each
      -- index as a position, that's what you'll get
      let
        mporder i
          | i == 0 = 0
          | i == 1 = 1
          | i == 2 = 3
          | i == 3 = 2
          | i == 4 = 4
          | otherwise = 42
      { value: i } <- useDyn
        (mergeMapPure (\i -> Tuple (Just i) $ mporder i) [ 3, 0, 4, 2, 1 ])
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
        0 -> lenientPursx "<h1 id=\"home\">home</h1>" {}
        1 -> lenientPursx "<h1 id=\"about\">about ~me~</h1>"
          { me: text_ "deku" }
        _ -> lenientPursx "<h1 id=\"contact\">contact ~a~ at ~b~ ~c~ ~d~</h1>"
          { a: D.span_ [ text_ "mike" ]
          , b: text_ "site"
          , c: text_ "dot com"
          , d: lenientPursx "<h1 id=\"thanks\">thanks</h1>" {}
          }
    ]

portalsCompose :: Nut
portalsCompose = Deku.do
  let
    counter :: forall a. Poll a -> Poll Int
    counter event = fold (\a _ -> a + 1) (-1) event
  setItem /\ item <- useState unit
  e <- portal (D.div_ [ text_ "a", D.span_ [ text_ "b" ], text_ "c" ])
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

pursXWiresUp :: Nut
pursXWiresUp = Deku.do
  setMessage /\ message <- useState'
  D.div [ DA.id_ "div0" ]
    [ pursx @"<div ~mykls~><h1 id=\"px\" ~evt~ >hi</h1>début ~me~ fin</div>"
        { me: fixed
            [ text_ "milieu"
            , text_ " "
            , D.span
                [ DL.click_ \_ -> setMessage "goodbye"
                , DA.id_ "inny"
                ]
                [ text_ "après-milieu" ]
            ]
        , evt:  DL.click_ \_ -> setMessage "hello" 
        , mykls:  DA.klass_ "arrrrr" <|> DA.id_ "topdiv"
        }
    , D.span [ DA.id_ "span0" ] [ text message ]
    ]

pursXWiresUp2 :: Nut
pursXWiresUp2 = Deku.do
  setMessage /\ message <- useState'
  D.div [ DA.id_ "div0" ]
    [ lenientPursx "<div ~mykls~><h1 id=\"px\" ~evt~ >hi</h1>début ~me~ fin</div>"
        { me: fixed
            [ text_ "milieu"
            , text_ " "
            , D.span
                [ DL.click_ \_ -> setMessage "goodbye"
                , DA.id_ "inny"
                ]
                [ text_ "après-milieu" ]
            ]
        , evt:  DL.click_ \_ -> setMessage "hello" 
        , mykls: DA.klass_ "arrrrr" <|> DA.id_ "topdiv"
        }
    , D.span [ DA.id_ "span0" ] [ text message ]
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
        , DA.unset @"style" unset
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
  cref <- useRefST "foo" label
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
                    (stToPoll cref)
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

emptySwitches :: Nut
emptySwitches = Deku.do
  setItem /\ item <- useState 0
  D.div [ DA.id_ "div0" ]
    [ D.div [ DA.id_ "content" ] $ Array.range 0 5 <#> \id ->
      guard ( eq id <$> item ) ( text_ $ show id )
    
    , D.div [ DA.id_ "incr", DL.click $ item <#> \st _ -> setItem $ ( st + 1 ) `mod` 6 ] [ text_ "next" ]
    ]

pureSwitches :: Nut
pureSwitches = Deku.do
  _ /\ elem <- useState'
  let
    initial :: Poll Unit
    initial = merge $ Array.replicate 5 $ pure unit

  (initial <|> elem) <#~> \e ->
    D.span [ DA.klass_ "switcherelem" ] [ text_ $ show e ]

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

useDispose :: Effect Unit -> Effect Unit -> Hook Unit
useDispose init eff cont = Nut $ mkEffectFn2 \psr di -> do
  init
  let Nut nut = cont unit
  runEffectFn2 deferO psr eff
  runEffectFn2 nut psr di

disposeGetsRun :: Nut
disposeGetsRun = Deku.do
  pushTick /\ ticks <- useState'
  fixed
    [ D.span [ DA.id_ "count" ] [ text $ show <$> count ticks ]
    , Deku.do
      { remove } <- useDynAtBeginning ( pure unit )
      useDispose ( pushTick unit ) ( pushTick unit )
      D.span [ DA.id_ "notthere", DL.click_ \_ -> remove ] []
    ]

disposeGetsRunOnce :: Nut
disposeGetsRunOnce = Deku.do
  pushTick /\ ticks <- useState'
  fixed
    [ D.span [ DA.id_ "count" ] [ text $ show <$> count ticks ]
    , Deku.do
      { remove } <- useDynAtBeginning ( pure unit )
      useDispose ( pushTick unit ) ( pushTick unit )
      D.span [ DA.id_ "notthere", DL.click_ \_ -> remove ] []
    ]