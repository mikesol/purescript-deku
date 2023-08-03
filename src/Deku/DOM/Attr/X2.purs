module Deku.DOM.Attr.X2 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X2 = X2

instance Attr Line_ X2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr X2 bothValues = unsafeAttribute $ Both
    { key: "x2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x2", value: prop' value })
instance Attr Line_ X2  String  where
  attr X2 value = unsafeAttribute $ This $ pure $ { key: "x2", value: prop' value }
instance Attr Line_ X2 (Event.Event  String ) where
  attr X2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x2", value: prop' value }

instance Attr LinearGradient_ X2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr X2 bothValues = unsafeAttribute $ Both
    { key: "x2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x2", value: prop' value })
instance Attr LinearGradient_ X2  String  where
  attr X2 value = unsafeAttribute $ This $ pure $ { key: "x2", value: prop' value }
instance Attr LinearGradient_ X2 (Event.Event  String ) where
  attr X2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x2", value: prop' value }

instance Attr everything X2 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr X2 bothValues = unsafeAttribute $ Both { key: "x2", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "x2", value: unset' })
instance Attr everything X2  Unit  where
  attr X2 _ = unsafeAttribute $ This $ pure $ { key: "x2", value: unset' }
instance Attr everything X2 (Event.Event  Unit ) where
  attr X2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "x2", value: unset' }
