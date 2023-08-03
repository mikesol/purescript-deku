module Deku.DOM.Attr.Formtarget where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formtarget = Formtarget

instance Attr Button_ Formtarget (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Button_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: prop' value }
instance Attr Button_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
instance Attr Input_ Formtarget  String  where
  attr Formtarget value = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: prop' value }
instance Attr Input_ Formtarget (Event.Event  String ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr everything Formtarget (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formtarget", value: unset' })
instance Attr everything Formtarget  Unit  where
  attr Formtarget _ = unsafeAttribute $ This $ pure $
    { key: "formtarget", value: unset' }
instance Attr everything Formtarget (Event.Event  Unit ) where
  attr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formtarget", value: unset' }
