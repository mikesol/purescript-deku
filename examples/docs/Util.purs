module Deku.Example.Docs.Util where

import Prelude

import Effect (Effect)

foreign import scrollToTop_ :: Effect Unit

scrollToTop :: Effect Unit
scrollToTop = scrollToTop_
