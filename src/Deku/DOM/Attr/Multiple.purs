module Deku.DOM.Attr.Multiple where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Multiple = Multiple

instance Attr Input_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ Left $  
    { key: "multiple", value: prop' value }
instance Attr Input_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }


instance Attr Select_ Multiple  String  where
  attr Multiple value = unsafeAttribute $ Left $  
    { key: "multiple", value: prop' value }
instance Attr Select_ Multiple (Event.Event  String ) where
  attr Multiple eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "multiple", value: prop' value }


instance Attr everything Multiple  Unit  where
  attr Multiple _ = unsafeAttribute $ Left $  
    { key: "multiple", value: unset' }
instance Attr everything Multiple (Event.Event  Unit ) where
  attr Multiple eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "multiple", value: unset' }
