module Deku.DOM.Attr.Cols where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cols = Cols

instance Attr Textarea_ Cols (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cols bothValues = unsafeAttribute $ Both
    { key: "cols", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cols", value: prop' value })
instance Attr Textarea_ Cols  String  where
  attr Cols value = unsafeAttribute $ This $ pure $
    { key: "cols", value: prop' value }
instance Attr Textarea_ Cols (Event.Event  String ) where
  attr Cols eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cols", value: prop' value }

instance Attr everything Cols (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Cols bothValues = unsafeAttribute $ Both { key: "cols", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cols", value: unset' })
instance Attr everything Cols  Unit  where
  attr Cols _ = unsafeAttribute $ This $ pure $ { key: "cols", value: unset' }
instance Attr everything Cols (Event.Event  Unit ) where
  attr Cols eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cols", value: unset' }
