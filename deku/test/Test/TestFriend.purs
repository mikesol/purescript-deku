module Test.TestFriend where


import Data.Maybe (Maybe(..))
import Data.Tuple as Tuple
import Effect (Effect)
import Effect.Ref (Ref, new)

just :: forall @a. a -> Maybe a
just = Just

nothing :: forall @a. Maybe a
nothing = Nothing

unlucky :: Effect (Ref Boolean)
unlucky = new false

dummyId :: Int
dummyId = 42

fst :: forall a b. Tuple.Tuple a b -> a
fst = Tuple.fst

snd :: forall a b. Tuple.Tuple a b -> b
snd = Tuple.snd