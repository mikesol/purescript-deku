module Deku.DOM.Attr.XChannelSelector where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XChannelSelector = XChannelSelector

instance Attr FeDisplacementMap_ XChannelSelector (NonEmpty.NonEmpty Event.Event  String ) where
  attr XChannelSelector bothValues = unsafeAttribute $ Both
    { key: "xChannelSelector", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "xChannelSelector", value: prop' value }
    )
instance Attr FeDisplacementMap_ XChannelSelector  String  where
  attr XChannelSelector value = unsafeAttribute $ This $ pure $
    { key: "xChannelSelector", value: prop' value }
instance Attr FeDisplacementMap_ XChannelSelector (Event.Event  String ) where
  attr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "xChannelSelector", value: prop' value }

instance Attr everything XChannelSelector (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XChannelSelector bothValues = unsafeAttribute $ Both
    { key: "xChannelSelector", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "xChannelSelector", value: unset' })
instance Attr everything XChannelSelector  Unit  where
  attr XChannelSelector _ = unsafeAttribute $ This $ pure $
    { key: "xChannelSelector", value: unset' }
instance Attr everything XChannelSelector (Event.Event  Unit ) where
  attr XChannelSelector eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "xChannelSelector", value: unset' }
