module Deku.DOM.Attr.AcceptCharset where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AcceptCharset = AcceptCharset

instance Attr Form_ AcceptCharset  String  where
  attr AcceptCharset value = unsafeAttribute $ Left $  
    { key: "accept-charset", value: prop' value }
instance Attr Form_ AcceptCharset (Event.Event  String ) where
  attr AcceptCharset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "accept-charset", value: prop' value }


instance Attr everything AcceptCharset  Unit  where
  attr AcceptCharset _ = unsafeAttribute $ Left $  
    { key: "accept-charset", value: unset' }
instance Attr everything AcceptCharset (Event.Event  Unit ) where
  attr AcceptCharset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "accept-charset", value: unset' }
