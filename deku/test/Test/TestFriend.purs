module Test.TestFriend where


import Data.Maybe (Maybe(..))

just :: forall @a. a -> Maybe a
just = Just
nothing :: forall @a. Maybe a
nothing = Nothing