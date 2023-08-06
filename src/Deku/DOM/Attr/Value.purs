module Deku.DOM.Attr.Value where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Progress (Progress_)

data Value = Value

instance Attr Textarea_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Textarea_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Button_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Button_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Input_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Input_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Li_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Li_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Meter_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Meter_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Option_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Option_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Progress_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Progress_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr Param_ Value  String  where
  attr Value value = unsafeAttribute $ Left $  
    { key: "value", value: prop' value }
instance Attr Param_ Value (Event.Event  String ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "value", value: prop' value }


instance Attr everything Value  Unit  where
  attr Value _ = unsafeAttribute $ Left $  { key: "value", value: unset' }
instance Attr everything Value (Event.Event  Unit ) where
  attr Value eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "value", value: unset' }
