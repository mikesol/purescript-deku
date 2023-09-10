module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Array ((..))
import Data.Filterable (compact, filter)
import Data.Foldable (intercalate, traverse_)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.Core (Hook, Nut, fixed, portal, useRefST)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Combinators (injectElementT, templated_)
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (dynOptions, guard, guardWith, useDyn, useDynAtBeginning, useDynAtEnd, useDynAtEndWith, useHot, useHotRant, useRant, useRef, useState, useState', (<#~>))
import Deku.Pursx (template, pursx)
import Deku.Some as Some
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Console (log, logShow)
import Effect.Random (random)
import FRP.Event (fold)
import FRP.Poll (Poll, merge, mergeMap, mergeMapPure, stToPoll)
import Web.HTML (window)
import Web.HTML.HTMLInputElement as InputElement
import Web.HTML.Window (alert)

foreign import hackyInnerHTML :: String -> String -> Effect Unit

runTest :: Nut -> Effect Unit
runTest = runInBody

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
        0 -> pursx @"<h1 id=\"home\">home</h1>" {}
        1 -> pursx @"<h1 id=\"about\">about ~me~</h1>"
          { me: text_ "deku" }
        _ -> pursx @"<h1 id=\"contact\">contact ~a~ at ~b~ ~c~ ~d~</h1>"
          { a: D.span_ [ text_ "mike" ]
          , b: text_ "site"
          , c: text_ "dot com"
          , d: pursx @"<h1 id=\"thanks\">thanks</h1>" {}
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

pursXComposes :: Nut
pursXComposes = Deku.do
  D.div [ DA.id_ "div0" ]
    [ pursx @"<h1 id=\"px\">début ~me~ fin</h1>"
        { me: fixed [ text_ "milieu", text_ " ", text_ "après-milieu" ] }
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
        , evt: DL.click_ \_ -> setMessage "hello"
        , mykls: DA.klass_ "arrrrr" <|> DA.id_ "topdiv"
        }
    , D.span [ DA.id_ "span0" ] [ text message ]
    ]

templatesWork :: Nut
templatesWork = Deku.do
  setSendTo /\ sendTo <- useState'
  D.div [ DA.id_ "div0" ]
    [ template @"<div>hello ~world~<button ~atts~>x</button></div>" $
        merge
          [ sendTo <#> \(Tuple s i) -> Tuple s $ Some.inj
              { sendTo: i
              }
          , [ "Helsinki", "Stockholm", "Copenhagen" ] # mergeMap \s ->
              pure
                $ Tuple s
                $ Some.inj
                    { atts:
                        [ templated_ DL.click_ \_ ->
                            setSendTo $ Tuple s 0
                        , templated_ DA.id_ s
                        ]
                    , world: s
                    }
          ]
    ]

templatesWork2 :: Nut
templatesWork2 = Deku.do
  D.div [ DA.id_ "div0" ]
    [ template @"<div id=\"testing\">~test~ ~ing~</div>"
        $ pure
        $ Tuple "0"
        $ Some.inj
            { test: "hello"
            , ing: "world"
            }
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

-- randomAdjectives :: Array String
-- randomAdjectives =
--   [ "pretty"
--   , "large"
--   , "big"
--   , "small"
--   , "tall"
--   , "short"
--   , "long"
--   , "handsome"
--   , "plain"
--   , "quaint"
--   , "clean"
--   , "elegant"
--   , "easy"
--   , "angry"
--   , "crazy"
--   , "helpful"
--   , "mushy"
--   , "odd"
--   , "unsightly"
--   , "adorable"
--   , "important"
--   , "inexpensive"
--   , "cheap"
--   , "expensive"
--   , "fancy"
--   ]

-- randomColors :: Array String
-- randomColors =
--   [ "red"
--   , "yellow"
--   , "blue"
--   , "green"
--   , "pink"
--   , "brown"
--   , "purple"
--   , "brown"
--   , "white"
--   , "black"
--   , "orange"
--   ]

-- randomNouns :: Array String
-- randomNouns =
--   [ "table"
--   , "chair"
--   , "house"
--   , "bbq"
--   , "desk"
--   , "car"
--   , "pony"
--   , "cookie"
--   , "sandwich"
--   , "burger"
--   , "pizza"
--   , "mouse"
--   , "keyboard"
--   ]

-- makeRow
--   ∷ forall a
--    . { n :: Int
--      , excl :: Int -> Poll a
--      , selectbox :: Int -> Poll Unit
--      , unselectbox :: Int -> Poll Unit
--      , selectMe :: Int -> Effect Unit
--      , removeMe :: Effect Unit
--      , label :: String
--      }
--   → Nut
-- makeRow { n, excl, selectMe, removeMe, selectbox, unselectbox, label } = rowTemplate
--   { label: fixed [ text_ label, text $ folded (excl n $> " !!!") ]
--   , select: DL.click_ \_ -> selectMe n
--   , remove: DL.click_ \_ -> removeMe
--   , selected: selectbox n
--   , unselected: unselectbox n
--   , n
--   }

-- bootstrapWith
--   :: forall r
--    . { appendRows :: Poll (Array (Tuple Int String))
--      , rowbox :: Int -> Poll Unit
--      , selectMe :: Int -> Effect Unit
--      , removeMe :: ((Int -> Effect Unit) -> Effect Unit) -> Effect Unit
--      , selectbox :: Int -> Poll Unit
--      , unselectbox :: Int -> Poll Unit
--      , swap :: Int -> Poll Int
--      , arr :: Array (Tuple Int String)
--      | r
--      }
--   -> Nut
-- bootstrapWith { selectMe, arr, removeMe, swap, appendRows, rowbox, selectbox, unselectbox } = Deku.do
--   { value: Tuple index label, remove } <-
--     useDynAtEndWith
--       (mergePure arr <|> keepLatest (map mergePure appendRows))
--       $ dynOptions
--           { sendTo = fst >>> swap
--           }
--   makeRow { n: index, label, excl: rowbox, selectMe, removeMe: removeMe \f -> f index *> remove, selectbox, unselectbox }

-- bootstrapWith2
--   :: forall r
--    . { appendRows :: Poll (Array (Tuple Int String))
--      , rowbox :: Int -> Poll Unit
--      , selectMe :: Int -> Effect Unit
--      , removeMe :: ((Int -> Effect Unit) -> Effect Unit) -> Effect Unit
--      , selectbox :: Int -> Poll Unit
--      , unselectbox :: Int -> Poll Unit
--      , swap :: Int -> Poll Int
--      , arr :: Array (Tuple Int String)
--      | r
--      }
--   -> Nut
-- bootstrapWith2 { selectMe, arr, removeMe, swap, appendRows, rowbox, selectbox, unselectbox } = Deku.do
--   { value: Tuple index label, remove } <-
--     useTemplateWith @"""<tr ~sel~ ><td class="col-md-1"> ~num~ </td><td class="col-md-4"><a ~select~ class="lbl">~label~</a></td><td class="col-md-1"><a ~remove~ class="remove"><span class="remove glyphicon glyphicon-remove" aria-hidden="true"></span></a></td><td class="col-md-6"></td></tr>"""
--       (map (Nothing /\ _) (mergePure arr <|> keepLatest (map mergePure appendRows)))
--       $ dynOptions
--           { sendTo = fst >>> swap
--           }
--   makeRow2 { n: index, label, excl: rowbox, remover: removeMe \f -> f index *> remove }
--   where
--   makeRow2 { n, excl, remover, label } = rowTemplate2
--     { label: lift2 append (pure label) (pure "" <|> (folded (excl n $> " !!!")))
--     , select: DL.click_ \_ -> selectMe n
--     , remove: DL.click_ \_ -> remover
--     , selected: selectbox n
--     , unselected: unselectbox n
--     , n
--     }
--   rowTemplate2 { n, select, selected, unselected, label, remove } =
--                 { sel: merge
--                       [ DA.klass $ selected $> "danger"
--                       , DA.unset DA.klass (unselected $> unit)
--                       ]
--                   , num: show (n + 1)
--                   , select
--                   , label
--                   , remove
--                   }

-- makeTable
--   :: { rowBuilder :: Poll RowBuilder
--      , appendRows :: Poll (Array (Tuple Int String))
--      , swap :: Int -> Poll Int
--      , pushToRow :: { address :: Int, payload :: Unit } -> Effect Unit
--      , rowbox :: Int -> Poll Unit
--      , selectbox :: Int -> Poll Unit
--      , unselectbox :: Int -> Poll Unit
--      , selectMe :: Int -> Effect Unit
--      , removeMe :: ((Int -> Effect Unit) -> Effect Unit) -> Effect Unit
--      }
--   -> Nut
-- makeTable i = do
--   D.table [ DA.klass_ "table table-hover table-striped test-data" ]
--     [ D.tbody [ DA.id_ "tbody" ]
--         [ i.rowBuilder <#~> case _ of
--             AddRows arr -> bootstrapWith2
--               $ i `union` { arr }
--             Clear -> mempty
--         ]
--     ]

-- data RowBuilder = AddRows (Array (Tuple Int String)) | Clear

-- rando :: Array String -> Effect String
-- rando a = do
--   ri <- randomInt 0 (Array.length a)
--   pure $ fromMaybe "foo" (a !! ri)

-- genRows :: Int -> Int -> Effect (Array (Tuple Int String))
-- genRows offset n = do
--   arr <- liftST $ STArray.new
--   foreachE (0 .. (n - 1)) \i -> do
--     adjective <- rando randomAdjectives
--     color <- rando randomColors
--     noun <- rando randomNouns
--     let label = intercalate " " [ adjective, color, noun ]
--     liftST $ void $ STArray.push (Tuple (offset + i) label) arr
--   liftST $ STArray.freeze arr

-- data RowTransform = Start Int Int | Add Int Int | Swap | Delete Int | ClearRows

-- doRowTransform :: Array Int -> RowTransform -> Array Int
-- doRowTransform a (Add i o) = a <> (i .. (o - 1))
-- doRowTransform _ (Start i o) = (i .. (o - 1))
-- doRowTransform a Swap = fromMaybe a do
--   l <- a !! 1
--   r <- a !! 998
--   o <- Array.updateAt 998 l a
--   Array.updateAt 1 r o
-- doRowTransform a (Delete v) = Array.delete v a
-- doRowTransform _ ClearRows = []

-- rowBuilderToN :: Int -> RowBuilder -> Int
-- rowBuilderToN b (AddRows arr) = Array.length arr + b
-- rowBuilderToN _ Clear = 0

-- stressTest :: Nut
-- stressTest = Deku.do
--   setRowBuilder /\ rowBuilder <- DH.useState'
--   setAppendRows /\ appendRows <- DH.useState'
--   incrementRows /\ nRowsRaw <- DH.useState'
--   nRows <- DH.useRant (fold add 0 nRowsRaw)
--   nRowsRef <- DH.useRef 0 nRows
--   setRowTransformer /\ rowTransformerRaw <- DH.useState'
--   rowTransformer <- DH.useRant (fold doRowTransform [] rowTransformerRaw)
--   rowTransformerRef <- DH.useRef [] rowTransformer
--   setSwap /\ swap <- DH.useMailboxed
--   pushToRow /\ rowbox <- DH.useMailboxed
--   pushToSelect /\ selectbox <- DH.useMailboxed
--   pushToUnselect /\ unselectbox <- DH.useMailboxed
--   setCurrentSelection /\ currentSelection <- DH.useHot Nothing
--   selectionRef <- DH.useRef Nothing currentSelection
--   let
--     selectMe index = do
--       pushToSelect { address: index, payload: unit }
--       s <- selectionRef
--       setCurrentSelection $ Just index
--       for_ s \i -> do
--         pushToUnselect { address: i, payload: unit }
--     removeMe rmEffect = do
--       rmEffect (setRowTransformer <<< Delete)
--       setCurrentSelection Nothing
--   let
--     adder b f n = do
--       r <- nRowsRef
--       rows <- genRows r n
--       setRowTransformer $ (if b then Start else Add) r (r + n)
--       incrementRows n *> f rows
--   let rowAdder = adder true (setRowBuilder <<< AddRows)
--   body ~~
--     { table: makeTable
--         { selectMe
--         , removeMe
--         , selectbox
--         , unselectbox
--         , swap
--         , rowBuilder
--         , appendRows
--         , pushToRow
--         , rowbox
--         }
--     , c1000: DL.click_ \_ -> rowAdder 1000
--     , c10000: DL.click_ \_ -> rowAdder 10000
--     , append: DL.click_ \_ -> adder false setAppendRows 1000
--     , clear: DL.click_ \_ -> do
--         setRowTransformer ClearRows
--         setRowBuilder Clear
--     , swap: DL.click_ \_ -> do
--         a <- rowTransformerRef
--         let
--           swappies = ado
--             l <- a !! 1
--             r <- a !! 998
--             in Tuple l r
--         for_ swappies \(Tuple l r) -> do
--           setSwap { address: r, payload: 1 }
--           setSwap { address: l, payload: 998 }
--         setRowTransformer Swap
--     , update: DL.runOn DL.click $ rowTransformer <#>
--         \arr -> do
--           let
--             go { i } = case arr !! i of
--               Nothing -> pure $ Done unit
--               Just head -> pushToRow { address: head, payload: unit } $> Loop { i: i + 10 }
--           tailRecM go { i: 0 }
--     }

-- rowTemplate
--   :: { label :: Nut
--      , n :: Int
--      , selected :: Poll Unit
--      , unselected :: Poll Unit
--      , select :: Poll (Attribute (DOM.HTMLAnchorElement ()))
--      , remove :: Poll (Attribute (DOM.HTMLAnchorElement ()))
--      }
--   -> Nut
-- rowTemplate { n, select, selected, unselected, label, remove } = D.tr
--   [ DA.klass $ selected $> "danger"
--   , DA.unset DA.klass (unselected $> unit)
--   ]
--   [ D.td [ DA.klass_ "col-md-1" ] [ text_ $ show (n + 1) ]
--   , D.td [ DA.klass_ "col-md-4" ]
--       [ D.a [ select, DA.klass_ "lbl" ] [ label ] ]
--   , D.td [ DA.klass_ "col-md-1" ]
--       [ D.a [ remove, DA.klass_ "remove" ]
--           [ D.span
--               [ DA.klass_ "remove glyphicon glyphicon-remove"
--               , DA.ariaHidden_ "true"
--               ]
--               []
--           ]
--       ]
--   , D.td [ DA.klass_ "col-md-6" ] []
--   ]

-- body =
--   Proxy
--     :: Proxy
--          """<div id="main">
--     <div class="container">
--         <div class="jumbotron">
--             <div class="row">
--                 <div class="col-md-6">
--                     <h1>Deku-"keyed"</h1>
--                 </div>
--                 <div class="col-md-6">
--                     <div class="row">
--                         <div class="col-sm-6 smallpad">
--                             <button ~c1000~ type="button" class="btn btn-primary btn-block" id="run">Create 1,000 rows</button>
--                         </div>
--                         <div class="col-sm-6 smallpad">
--                             <button ~c10000~ type="button" class="btn btn-primary btn-block" id="runlots">Create 10,000 rows</button>
--                         </div>
--                         <div class="col-sm-6 smallpad">
--                             <button ~append~ type="button" class="btn btn-primary btn-block" id="add">Append 1,000 rows</button>
--                         </div>
--                         <div class="col-sm-6 smallpad">
--                             <button ~update~ type="button" class="btn btn-primary btn-block" id="update">Update every 10th row</button>
--                         </div>
--                         <div class="col-sm-6 smallpad">
--                             <button ~clear~ type="button" class="btn btn-primary btn-block" id="clear">Clear</button>
--                         </div>
--                         <div class="col-sm-6 smallpad">
--                             <button ~swap~ type="button" class="btn btn-primary btn-block" id="swaprows">Swap Rows</button>
--                         </div>
--                     </div>
--                 </div>
--             </div>
--         </div>
--         ~table~
--         <span class="preloadicon glyphicon glyphicon-remove" aria-hidden="true"></span>
--     </div>
-- </div>"""
-- end stress test