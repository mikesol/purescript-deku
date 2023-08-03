module Deku.DOM.Attr.Content where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Content = Content

instance Attr Meta_ Content (NonEmpty.NonEmpty Event.Event  String ) where
  attr Content bothValues = unsafeAttribute $ Both
    { key: "content", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "content", value: prop' value })
instance Attr Meta_ Content  String  where
  attr Content value = unsafeAttribute $ This $ pure $
    { key: "content", value: prop' value }
instance Attr Meta_ Content (Event.Event  String ) where
  attr Content eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "content", value: prop' value }

instance Attr everything Content (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Content bothValues = unsafeAttribute $ Both
    { key: "content", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "content", value: unset' })
instance Attr everything Content  Unit  where
  attr Content _ = unsafeAttribute $ This $ pure $ { key: "content", value: unset' }
instance Attr everything Content (Event.Event  Unit ) where
  attr Content eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "content", value: unset' }
