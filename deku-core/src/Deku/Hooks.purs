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

import Data.Maybe (Maybe(..))
import Deku.Core (Nut(..), dynOptions, useDeflect, useDyn, useDynAtBeginning, useDynAtBeginningWith, useDynAtEnd, useDynAtEndWith, useDynWith, useHot, useHotRant, useMailboxed, useMailboxedS, useRant, useRant', useRef, useRefST, useSkimmed, useSplit, useState, useState', useStateTagged')
import Deku.Do as Deku
import FRP.Poll (Poll)

guard :: Poll Boolean -> Nut -> Nut
guard b e = switcher (if _ then e else mempty) b

guardWith :: forall a. (Poll (Maybe a)) -> (a -> Nut) -> Nut
guardWith m f = m <#~> case _ of
  Just x -> f x
  Nothing -> mempty

-- | Like `bindFlipped`, except instead of working with a monad, it dips into an `Poll`
-- | and creates a `Nut`. This allows you to use an event to switch between different
-- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- | approach, see the `useDyn` hook.
switcher :: forall a. (a -> Nut) -> Poll a -> Nut
switcher f poll = Deku.do
  skimmed <- useSkimmed poll
  rantedSkimmed <- useRant skimmed
  { value } <- useDynAtBeginningWith skimmed $ dynOptions
    { remove = \_ -> rantedSkimmed $> unit }

  f value

cycle :: Poll Nut -> Nut
cycle = switcher identity

infixl 4 switcher as <$~>

-- | A flipped version of `switcher`.
switcherFlipped :: forall a. Poll a -> (a -> Nut) -> Nut
switcherFlipped a b = switcher b a

infixl 1 switcherFlipped as <#~>
