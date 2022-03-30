module Deku.Example.Docs.Types where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Hashable (class Hashable, hash)
import Data.Show.Generic (genericShow)
data Page
  = Intro
  | HelloWorld
  | SimpleComponent
  | PURSX1
  | PURSX2
  | Events
  | Effects
  | Subgraph
derive instance Eq Page
derive instance Ord Page
derive instance Generic Page _
instance showPage :: Show Page where
  show s = genericShow s

instance Hashable Page where
  hash = show >>> hash