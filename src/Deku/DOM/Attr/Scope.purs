module Deku.DOM.Attr.Scope where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope  String  where
  attr Scope value = unsafeAttribute $ Left $  
    { key: "scope", value: prop' value }
instance Attr Th_ Scope (Event.Event  String ) where
  attr Scope eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "scope", value: prop' value }


instance Attr everything Scope  Unit  where
  attr Scope _ = unsafeAttribute $ Left $  { key: "scope", value: unset' }
instance Attr everything Scope (Event.Event  Unit ) where
  attr Scope eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "scope", value: unset' }
