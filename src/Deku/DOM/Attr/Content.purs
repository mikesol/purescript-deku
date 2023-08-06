module Deku.DOM.Attr.Content where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Content = Content

instance Attr Meta_ Content  String  where
  attr Content value = unsafeAttribute $ Left $  
    { key: "content", value: prop' value }
instance Attr Meta_ Content (Event.Event  String ) where
  attr Content eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "content", value: prop' value }


instance Attr everything Content  Unit  where
  attr Content _ = unsafeAttribute $ Left $  { key: "content", value: unset' }
instance Attr everything Content (Event.Event  Unit ) where
  attr Content eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "content", value: unset' }
