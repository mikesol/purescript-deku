-- | Deku Hooks, modeled after React Hooks, are a way to have stateful poll in Deku.
-- | At a basic level, Deku hooks look very much like their react counterparts:
-- |
-- | ```purescript
-- | Deku.do
-- |  setCount /\ count <- useState 0
-- |  Deku.button (click' $ counter <#> add 1 >>> setCount) [ textShow' count ]
-- | ```
-- |
-- | Deku hooks are covered more extensively in the
-- | [Deku guide section on state](https://purescript-deku.netlify.app/core-concepts/state)
-- | and the [Deku guide section on collections](https://purescript-deku.netlify.app/core-concepts/collections).
module Deku.Hooks
  ( module Deku.Core
  , (<#~>)
  , (<$~>)
  , cycle
  , guard
  , guardWith
  , switcher
  , switcherFlipped
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Maybe (Maybe(..))
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Core (Nut(..), useMailboxedS, useSplit, useDyn, dynOptions, useDeflect, useDynAtBeginning, useDynAtBeginningWith, useDynAtEnd, useDynAtEndWith, useDynWith, useHot, useHotRant, useMailboxed, useRant, useRant', useStateTagged', useRef, useRefST, useState, useState')
import Deku.Do as Deku
import FRP.Event (filterMap, mapAccum)
import FRP.Poll (Poll)

guard :: Poll Boolean -> Nut -> Nut
guard b e = switcher (if _ then e else mempty) b

guardWith :: forall a. (Poll (Maybe a)) -> (a -> Nut) -> Nut
guardWith m f = m <#~> case _ of
  Just x -> f x
  Nothing -> mempty

-- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- | and creates a `Nut`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher :: forall a. (a -> Nut) -> Poll a -> Nut
switcher f poll = Deku.do
  { first: ctr1, second: ctr2 } <- useSplit (counter poll)
  dctr <- useDeflect (counter poll)
  { value } <- useDynAtBeginningWith (ctr2 <|> dctr) $ dynOptions
    { remove = \(oldV /\ _) -> filterMap
        (\(newV /\ _) -> if newV == oldV + 1 then Just unit else Nothing)
        ctr1
    }

  f (snd value)
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (a /\ b)

cycle :: Poll Nut -> Nut
cycle = switcher identity

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped :: forall a. Poll a -> (a -> Nut) -> Nut
switcherFlipped a b = switcher b a

infixl 1 switcherFlipped as <#~>
