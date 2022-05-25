module Deku.Example.Docs where

import Prelude

import Deku.Example.Docs.Scene (scene)
import Deku.Example.Docs.Types (Page(..))
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (scene { slug: "/", startsWith: Intro })