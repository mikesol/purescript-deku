module Deku.Example.Docs.Types where

import Prelude

import Control.Plus (empty)
import Data.Maybe (Maybe)

data Page
  = Intro
  | HelloWorld
  | SimpleComponent
  | PURSX1
  | PURSX2
  | Events
  | Effects
  | Events2
  | Portals
  | SSR

stringToPage :: String -> Maybe Page
stringToPage "Intro" = pure Intro
stringToPage "HelloWorld" = pure HelloWorld
stringToPage "SimpleComponent" = pure SimpleComponent
stringToPage "PURSX1" = pure PURSX1
stringToPage "PURSX2" = pure PURSX2
stringToPage "Events" = pure Events
stringToPage "Effects" = pure Effects
stringToPage "Events2" = pure Events2
stringToPage "Portals" = pure Portals
stringToPage "SSR" = pure SSR
stringToPage _ = empty