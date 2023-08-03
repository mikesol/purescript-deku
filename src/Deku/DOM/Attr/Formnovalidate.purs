module Deku.DOM.Attr.Formnovalidate where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formnovalidate = Formnovalidate

instance Attr Button_ Formnovalidate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formnovalidate", value: prop' value })
instance Attr Button_ Formnovalidate  String  where
  attr Formnovalidate value = unsafeAttribute $ This $ pure $
    { key: "formnovalidate", value: prop' value }
instance Attr Button_ Formnovalidate (Event.Event  String ) where
  attr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }

instance Attr Input_ Formnovalidate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formnovalidate", value: prop' value })
instance Attr Input_ Formnovalidate  String  where
  attr Formnovalidate value = unsafeAttribute $ This $ pure $
    { key: "formnovalidate", value: prop' value }
instance Attr Input_ Formnovalidate (Event.Event  String ) where
  attr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }

instance Attr everything Formnovalidate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formnovalidate", value: unset' })
instance Attr everything Formnovalidate  Unit  where
  attr Formnovalidate _ = unsafeAttribute $ This $ pure $
    { key: "formnovalidate", value: unset' }
instance Attr everything Formnovalidate (Event.Event  Unit ) where
  attr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formnovalidate", value: unset' }
