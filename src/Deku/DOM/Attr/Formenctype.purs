module Deku.DOM.Attr.Formenctype where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formenctype = Formenctype

instance Attr Button_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute $ Left $  
    { key: "formenctype", value: prop' value }
instance Attr Button_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }


instance Attr Input_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute $ Left $  
    { key: "formenctype", value: prop' value }
instance Attr Input_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }


instance Attr everything Formenctype  Unit  where
  attr Formenctype _ = unsafeAttribute $ Left $  
    { key: "formenctype", value: unset' }
instance Attr everything Formenctype (Event.Event  Unit ) where
  attr Formenctype eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "formenctype", value: unset' }
