module Deku.DOM.Attr.Charset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Charset = Charset

instance Attr Meta_ Charset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "charset", value: prop' value })
instance Attr Meta_ Charset  String  where
  attr Charset value = unsafeAttribute $ This $ pure $
    { key: "charset", value: prop' value }
instance Attr Meta_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "charset", value: prop' value }

instance Attr Script_ Charset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "charset", value: prop' value })
instance Attr Script_ Charset  String  where
  attr Charset value = unsafeAttribute $ This $ pure $
    { key: "charset", value: prop' value }
instance Attr Script_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "charset", value: prop' value }

instance Attr everything Charset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "charset", value: unset' })
instance Attr everything Charset  Unit  where
  attr Charset _ = unsafeAttribute $ This $ pure $ { key: "charset", value: unset' }
instance Attr everything Charset (Event.Event  Unit ) where
  attr Charset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "charset", value: unset' }
