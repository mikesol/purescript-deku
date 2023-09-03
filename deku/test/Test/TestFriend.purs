module Test.TestFriend where


import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Ref (Ref, new)

just :: forall @a. a -> Maybe a
just = Just
nothing :: forall @a. Maybe a
nothing = Nothing

unlucky :: Effect (Ref Boolean)
unlucky = new false