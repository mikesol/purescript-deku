module Deku.Example.Docs.Util where

import Prelude

import Deku.Example.Docs.Types (DeviceType(..))
import Deku.Graph.Attribute (Attribute, Cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Effect (Effect)

foreign import scrollToTop_ :: Effect Unit

scrollToTop :: Effect Unit
scrollToTop = scrollToTop_

cot :: forall attr. DeviceType -> Cb -> Attribute attr
cot Desktop cb = D.OnClick := cb
cot _ cb = D.OnTouchstart := cb