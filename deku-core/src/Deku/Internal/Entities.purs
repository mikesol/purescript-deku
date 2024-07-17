module Deku.Internal.Entities where

import Unsafe.Coerce (unsafeCoerce)

data DekuElement

toDekuElement :: forall @a. a -> DekuElement
toDekuElement = unsafeCoerce

fromDekuElement :: forall @a. DekuElement -> a
fromDekuElement = unsafeCoerce

data DekuText

toDekuText :: forall @a. a -> DekuText
toDekuText = unsafeCoerce

fromDekuText :: forall @a. DekuText -> a
fromDekuText = unsafeCoerce

data DekuEvent

toDekuEvent :: forall @a. a -> DekuEvent
toDekuEvent = unsafeCoerce

fromDekuEvent :: forall @a. DekuEvent -> a
fromDekuEvent = unsafeCoerce

newtype DekuChild = DekuChild DekuElement
newtype DekuParent = DekuParent DekuElement