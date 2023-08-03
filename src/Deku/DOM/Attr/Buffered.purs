module Deku.DOM.Attr.Buffered where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Buffered = Buffered

instance Attr Audio_ Buffered (NonEmpty.NonEmpty Event.Event  String ) where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "buffered", value: prop' value })
instance Attr Audio_ Buffered  String  where
  attr Buffered value = unsafeAttribute $ This $ pure $
    { key: "buffered", value: prop' value }
instance Attr Audio_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }

instance Attr Video_ Buffered (NonEmpty.NonEmpty Event.Event  String ) where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "buffered", value: prop' value })
instance Attr Video_ Buffered  String  where
  attr Buffered value = unsafeAttribute $ This $ pure $
    { key: "buffered", value: prop' value }
instance Attr Video_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }

instance Attr everything Buffered (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "buffered", value: unset' })
instance Attr everything Buffered  Unit  where
  attr Buffered _ = unsafeAttribute $ This $ pure $
    { key: "buffered", value: unset' }
instance Attr everything Buffered (Event.Event  Unit ) where
  attr Buffered eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "buffered", value: unset' }
