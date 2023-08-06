module Deku.DOM.Attr.Form where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Form = Form

instance Attr Button_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Button_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Fieldset_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Fieldset_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Input_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Input_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Label_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Label_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Meter_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Meter_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Object_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Object_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Output_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Output_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Progress_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Progress_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Select_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Select_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr Textarea_ Form  String  where
  attr Form value = unsafeAttribute $ Left $  
    { key: "form", value: prop' value }
instance Attr Textarea_ Form (Event.Event  String ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "form", value: prop' value }


instance Attr everything Form  Unit  where
  attr Form _ = unsafeAttribute $ Left $  { key: "form", value: unset' }
instance Attr everything Form (Event.Event  Unit ) where
  attr Form eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "form", value: unset' }
