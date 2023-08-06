module Deku.DOM.Attr.Method where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Method = Method

instance Attr Form_ Method  String  where
  attr Method value = unsafeAttribute $ Left $  
    { key: "method", value: prop' value }
instance Attr Form_ Method (Event.Event  String ) where
  attr Method eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "method", value: prop' value }


instance Attr TextPath_ Method  String  where
  attr Method value = unsafeAttribute $ Left $  
    { key: "method", value: prop' value }
instance Attr TextPath_ Method (Event.Event  String ) where
  attr Method eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "method", value: prop' value }


instance Attr everything Method  Unit  where
  attr Method _ = unsafeAttribute $ Left $  { key: "method", value: unset' }
instance Attr everything Method (Event.Event  Unit ) where
  attr Method eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "method", value: unset' }
