module Deku.DOM.Attr.Formmethod where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formmethod = Formmethod

instance Attr Button_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ Left $  
    { key: "formmethod", value: prop' value }
instance Attr Button_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }


instance Attr Input_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ Left $  
    { key: "formmethod", value: prop' value }
instance Attr Input_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }


instance Attr everything Formmethod  Unit  where
  attr Formmethod _ = unsafeAttribute $ Left $  
    { key: "formmethod", value: unset' }
instance Attr everything Formmethod (Event.Event  Unit ) where
  attr Formmethod eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "formmethod", value: unset' }
