module Deku.JSUtil where

import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (DocumentFragment, Element, Node)

unsafeNodeToFragment :: Node -> DocumentFragment
unsafeNodeToFragment = unsafeCoerce

unsafeFragmentToElement :: DocumentFragment -> Element
unsafeFragmentToElement = unsafeCoerce