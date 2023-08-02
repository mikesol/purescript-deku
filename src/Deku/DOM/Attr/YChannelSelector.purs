module Deku.DOM.Attr.YChannelSelector where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data YChannelSelector = YChannelSelector

instance Attr FeDisplacementMap_ YChannelSelector (NonEmpty.NonEmpty Event.Event  String ) where
  attr YChannelSelector bothValues = unsafeAttribute $ Both
    { key: "yChannelSelector", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "yChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ YChannelSelector  String  where
  attr YChannelSelector value = unsafeAttribute $ This
    { key: "yChannelSelector", value: prop' value }
instance Attr FeDisplacementMap_ YChannelSelector (Event.Event  String ) where
  attr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "yChannelSelector", value: prop' value }

instance Attr everything YChannelSelector (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr YChannelSelector bothValues = unsafeAttribute $ Both
    { key: "yChannelSelector", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "yChannelSelector", value: unset' })
instance Attr everything YChannelSelector  Unit  where
  attr YChannelSelector _ = unsafeAttribute $ This
    { key: "yChannelSelector", value: unset' }
instance Attr everything YChannelSelector (Event.Event  Unit ) where
  attr YChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "yChannelSelector", value: unset' }
