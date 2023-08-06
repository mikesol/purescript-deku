module Deku.DOM.Attr.Formaction where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ Left $  
    { key: "formaction", value: prop' value }
instance Attr Input_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }


instance Attr Button_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ Left $  
    { key: "formaction", value: prop' value }
instance Attr Button_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }


instance Attr everything Formaction  Unit  where
  attr Formaction _ = unsafeAttribute $ Left $  
    { key: "formaction", value: unset' }
instance Attr everything Formaction (Event.Event  Unit ) where
  attr Formaction eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "formaction", value: unset' }
