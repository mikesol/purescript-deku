module Deku.DOM.Attr.X1 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X1 = X1

instance Attr Line_ X1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr X1 bothValues = unsafeAttribute $ Both
    { key: "x1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x1", value: prop' value })
instance Attr Line_ X1  String  where
  attr X1 value = unsafeAttribute $ This $ pure $ { key: "x1", value: prop' value }
instance Attr Line_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x1", value: prop' value }

instance Attr LinearGradient_ X1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr X1 bothValues = unsafeAttribute $ Both
    { key: "x1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x1", value: prop' value })
instance Attr LinearGradient_ X1  String  where
  attr X1 value = unsafeAttribute $ This $ pure $ { key: "x1", value: prop' value }
instance Attr LinearGradient_ X1 (Event.Event  String ) where
  attr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x1", value: prop' value }

instance Attr everything X1 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr X1 bothValues = unsafeAttribute $ Both { key: "x1", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "x1", value: unset' })
instance Attr everything X1  Unit  where
  attr X1 _ = unsafeAttribute $ This $ pure $ { key: "x1", value: unset' }
instance Attr everything X1 (Event.Event  Unit ) where
  attr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "x1", value: unset' }
