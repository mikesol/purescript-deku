module Deku.DOM.Attr.AcceptCharset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AcceptCharset = AcceptCharset

instance Attr Form_ AcceptCharset (NonEmpty.NonEmpty Event.Event  String ) where
  attr AcceptCharset bothValues = unsafeAttribute $ Both
    { key: "accept-charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept-charset", value: prop' value })
instance Attr Form_ AcceptCharset  String  where
  attr AcceptCharset value = unsafeAttribute $ This $ pure $
    { key: "accept-charset", value: prop' value }
instance Attr Form_ AcceptCharset (Event.Event  String ) where
  attr AcceptCharset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept-charset", value: prop' value }

instance Attr everything AcceptCharset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AcceptCharset bothValues = unsafeAttribute $ Both
    { key: "accept-charset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "accept-charset", value: unset' })
instance Attr everything AcceptCharset  Unit  where
  attr AcceptCharset _ = unsafeAttribute $ This $ pure $
    { key: "accept-charset", value: unset' }
instance Attr everything AcceptCharset (Event.Event  Unit ) where
  attr AcceptCharset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accept-charset", value: unset' }
