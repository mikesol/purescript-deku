module Deku.DOM.Attr.Formenctype where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formenctype = Formenctype

instance Attr Button_ Formenctype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formenctype", value: prop' value })
instance Attr Button_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute $ This $ pure $
    { key: "formenctype", value: prop' value }
instance Attr Button_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formenctype", value: prop' value })
instance Attr Input_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute $ This $ pure $
    { key: "formenctype", value: prop' value }
instance Attr Input_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr everything Formenctype (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formenctype", value: unset' })
instance Attr everything Formenctype  Unit  where
  attr Formenctype _ = unsafeAttribute $ This $ pure $
    { key: "formenctype", value: unset' }
instance Attr everything Formenctype (Event.Event  Unit ) where
  attr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formenctype", value: unset' }
