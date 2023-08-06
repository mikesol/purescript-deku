module Deku.DOM.Attr.Language where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Language = Language

instance Attr Script_ Language  String  where
  attr Language value = unsafeAttribute $ Left $  
    { key: "language", value: prop' value }
instance Attr Script_ Language (Event.Event  String ) where
  attr Language eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "language", value: prop' value }


instance Attr everything Language  Unit  where
  attr Language _ = unsafeAttribute $ Left $  
    { key: "language", value: unset' }
instance Attr everything Language (Event.Event  Unit ) where
  attr Language eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "language", value: unset' }
