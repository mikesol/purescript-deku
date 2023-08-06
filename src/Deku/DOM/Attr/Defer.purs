module Deku.DOM.Attr.Defer where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Defer = Defer

instance Attr Script_ Defer  String  where
  attr Defer value = unsafeAttribute $ Left $  
    { key: "defer", value: prop' value }
instance Attr Script_ Defer (Event.Event  String ) where
  attr Defer eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "defer", value: prop' value }


instance Attr everything Defer  Unit  where
  attr Defer _ = unsafeAttribute $ Left $  { key: "defer", value: unset' }
instance Attr everything Defer (Event.Event  Unit ) where
  attr Defer eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "defer", value: unset' }
