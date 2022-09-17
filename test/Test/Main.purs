module Test.Main where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as RRef
import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (id_)
import Deku.Control (text_)
import Deku.Core (Domable, Nut, dyn, insert_)
import Deku.DOM as D
import Deku.Do (useState')
import Deku.Do as Deku
import Deku.Interpret (FFIDOMSnapshot, Instruction)
import Deku.Listeners (click_)
import Deku.Toplevel (Template(..), hydrate', runInBody', runSSR)
import Effect (Effect)
import FRP.Event (Event, fold)

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

dynAppearsCorrectly :: Nut
dynAppearsCorrectly = Deku.do
  let
    counter :: forall a. Event a -> Event Int
    counter event = fold (const (add 1)) event (-1)
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
