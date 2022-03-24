module Deku.Example.Docs.Util where

import Prelude

import Deku.Example.Docs.Types (DeviceType)
import Deku.Graph.Attribute (Attribute, Cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Effect (Effect)

foreign import scrollToTop_ :: Effect Unit

scrollToTop :: Effect Unit
scrollToTop = scrollToTop_

cot :: forall attr. DeviceType -> Cb -> Attribute attr
cot _ cb = D.OnClick := cb
-- can do this eventually
--cot _ cb = D.OnTouchstart := cb