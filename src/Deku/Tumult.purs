module Deku.Tumult (Tumultuous, unsafeTumult, safeUntumult) where

import Prelude

import Deku.Rendered (Instruction)

newtype Tumultuous :: forall k1 k2. k1 -> k2 -> Type
newtype Tumultuous n terminus = Tumultuous (Array (Array Instruction))

derive instance eqTumult :: Eq (Tumultuous n terminus)
derive instance ordTumult :: Ord (Tumultuous n terminus)
instance showTumult :: Show (Tumultuous n terminus) where
  show (Tumultuous tumult) = "Tumult <" <> show tumult <> ">"

unsafeTumult
  :: forall n terminus
   . Array (Array Instruction)
  -> Tumultuous n terminus
unsafeTumult = Tumultuous

safeUntumult
  :: forall n terminus
   . Tumultuous n terminus
  -> Array (Array Instruction)
safeUntumult (Tumultuous tumult) = tumult