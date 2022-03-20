module Deku.Tumult (Tumultuous, unsafeTumult, safeUntumult) where

import Prelude

import Data.Map (Map)
import Data.Maybe (Maybe)
import Deku.Rendered (Instruction)

newtype Tumultuous (terminus :: Symbol) = Tumultuous (Map Int (Maybe (Array Instruction)))

derive instance eqTumult :: Eq (Tumultuous terminus)
derive instance ordTumult :: Ord (Tumultuous terminus)
instance showTumult :: Show (Tumultuous terminus) where
  show (Tumultuous tumult) = "Tumult <" <> show tumult <> ">"

unsafeTumult
  :: forall terminus
   . Map Int (Maybe (Array Instruction))
  -> Tumultuous terminus
unsafeTumult = Tumultuous

safeUntumult
  :: forall terminus
   . Tumultuous terminus
  -> Map Int (Maybe (Array Instruction))
safeUntumult (Tumultuous tumult) = tumult