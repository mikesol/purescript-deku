module Deku.DOM.Attr.In2 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In2 = In2

instance Attr FeBlend_ In2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
instance Attr FeBlend_ In2  String  where
  attr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
instance Attr FeBlend_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr FeComposite_ In2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
instance Attr FeComposite_ In2  String  where
  attr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
instance Attr FeComposite_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr FeDisplacementMap_ In2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
instance Attr FeDisplacementMap_ In2  String  where
  attr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
instance Attr FeDisplacementMap_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr everything In2 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr In2 bothValues = unsafeAttribute $ Both { key: "in2", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "in2", value: unset' })
instance Attr everything In2  Unit  where
  attr In2 _ = unsafeAttribute $ This { key: "in2", value: unset' }
instance Attr everything In2 (Event.Event  Unit ) where
  attr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "in2", value: unset' }
