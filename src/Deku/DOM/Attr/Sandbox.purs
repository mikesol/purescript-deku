module Deku.DOM.Attr.Sandbox where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox (NonEmpty.NonEmpty Event.Event  String ) where
  attr Sandbox bothValues = unsafeAttribute $ Both (pure 
    { key: "sandbox", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "sandbox", value: prop' value })
instance Attr Iframe_ Sandbox  String  where
  attr Sandbox value = unsafeAttribute $ This $ pure $
    { key: "sandbox", value: prop' value }
instance Attr Iframe_ Sandbox (Event.Event  String ) where
  attr Sandbox eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sandbox", value: prop' value }

instance Attr everything Sandbox (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Sandbox bothValues = unsafeAttribute $ Both (pure 
    { key: "sandbox", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "sandbox", value: unset' })
instance Attr everything Sandbox  Unit  where
  attr Sandbox _ = unsafeAttribute $ This $ pure $ { key: "sandbox", value: unset' }
instance Attr everything Sandbox (Event.Event  Unit ) where
  attr Sandbox eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "sandbox", value: unset' }
