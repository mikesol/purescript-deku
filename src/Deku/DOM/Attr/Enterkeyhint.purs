module Deku.DOM.Attr.Enterkeyhint where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enterkeyhint = Enterkeyhint

instance Attr Textarea_ Enterkeyhint  String  where
  attr Enterkeyhint value = unsafeAttribute $ Left $  
    { key: "enterkeyhint", value: prop' value }
instance Attr Textarea_ Enterkeyhint (Event.Event  String ) where
  attr Enterkeyhint eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "enterkeyhint", value: prop' value }


instance Attr everything Enterkeyhint  Unit  where
  attr Enterkeyhint _ = unsafeAttribute $ Left $  
    { key: "enterkeyhint", value: unset' }
instance Attr everything Enterkeyhint (Event.Event  Unit ) where
  attr Enterkeyhint eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "enterkeyhint", value: unset' }
