module Deku.DOM.Attr.SpreadMethod where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr LinearGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ This
    { key: "spreadMethod", value: prop' value }
instance Attr LinearGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr RadialGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ This
    { key: "spreadMethod", value: prop' value }
instance Attr RadialGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr everything SpreadMethod (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "spreadMethod", value: unset' })
instance Attr everything SpreadMethod  Unit  where
  attr SpreadMethod _ = unsafeAttribute $ This
    { key: "spreadMethod", value: unset' }
instance Attr everything SpreadMethod (Event.Event  Unit ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "spreadMethod", value: unset' }
