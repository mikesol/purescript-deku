module Deku.DOM.Attr.StartOffset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StartOffset bothValues = unsafeAttribute $ Both
    { key: "startOffset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "startOffset", value: prop' value })
instance Attr TextPath_ StartOffset  String  where
  attr StartOffset value = unsafeAttribute $ This
    { key: "startOffset", value: prop' value }
instance Attr TextPath_ StartOffset (Event.Event  String ) where
  attr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "startOffset", value: prop' value }

instance Attr everything StartOffset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StartOffset bothValues = unsafeAttribute $ Both
    { key: "startOffset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "startOffset", value: unset' })
instance Attr everything StartOffset  Unit  where
  attr StartOffset _ = unsafeAttribute $ This
    { key: "startOffset", value: unset' }
instance Attr everything StartOffset (Event.Event  Unit ) where
  attr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "startOffset", value: unset' }
