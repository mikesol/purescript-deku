module Deku.DOM.Attr.Sandbox where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox  String  where
  attr Sandbox value = unsafeAttribute $ Left $  
    { key: "sandbox", value: prop' value }
instance Attr Iframe_ Sandbox (Event.Event  String ) where
  attr Sandbox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "sandbox", value: prop' value }


instance Attr everything Sandbox  Unit  where
  attr Sandbox _ = unsafeAttribute $ Left $  { key: "sandbox", value: unset' }
instance Attr everything Sandbox (Event.Event  Unit ) where
  attr Sandbox eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "sandbox", value: unset' }
