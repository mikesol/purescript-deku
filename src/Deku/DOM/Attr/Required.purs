module Deku.DOM.Attr.Required where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Required = Required

instance Attr Input_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Input_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Input_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Select_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Select_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Select_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Textarea_ Required (NonEmpty.NonEmpty Event.Event  String ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
instance Attr Textarea_ Required  String  where
  attr Required value = unsafeAttribute $ This $ pure $
    { key: "required", value: prop' value }
instance Attr Textarea_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr everything Required (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Required bothValues = unsafeAttribute $ Both (pure 
    { key: "required", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "required", value: unset' })
instance Attr everything Required  Unit  where
  attr Required _ = unsafeAttribute $ This $ pure $
    { key: "required", value: unset' }
instance Attr everything Required (Event.Event  Unit ) where
  attr Required eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "required", value: unset' }
