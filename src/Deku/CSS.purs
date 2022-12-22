module Deku.CSS where

import Prelude

import CSS (CSS, Key, Rule(..), Value, collect, runS)
import Data.Either (Either, hush)
import Data.Filterable (filterMap)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Foreign.Object (Object)
import Foreign.Object as Object

render ∷ CSS → String
render = toString
  <<< rules
  <<< runS
  where
  toString ∷ Object String → String
  toString = joinWith "; " <<< Object.foldMap
    (\key val → [ key <> ": " <> val ])

  rules ∷ Array Rule → Object String
  rules rs = Object.fromFoldable properties
    where
    properties ∷ Array (Tuple String String)
    properties = filterMap property rs >>= collect >>> rights

  property ∷ Rule → Maybe (Tuple (Key Unit) Value)
  property (Property k v) = Just (Tuple k v)
  property _ = Nothing

  rights ∷ ∀ a b. Array (Either a b) → Array b
  rights = filterMap hush