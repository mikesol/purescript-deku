module Deku.DOM.Attr.Span where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Span = Span

instance Attr Col_ Span (NonEmpty.NonEmpty Event.Event  String ) where
  attr Span bothValues = unsafeAttribute $ Both (pure 
    { key: "span", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Col_ Span  String  where
  attr Span value = unsafeAttribute $ This $ pure $
    { key: "span", value: prop' value }
instance Attr Col_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "span", value: prop' value }

instance Attr Colgroup_ Span (NonEmpty.NonEmpty Event.Event  String ) where
  attr Span bothValues = unsafeAttribute $ Both (pure 
    { key: "span", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Colgroup_ Span  String  where
  attr Span value = unsafeAttribute $ This $ pure $
    { key: "span", value: prop' value }
instance Attr Colgroup_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "span", value: prop' value }

instance Attr everything Span (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Span bothValues = unsafeAttribute $ Both (pure  { key: "span", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "span", value: unset' })
instance Attr everything Span  Unit  where
  attr Span _ = unsafeAttribute $ This $ pure $ { key: "span", value: unset' }
instance Attr everything Span (Event.Event  Unit ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "span", value: unset' }
